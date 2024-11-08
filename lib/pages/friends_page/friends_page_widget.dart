import '../base.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'friends_page_model.dart';
export 'friends_page_model.dart';

class FriendsPageWidget extends BasePage {
  const FriendsPageWidget({super.key});

  @override
  State<FriendsPageWidget> createState() => _FriendsPageWidgetState();
}

class _FriendsPageWidgetState extends BasePageState<FriendsPageWidget>
    with TickerProviderStateMixin {
  late FriendsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendsPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          onPressed: () async {
                            context.pop();
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(63.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'FRIENDS',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'ONBOARD FRIENDS AND MAKE THEM YOUR SOS CONTACT',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.pageIndex = 0;
                            });
                          },
                          child: Text(
                          'MY FRIENDS',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.pageIndex = 1;
                            });
                          },
                          child: Text(
                          'REQUEST',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
                Stack(
                children: [
                    Builder(
                      builder: (context) {
                        if (_model.pageIndex == 1) {
                          return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.8,
                    decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 0.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: FlutterFlowButtonTabBar(
                              useToggleButtonStyle: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              labelColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              unselectedBackgroundColor: const Color(0xFF5A3E3F),
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                              unselectedBorderColor:
                                  FlutterFlowTheme.of(context).primary,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              elevation: 0.0,
                              buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              tabs: const [
                                Tab(
                                  text: 'RECEIVED',
                                ),
                                Tab(
                                  text: 'INVITED',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                    StreamBuilder<List<RequestsRecord>>(
                                      stream: queryRequestsRecord(
                                        queryBuilder: (requestsRecord) =>
                                            requestsRecord.where(
                                          'to',
                                          isEqualTo: currentUserReference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<RequestsRecord>
                                            requestsListViewRequestsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              requestsListViewRequestsRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, requestsListViewIndex) {
                                            final requestsListViewRequestsRecord =
                                                requestsListViewRequestsRecordList[
                                                    requestsListViewIndex];
                                            return StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  requestsListViewRequestsRecord
                                                      .from!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listTileUsersRecord =
                                                    snapshot.data!;
                                                return Slidable(
                                                  endActionPane: ActionPane(
                                                    motion:
                                                        const ScrollMotion(),
                                                    extentRatio: 0.5,
                                                    children: [
                                                      SlidableAction(
                                                        label: 'Accept',
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        icon: Icons.check_sharp,
                                                        onPressed: (_) async {
                                                          final firestoreBatch =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .batch();
                                                          try {
                                                            firestoreBatch.set(
                                                                ContactsRecord
                                                                    .collection
                                                                    .doc(),
                                                                createContactsRecordData(
                                                                  fullName:
                                                                      listTileUsersRecord
                                                                          .displayName,
                                                                  phoneNumber:
                                                                      listTileUsersRecord
                                                                          .phoneNumber,
                                                                  owner:
                                                                    requestsListViewRequestsRecord.to,
                                                                ));
                                                            firestoreBatch.delete(
                                                                requestsListViewRequestsRecord
                                                                    .reference);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Invite was accepted!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }
                                                          catch(error){
                                                            print(error);
                                                          }
                                                          finally {
                                                            await firestoreBatch
                                                                .commit();
                                                          }
                                                        },
                                                      ),
                                                      SlidableAction(
                                                        label: 'Reject',
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        icon: Icons.close,
                                                        onPressed: (_) async {
                                                          await requestsListViewRequestsRecord
                                                              .reference
                                                              .delete();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Invite was reject!',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  child: ListTile(
                                                    title: Text(
                                                      listTileUsersRecord
                                                          .displayName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily: 'Sora',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    subtitle: Text(
                                                      'wants to add you as friend ${dateTimeFormat('relative', requestsListViewRequestsRecord.date)}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    trailing: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    tileColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    dense: false,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                          StreamBuilder<List<RequestsRecord>>(
                                            stream: queryRequestsRecord(
                                              queryBuilder: (requestsRecord) =>
                                                  requestsRecord.where(
                                                'from',
                                                isEqualTo: currentUserReference,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<RequestsRecord>
                                                  columnRequestsRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                        child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnRequestsRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnRequestsRecord =
                                                        columnRequestsRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                columnRequestsRecord
                                                                    .to!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final containerUsersRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0x75FF6A73),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                                  Icons
                                                                      .account_circle,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                    Text(
                                                                      functions.addLeadingZeroIfNeeded(
                                                                  containerUsersRecord
                                                                              .phoneNumber),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                        fontSize:
                                                                            20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                            fontWeight:
                                                                            FontWeight.bold,
                                                          ),
                                                    ),
                                                    Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: const Text('Confirm cancel'),
                                                                                  content: const Text('Are you sure you want to cancel this invite?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: const Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: const Text('Confirm'),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        await columnRequestsRecord
                                                                            .reference
                                                                            .delete();
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Invite was successfully cancelled',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      }
                                                        },
                                                            text:
                                                                'Cancel Invite',
                                                        options:
                                                            FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                              .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                            color:
                                                                                Colors.white,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                                      elevation:
                                                                          3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                                        width:
                                                                            1.0,
                                                          ),
                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                          );
                                                        },
                                              ),
                                                    );
                                                  }),
                                            ),
                                              );
                                            },
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: FFButtonWidget(
                                                onPressed: () async {
                                                context.pushNamed('SOSpage');
                                            },
                                            text: '',
                                            icon: Icon(
                                              Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                              size: 50.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 65.0,
                                              padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                              textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(45.0),
                                                bottomRight:
                                                    Radius.circular(45.0),
                                                    topLeft:
                                                        Radius.circular(45.0),
                                                    topRight:
                                                        Radius.circular(45.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                          );
                        } else {
                          return AuthUserStreamWidget(
                        builder: (context) =>
                      StreamBuilder<List<ContactsRecord>>(
                        stream: queryContactsRecord(
                                queryBuilder: (contactsRecord) => contactsRecord
                                    .where(
                            'owner',
                            isEqualTo: currentUserReference,
                                    )
                                    .where(
                                'phone_number',
                                      isNotEqualTo: currentPhoneNumber,
                              ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ContactsRecord>
                              friendsListViewContactsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                              itemCount:
                                  friendsListViewContactsRecordList.length,
                            itemBuilder: (context, friendsListViewIndex) {
                              final friendsListViewContactsRecord =
                                  friendsListViewContactsRecordList[
                                      friendsListViewIndex];
                              return Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  extentRatio: 0.25,
                                  children: [
                                          SlidableAction(
                                      label: 'Delete',
                                      backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      icon: Icons.delete_forever_sharp,
                                      onPressed: (_) async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: const Text(
                                                            'Confirm delete'),
                                                        content: const Text(
                                                            'Are you sure you want to delete this contact?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                              child: const Text(
                                                                  'Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                              child: const Text(
                                                                  'Confirm'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await friendsListViewContactsRecord
                                              .reference
                                              .delete();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Contact was deleted successfully',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                            return;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: IconButton(onPressed: () async {
                                    await friendsListViewContactsRecord
                                        .reference
                                        .update(
                                        createContactsRecordData(
                                          receiveSOS:
                                          !friendsListViewContactsRecord
                                              .receiveSOS,
                                        ));

                                  }, icon:

                                  Icon(
                                      color: valueOrDefault<Color>(
                                        friendsListViewContactsRecord
                                            .receiveSOS ||
                                            (friendsListViewContactsRecord
                                                .hasReceiveSOS() ==
                                                false)
                                            ? FlutterFlowTheme.of(context)
                                            .success
                                            : FlutterFlowTheme.of(context)
                                            .accent1,
                                        FlutterFlowTheme.of(context).accent1,
                                      ),
                                      valueOrDefault<IconData>(
                                  friendsListViewContactsRecord
                                      .receiveSOS ||
                                  (friendsListViewContactsRecord
                                      .hasReceiveSOS() ==
                                      false)
                                      ? Icons.toggle_off_rounded
                                      : Icons.toggle_on_rounded,
                                        Icons.toggle_off_rounded,
                                )
                                  )


                                  ),
                                title: Text(
                                  friendsListViewContactsRecord.fullName,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Sora',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                subtitle: Text(
                                          functions.addLeadingZeroIfNeeded(
                                              friendsListViewContactsRecord
                                                  .phoneNumber),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),

                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                dense: false,
                                ),
                              );
                            },
                          );
                        },
                      ),
                          );
                        }
                      },
                      ),
                ],
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
