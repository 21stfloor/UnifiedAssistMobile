import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 's_o_spage_model.dart';
export 's_o_spage_model.dart';

class SOSpageWidget extends StatefulWidget {
  const SOSpageWidget({super.key});

  @override
  State<SOSpageWidget> createState() => _SOSpageWidgetState();
}

class _SOSpageWidgetState extends State<SOSpageWidget> {
  late SOSpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SOSpageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
          preferredSize:
          Size.fromHeight(MediaQuery.sizeOf(context).height * 0.15),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
            ),
            title: Text(
              'SOS',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 34.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'ADD FRIEND',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.groups_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 60.0,
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                        _model.dropDownValue ??= 'PH',
                                      ),
                                  options: const ['PH'],
                                  onChanged: (val) =>
                                      setState(() => _model.dropDownValue = val),
                                  width: 70.0,
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,

                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 16.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                                  borderWidth: 1.0,
                                  borderRadius: 3.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Container(
                                width: 200.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(3.0),
                                    bottomRight: Radius.circular(3.0),
                                    topLeft: Radius.circular(3.0),
                                    topRight: Radius.circular(3.0),
                                  ),
                                  border: Border.all(
                                    color:
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                ),
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '+63',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.7,
                                      child: SizedBox(
                                        height: 30.0,
                                        child: VerticalDivider(
                                          thickness: 1.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          alignLabelWithHint: false,
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                          UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 8.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLength: 11,
                                        keyboardType: TextInputType.phone,
                                        validator: _model.textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 50.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(3.0),
                                    bottomRight: Radius.circular(3.0),
                                    topLeft: Radius.circular(3.0),
                                    topRight: Radius.circular(3.0),
                                  ),
                                  border: Border.all(
                                    color:
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                ),
                                child: Icon(
                                  Icons.perm_contact_cal_outlined,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  size: 35.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??= true,
                                  onChanged: (newValue) async {
                                    setState(
                                            () => _model.checkboxValue = newValue!);
                                  },
                                  side: BorderSide(
                                    width: 2,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                  activeColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                                  checkColor: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              Text(
                                'Make this person my SOS contact',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 155.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(3.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.groups,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Who is a Friend?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Friend is someone who receives your live\nlocation when you use the Track Me feature.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.userFriends,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 22.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Who is an SOS contact?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'An SOS contact receives your SOS alerts\nduring an emergency.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('FriendsPage');
                            },
                            text: 'ADD SOS CONTACT',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
