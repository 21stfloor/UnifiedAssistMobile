import '/components/appbar/appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String webUrl = 'https://21stfloor.github.io/UnifiedAssist/';
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? gettingStartedController;
  // Model for appbar component.
  late AppbarModel appbarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
  }

  @override
  void dispose() {
    gettingStartedController?.finish();
    appbarModel.dispose();
    tabBarController?.dispose();
  }
}
