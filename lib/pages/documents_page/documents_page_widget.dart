import 'dart:io';
import 'dart:convert';
import 'package:docx_to_text/docx_to_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import '../base.dart';
import '../text_page/text_page_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'documents_page_model.dart';
export 'documents_page_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DocumentsPageWidget extends BasePage {
  const DocumentsPageWidget({super.key});

  @override
  State<DocumentsPageWidget> createState() => _DocumentsPageWidgetState();
}

class _DocumentsPageWidgetState extends BasePageState<DocumentsPageWidget> {
  late DocumentsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String textToRead = "";
  final player = AudioPlayer();
  bool _isLoadingVoice = false;
  List<Uint8List> audioBytes = [];
  int _currentIndex = -1;
  final String voiceRachel =
      '21m00Tcm4TlvDq8ikWAM';

  final String voiceUrl = 'https://api.elevenlabs.io/v1/text-to-speech/21m00Tcm4TlvDq8ikWAM';
  List<String> paragraphs = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocumentsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();
    player.dispose();
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
          preferredSize: const Size.fromHeight(90.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(-1.0, 0.0),
                    end: const AlignmentDirectional(1.0, 0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'DOCUMENTS',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          // Column(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Switch.adaptive(
                          //       value: _model.switchValue ??= true,
                          //       onChanged: (newValue) async {
                          //         setState(
                          //             () => _model.switchValue = newValue);
                          //       },
                          //       activeColor:
                          //           FlutterFlowTheme.of(context).primary,
                          //       activeTrackColor:
                          //           FlutterFlowTheme.of(context).accent4,
                          //       inactiveTrackColor:
                          //           FlutterFlowTheme.of(context).primaryText,
                          //       inactiveThumbColor:
                          //           FlutterFlowTheme.of(context).secondaryText,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: const AlignmentDirectional(-1, -1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(-1, -1),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              paragraphs.toString(),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                fontFamily: 'Inter',
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        try {
                          if(_isLoadingVoice){
                            return;
                          }

                          String? filePath = await FilePicker.platform
                              .pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['docx', 'doc'],
                          ).then((value) => value?.files.single.path);
                          if (filePath != null) {
                            var documentText = await readDocxFile(filePath);

                            setState(() {
                              paragraphs = splitString(documentText, 2500);
                            });

                            audioBytes.clear();
                            if (player.playing) {
                              player.stop();
                            }
                            setState(() {
                              _currentIndex = -1;
                            });
                            // print(textToRead); // Use the extracted text as needed
                            for (String text in paragraphs) {
                              var newAudio = await getTextToSpeech(
                                  removeNewLines(text));
                              if (newAudio != null) {
                                audioBytes.add(newAudio);
                              }
                            }
                            _playNext();
                          }
                        }
                        catch(exception){
                          Fluttertoast.showToast(
                              msg: exception.toString());
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).secondary
                            ],
                            stops: const [0.0, 1.0],
                            begin: const AlignmentDirectional(-1.0, 0.0),
                            end: const AlignmentDirectional(1.0, 0),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child:
                          _isLoadingVoice? Container():
                          Icon(
                            Icons.upload,
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            size: 50,
                          ),
                    ),
                  ),
                      ),
                    ),
                ].divide(const SizedBox(height: 20.0)),
                            ),
                            ),
                        ),
          ),
        ),
      );
  }

  String removeNewLines(String input) {
    return input.replaceAll('\n', '');
  }

  List<String> splitString(String input, int maxCharactersPerIndex) {
    List<String> result = [];
    for (int i = 0; i < input.length; i += maxCharactersPerIndex) {
      int endIndex = i + maxCharactersPerIndex;
      if (endIndex < input.length) {
        result.add(input.substring(i, endIndex));
      } else {
        result.add(input.substring(i));
      }
    }
    return result;
  }


  Future<void> _playNext() async {
    if (_currentIndex < audioBytes.length - 1) {
      setState(() {
        _currentIndex++;
      });

      await player.setAudioSource(MyCustomSource(audioBytes[_currentIndex]));
      await player.play();
    }
  }

  Future<void> _playPrevious() async {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      await player.setAudioSource(MyCustomSource(audioBytes[_currentIndex]));
      await player.play();
    }
  }


  Future<String> readDocxFile(String filePath) async {
    final file = File(filePath);

    final bytes = await file.readAsBytes();

    final text = docxToText(bytes, handleNumbering: true);

    return text;
  }

  Future<Uint8List?> getTextToSpeech(String textToRead) async {
    setState(() {
      _isLoadingVoice = true;
    });

    final response = await http.post(
      Uri.parse(voiceUrl),
      headers: {
        'accept': 'audio/mpeg',
        'xi-api-key': dotenv.get('EL_API_KEY'),
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "text": textToRead,
        "model_id": "eleven_monolingual_v1",
        "voice_settings": {"stability": .15, "similarity_boost": .75}
      }),
    );

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes; //get the bytes ElevenLabs sent back
      return bytes;

    } else {
      Fluttertoast.showToast(
          msg: response.body);
      // throw Exception('Failed to load audio');
      // setState(() {
      //   _isLoadingVoice = false;
      // });
      return null;
    }
  }

}
