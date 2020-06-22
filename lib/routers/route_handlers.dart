import './../pages/app/index.dart';
import './../pages/details/index.dart';
import './../pages/search/index.dart';
import './../pages/live/index.dart';
import './../pages/live/show_lives.dart';
import './../pages/custom/index.dart';
import './../pages/music/index.dart';

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

Handler liveRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Live();
});

Handler showLivesRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return VideoWidget(
    address: params['address'].first,
    index: int.parse(params['index'].first),
    url: params['url'].first,
  );
});

Handler customRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Custom();
});

Handler musicRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Music(songInfo: params['songInfo'].first);
});
