import '../base.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friends_page_widget.dart' show FriendsPageWidget;
import 'package:flutter/material.dart';

class FriendsPageModel extends FlutterFlowModel<BasePage> {
  ///  Local state fields for this page.

  int pageIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
