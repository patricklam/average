// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library average;

import 'dart:async';
import 'dart:io';

import 'package:http_server/http_server.dart';
import 'package:logging/logging.dart';
import 'package:rpc/rpc.dart';

import 'package:average/server/studentsapi.dart';

final ApiServer _apiServer = new ApiServer(prettyPrint: true);

// Create a virtual directory used to serve our client code from
// the 'build/web' directory.
final String _buildPath =
    Platform.script.resolve('../build/web/').toFilePath();
final VirtualDirectory _clientDir = new VirtualDirectory(_buildPath);

Future main() async {
  // Add a bit of logging...
  Logger.root..level = Level.INFO
             ..onRecord.listen(print);

  // Set up a server serving the student API.
  _apiServer.addApi(new StudentsApi());
  HttpServer server =
      await HttpServer.bind(InternetAddress.ANY_IP_V4, 8088);
  server.listen(requestHandler);
  print('Server listening on http://${server.address.host}:'
        '${server.port}');
}

Future requestHandler(HttpRequest request) async {
  if (request.uri.path.startsWith('/studentsApi')) {
    // Handle the API request.
    var apiResponse;
    try {
      var apiRequest = new HttpApiRequest.fromHttpRequest(request);
      apiResponse =
          await _apiServer.handleHttpApiRequest(apiRequest);
    } catch (error, stack) {
      var exception =
          error is Error ? new Exception(error.toString()) : error;
      apiResponse = new HttpApiResponse.error(
          HttpStatus.INTERNAL_SERVER_ERROR, exception.toString(),
          exception, stack);
    }
    return sendApiResponse(apiResponse, request.response);
  } else if (request.uri.path == '/') {
    // Redirect to the index.html file. This will initiate
    // loading the client application.
    request.response.redirect(Uri.parse('/index.html'));
  } else {
    // Serve the requested file (path) from the virtual directory,
    // minus the preceeding '/'. 
    // If the request is not for a valid file, serve index.html instead.
    var fileUri = new Uri.file(_buildPath)
        .resolve(request.uri.path.substring(1));
    var file = new File(fileUri.toFilePath());
    if (await file.exists()) {
        _clientDir.serveFile(file, request);
    } else {
        var indexUri = new Uri.file(_buildPath).resolve('index.html');
        _clientDir.serveFile(new File(indexUri.toFilePath()), request);
    }
  }
}
