import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'settings_notifications_page_model.dart';
export 'settings_notifications_page_model.dart';

class SettingsNotificationsPageWidget extends StatefulWidget {
  const SettingsNotificationsPageWidget({super.key});

  @override
  State<SettingsNotificationsPageWidget> createState() =>
      _SettingsNotificationsPageWidgetState();
}

class _SettingsNotificationsPageWidgetState
    extends State<SettingsNotificationsPageWidget> {
  late SettingsNotificationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsNotificationsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'settingsNotificationsPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 25.0,
          ),
          onPressed: () async {
            logFirebaseEvent('SETTINGS_NOTIFICATIONS_arrow_back_rounde');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'lc8fjoze' /* Settings Page */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '1r3bc48j' /* Choose what notifcations you w... */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: SwitchListTile.adaptive(
              value: _model.switchListTileValue1 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchListTileValue1 = newValue);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  '5xyl4b1r' /* Push Notifications */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Inter',
                      lineHeight: 2.0,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  'mo5q98ku' /* Receive Push notifications fro... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: const Color(0xFF8B97A2),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).secondaryBackground,
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).accent1,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
          ),
          SwitchListTile.adaptive(
            value: _model.switchListTileValue2 ??= true,
            onChanged: (newValue) async {
              setState(() => _model.switchListTileValue2 = newValue);
            },
            title: Text(
              FFLocalizations.of(context).getText(
                'e4x0xmpz' /* Email Notifications */,
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Inter',
                    lineHeight: 2.0,
                  ),
            ),
            subtitle: Text(
              FFLocalizations.of(context).getText(
                'zwmnzsnr' /* Receive email notifications fr... */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: const Color(0xFF8B97A2),
                  ),
            ),
            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
            activeColor: FlutterFlowTheme.of(context).primary,
            activeTrackColor: FlutterFlowTheme.of(context).accent1,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
          ),
          SwitchListTile.adaptive(
            value: _model.switchListTileValue3 ??= true,
            onChanged: (newValue) async {
              setState(() => _model.switchListTileValue3 = newValue);
            },
            title: Text(
              FFLocalizations.of(context).getText(
                'cfi5flwv' /* Location Services */,
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Inter',
                    lineHeight: 2.0,
                  ),
            ),
            subtitle: Text(
              FFLocalizations.of(context).getText(
                'tac1n0lp' /* Allow us to track your locatio... */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: const Color(0xFF8B97A2),
                  ),
            ),
            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
            activeColor: FlutterFlowTheme.of(context).primary,
            activeTrackColor: FlutterFlowTheme.of(context).accent1,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('SETTINGS_NOTIFICATIONS_Button-Login_ON_T');
                logFirebaseEvent('Button-Login_navigate_back');
                context.pop();
              },
              text: FFLocalizations.of(context).getText(
                'c6jgvvhs' /* Change Changes */,
              ),
              options: FFButtonOptions(
                width: 190.0,
                height: 50.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
