import '/flutter_flow/flutter_flow_util.dart';
import 'obstacle_page_widget.dart' show ObstaclePageWidget;
import 'package:flutter/material.dart';

class ObstaclePageModel extends FlutterFlowModel<ObstaclePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
