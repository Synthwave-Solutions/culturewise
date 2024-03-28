import '/chat_g_p_t_component/ai_chat_component_1/ai_chat_component1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'chat_ai_screen1_model.dart';
export 'chat_ai_screen1_model.dart';

class ChatAiScreen1Widget extends StatefulWidget {
  const ChatAiScreen1Widget({super.key});

  @override
  State<ChatAiScreen1Widget> createState() => _ChatAiScreen1WidgetState();
}

class _ChatAiScreen1WidgetState extends State<ChatAiScreen1Widget> {
  late ChatAiScreen1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatAiScreen1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'chat_ai_Screen_1'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_AI_SCREEN_1_chat_ai_Screen_1_ON_INI');
      // showProgressDots
      logFirebaseEvent('chat_ai_Screen_1_showProgressDots');
      setState(() {
        _model.aiResponding = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'r4w2mtxb' /* Ai Chat */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 12.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CHAT_AI_SCREEN_1_refresh_rounded_ICN_ON_');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    'chat_ai_Screen_1',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/blur_bg@1x.png',
                ).image,
              ),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: wrapWithModel(
                model: _model.aiChatComponent1Model,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: const AiChatComponent1Widget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
