// Copyright (c) 2016, Patrick Lam. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:average/app_component.dart';
import 'package:average/students_component.dart';

main() {
  bootstrap(AppComponent,
    [ROUTER_PROVIDERS,
     const Provider(LocationStrategy, useClass:HashLocationStrategy)
    ]);
}
