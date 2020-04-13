import './../pages/app/index.dart';
import './../pages/details/index.dart';
import './../pages/search/index.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return App();
});

Handler detailsRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Details(
    vodId: params['vodId'].first,
    // vodId: params['vodId'][0],
  );
});

Handler searchRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Search();
});
