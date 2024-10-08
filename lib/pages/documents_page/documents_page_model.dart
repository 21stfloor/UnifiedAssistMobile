import '/flutter_flow/flutter_flow_util.dart';
import 'documents_page_widget.dart' show DocumentsPageWidget;
import 'package:flutter/material.dart';

class DocumentsPageModel extends FlutterFlowModel<DocumentsPageWidget> {
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
