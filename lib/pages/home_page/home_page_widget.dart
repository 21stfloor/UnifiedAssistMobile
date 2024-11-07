import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base.dart';
import '../sms_functions.dart';
import '/components/appbar/appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/gestures.dart';
import '/walkthroughs/getting_started.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'package:volume_controller/volume_controller.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter/services.dart';

class HomePageWidget extends BasePage {
  const HomePageWidget({super.key});

  @override
  State<BasePage> createState() => _HomePageWidgetState();

}

class _HomePageWidgetState extends BasePageState<HomePageWidget> with TickerProviderStateMixin{
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // VolumeController().listener((volume) {
    //   if (volume > 0.5) {
    //     // Volume up key pressed
    //     print('Volume Up Pressed');
    //     playLoudAudio();
    //   } else {
    //     // Volume down key pressed
    //     print('Volume Down Pressed');
    //   }
    // });

    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().doneGettingStarted) {
        safeSetState(() =>
            _model.gettingStartedController = createPageWalkthrough(context));
        _model.gettingStartedController?.show(context: context);
        FFAppState().doneGettingStarted = true;
        safeSetState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }



  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar:
        PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.10),
          child:
          AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  wrapWithModel(
                    model: _model.appbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const AppbarWidget(),
                  ).addWalkthrough(
                    containerBozpghs7,
                    _model.gettingStartedController,
                  ),
                ],
                                  ),
              centerTitle: true,
              expandedTitleScale: 1.0,
                            ),
            toolbarHeight: 12.0,
                          ),
                        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                    Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).alternate,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            indicatorWeight: 4.0,
                            tabs: [
                              Tab(
                                text: 'Safety and Security',
                              ),
                              Tab(
                                text: 'Assistance',
                              ),
                              Tab(
                                text: 'First Aid Tips',
                              ).addWalkthrough(
                                tabXd3w5zvw,
                                _model.gettingStartedController,
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                              ),
                            ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
              child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                            alignment: const AlignmentDirectional(
                                                -0.9, -0.8),
                                child: Container(
                                  width: 140.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        spreadRadius: 2.0,
                                      )
                                    ],
                                    border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                          .primaryText,
                                    ),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('MapView');
                                    },
                                  child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                    mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                        child: Image.asset(
                                          'assets/images/431447620_929881572002188_5531678585389667107_n.jpg',
                                          width: 76.0,
                                          height: 79.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                        child: Text(
                                          'Location',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                              .bodyMedium
                                              .override(
                                                              fontFamily:
                                                                  'Inter',
                                                fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                              ).addWalkthrough(
                                                columnUkuh2dgb,
                                                _model.gettingStartedController,
                                ),
                                ),
                              ),
                              Align(
                                            alignment: const AlignmentDirectional(
                                                -0.9, -0.8),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                  onTap: () async {
                                                // await showDialog(
                                                //   context: context,
                                                //   builder:
                                                //       (alertDialogContext) {
                                                //     return WebViewAware(
                                                //       child: AlertDialog(
                                                //         title: const Text(
                                                //             'sample dialog'),
                                                //         content: const Text('dialog'),
                                                //         actions: [
                                                //           TextButton(
                                                //             onPressed: () =>
                                                //                 Navigator.pop(
                                                //                     alertDialogContext),
                                                //             child: const Text('Ok'),
                                                //           ),
                                                //         ],
                                                //       ),
                                                //     );
                                                //   },
                                                // );
                                  },
                                  child: Container(
                                                width: 140.0,
                                                height: 120.0,
                                    decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                                      blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                                        5.0,
                                                        5.0,
                                          ),
                                                      spreadRadius: 2.0,
                                        )
                                      ],
                                      border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                          child: Image.asset(
                                            'assets/images/433042209_973784761034372_18260664705326181_n.jpg',
                                                width: 76.0,
                                                height: 69.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                  0.0, 0.0),
                                          child: Text(
                                            'Alarm Generation',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                .bodyMedium
                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                          fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ToggleIcon(
                                          onPressed: () async {
                                                        setState(() => alarmState =
                                                            !alarmState);
                                                        final SharedPreferences myPrefs = await preferences;
                                                        myPrefs.setBool('alarmState', alarmState);
                                          },
                                                      value: alarmState,
                                          onIcon: Icon(
                                            Icons.check_box,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                .primary,
                                            size: 25.0,
                                            ),
                                          offIcon: Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                .secondaryText,
                                            size: 25.0,
                                          ),
                                                    ).addWalkthrough(
                                                      toggleIcon0a9yaxu8,
                                                      _model
                                                          .gettingStartedController,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                            alignment: const AlignmentDirectional(
                                                -0.9, -0.8),
                                child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                    onTap: () async {
                                                  context.pushNamed('SOSpage');
                                    },
                                    child: Container(
                                      width: 140.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                            .secondaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                            offset: Offset(
                                              5.0,
                                              5.0,
                                            ),
                                            spreadRadius: 2.0,
                                          )
                                        ],
                                        border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                              .primaryText,
                                        ),
                                      ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'FriendsPage');
                                                    },
                                      child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                        mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                        children: [
                                          Align(
                                            alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                            child: Text(
                                              'SOS',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                  .bodyMedium
                                                  .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: const Color(
                                                                      0xFFD00202),
                                                                  fontSize:
                                                                      40.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                                  ).addWalkthrough(
                                                    columnM9f5g4n6,
                                                    _model
                                                        .gettingStartedController,
                                    ),
                                  ),
                                ),
                              ),
                                          ),
                            ],
                          ),
                        ],
                      ),
                    ),
                              ),
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                            alignment: const AlignmentDirectional(
                                                -0.9, -0.8),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('TextPage');
                                  },
                                  child: Container(
                                    width: 140.0,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                          spreadRadius: 2.0,
                                        )
                                      ],
                                      border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                      child: Text(
                                        'TEXT',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 30.0,
                                              letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                            ).addWalkthrough(
                                              containerDm0qc91m,
                                              _model.gettingStartedController,
                                ),
                              ),
                              Align(
                                            alignment: const AlignmentDirectional(
                                                -0.9, -0.8),
                                child: Container(
                                  width: 140.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        spreadRadius: 2.0,
                                      )
                                    ],
                                    border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                          .primaryText,
                                    ),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                    onTap: () async {
                                                  context.pushNamed(
                                                      'DocumentsPage');
                                    },
                                  child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                    mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                        child: Image.asset(
                                          'assets/images/432438841_1496657320915483_2657875636603856279_n.jpg',
                                          width: 76.0,
                                          height: 79.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                        child: Text(
                                          'Documents',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                              .bodyMedium
                                              .override(
                                                              fontFamily:
                                                                  'Inter',
                                                fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                              ).addWalkthrough(
                                                columnRexx1p2x,
                                                _model.gettingStartedController,
                                ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                            alignment: const AlignmentDirectional(
                                                -0.9, -0.8),
                                child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Container(
                                    width: 140.0,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                          spreadRadius: 2.0,
                                        )
                                      ],
                                      border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                      onTap: () async {
                                                    context.pushNamed(
                                                        'ObstaclePage');
                                      },
                                      child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                            child: Image.asset(
                                              'assets/images/432420014_1590778191685102_8630911975428382350_n.jpg',
                                              width: 76.0,
                                              height: 79.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                            child: Text(
                                              'Obstacles',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                      .bodyMedium
                                                      .override(
                                                                fontFamily:
                                                                    'Inter',
                                                        fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                        fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                                ).addWalkthrough(
                                                  columnBlrj1rqc,
                                                  _model
                                                      .gettingStartedController,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                              ),
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                        ),
                                child: FlutterFlowWebView(
                            content: _model.webUrl,
                            bypass: false,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                            verticalScroll: true,
                            horizontalScroll: true,
                          ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
                  ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.gettingStartedController = null);
        },
        onSkip: () {
          return true;
        },
        onClickOverlay: (p0) {
          print('$p0');
          if(p0.identify == "doneTab1"){
            _model.tabBarController!.animateTo(1);
          }
        },
        onClickTarget: (p0) {
          if(p0.identify == "doneTab1"){
            _model.tabBarController!.animateTo(1);
          }
        },
        onClickTargetWithTapPosition: (p0, p1) {
          if(p0.identify == "doneTab1"){
            _model.tabBarController!.animateTo(1);
          }
        },
      );
}


