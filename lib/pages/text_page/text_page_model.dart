import '/flutter_flow/flutter_flow_util.dart';
import 'text_page_widget.dart' show TextPageWidget;
import 'package:flutter/material.dart';

class TextPageModel extends FlutterFlowModel<TextPageWidget> {
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
