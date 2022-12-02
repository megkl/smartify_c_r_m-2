import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../components/command_palette_widget.dart';
import '../../components/create_comment_widget.dart';
import '../../components/web_nav_widget.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class MainContractsWidget extends StatefulWidget {
  const MainContractsWidget({Key? key}) : super(key: key);

  @override
  _MainContractsWidgetState createState() => _MainContractsWidgetState();
}

class _MainContractsWidgetState extends State<MainContractsWidget>
    with TickerProviderStateMixin {
  // final animationsMap = {
  //   'textOnPageLoadAnimation1': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       VisibilityEffect(duration: 1.ms),
  //       FadeEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: Offset(0, 20),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'containerOnPageLoadAnimation1': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       FadeEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: Offset(30, 0),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'containerOnPageLoadAnimation2': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       FadeEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: Offset(50, 0),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'containerOnPageLoadAnimation3': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       FadeEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: Offset(0, 30),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'textOnPageLoadAnimation2': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       VisibilityEffect(duration: 400.ms),
  //       FadeEffect(
  //         curve: Curves.bounceOut,
  //         delay: 400.ms,
  //         duration: 300.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.bounceOut,
  //         delay: 400.ms,
  //         duration: 300.ms,
  //         begin: Offset(0, 10),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'textOnPageLoadAnimation3': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       VisibilityEffect(duration: 400.ms),
  //       FadeEffect(
  //         curve: Curves.bounceOut,
  //         delay: 400.ms,
  //         duration: 300.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.bounceOut,
  //         delay: 400.ms,
  //         duration: 300.ms,
  //         begin: Offset(0, 20),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'containerOnPageLoadAnimation4': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       FadeEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: Offset(0, 30),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'textOnPageLoadAnimation4': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       VisibilityEffect(duration: 400.ms),
  //       FadeEffect(
  //         curve: Curves.bounceOut,
  //         delay: 400.ms,
  //         duration: 300.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.bounceOut,
  //         delay: 400.ms,
  //         duration: 300.ms,
  //         begin: Offset(0, 10),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'textOnPageLoadAnimation5': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       VisibilityEffect(duration: 400.ms),
  //       FadeEffect(
  //         curve: Curves.bounceOut,
  //         delay: 400.ms,
  //         duration: 300.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.bounceOut,
  //         delay: 400.ms,
  //         duration: 300.ms,
  //         begin: Offset(0, 20),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  // };

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -140),
          end: Offset(0, 0),
        ),
      ],
    ),
    'cardOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.6,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 30),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 60),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 70),
          end: Offset(0, 0),
        ),
      ],
    ),
    'dividerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 80),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 90),
          end: Offset(0, 0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 80),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: Offset(0, 120),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      // appBar: !isWeb
      //     ? AppBar(
      //         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      //         automaticallyImplyLeading: false,
      //         title: Text(
      //           FFLocalizations.of(context).getText(
      //             '4h88trkp' /* Contracts */,
      //           ),
      //           style: FlutterFlowTheme.of(context).title1,
      //         ),
      //         actions: [],
      //         centerTitle: false,
      //         elevation: 0,
      //       )
      //     : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: builSpeedDial(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 30, 4, 0),
          child: Container(
        
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.94,
                                decoration: BoxDecoration(),
            child: DefaultTabController(
              length: 2,
                                  initialIndex: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                   TabBar(
                                            labelColor: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            indicatorWeight: 3,
                                            tabs: [
                                              Tab(
                                                text: 'Documents'
                                              ),
                                              Tab(
                                                text: 'Notes'
                                              ),
                                            ],
                                          ),
                                          
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(20, 25, 0, 0),
                  //   child: Text(
                  //     FFLocalizations.of(context).getText(
                  //       'dkyygm1d' /* Notes */,
                  //     ),
                  //     style: FlutterFlowTheme.of(context).title1,
                  //   ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation7']!),
                  // ),
                  Expanded(
                    child: TabBarView(
                      children:[
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1611590027211-b954fd027b51?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context).getText(
                                                  'p82rjlf3' /* Alexandria Smith */,
                                                ),
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                              ),
                                              Text(
                                                FFLocalizations.of(context).getText(
                                                  '2s53b50t' /* 1m ago */,
                                                ),
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // FlutterFlowIconButton(
                                      //   borderColor: FlutterFlowTheme.of(context)
                                      //       .primaryBackground,
                                      //   borderRadius: 30,
                                      //   borderWidth: 2,
                                      //   buttonSize: 50,
                                      //   fillColor:
                                      //       FlutterFlowTheme.of(context).primaryColor,
                                      //   icon: Icon(
                                      //     Icons.add_rounded,
                                      //     color:
                                      //         FlutterFlowTheme.of(context).primaryBtnText,
                                      //     size: 24,
                                      //   ),
                                      //   onPressed: () async {
                                      //     return builSpeedDial();
                                      //     // await showModalBottomSheet(
                                      //     //   isScrollControlled: true,
                                      //     //   backgroundColor: Colors.transparent,
                                      //     //   barrierColor: Color(0x9A000000),
                                      //     //   context: context,
                                      //     //   builder: (context) {
                                      //     //     return Padding(
                                      //     //       padding: MediaQuery.of(context)
                                      //     //           .viewInsets,
                                      //     //       child: Container(
                                      //     //         height: 370,
                                      //     //         child: CreateCommentWidget(),
                                      //     //       ),
                                      //     //     );
                                      //     //   },
                                      //     // ).then((value) => setState(() {}));
                                      //   },
                                      // ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'rnaiavvh' /* Lorem ipsum dolor sit amet, co... */,
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyText2,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.mode_comment_outlined,
                                          color:
                                              FlutterFlowTheme.of(context).secondaryText,
                                          size: 24,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'bujmmf46' /* 8 */,
                                            ),
                                            style: FlutterFlowTheme.of(context).bodyText1,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'ntlrz0gk' /* Notes */,
                                            ),
                                            style: FlutterFlowTheme.of(context).bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(40),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional.fromSTEB(
                                                            12, 0, 0, 0),
                                                    child: Container(
                                                      constraints: BoxConstraints(
                                                        maxWidth: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(context)
                                                                .lineColor,
                                                        borderRadius:
                                                            BorderRadius.circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(12, 8, 12, 8),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(context)
                                                                  .getText(
                                                                'rw21s3dk' /* Randy Alcorn */,
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(context)
                                                                  .getText(
                                                                'mj096u71' /* I'm not really sure about this... */,
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional.fromSTEB(
                                                            12, 4, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(context).getText(
                                                        '1n2y2xin' /* a min ago */,
                                                      ),
                                                      style: FlutterFlowTheme.of(context)
                                                          .bodyText2,
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
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(animationsMap['listViewOnPageLoadAnimation']!),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1611590027211-b954fd027b51?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context).getText(
                                                  'p82rjlf3' /* Alexandria Smith */,
                                                ),
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                              ),
                                              Text(
                                                FFLocalizations.of(context).getText(
                                                  '2s53b50t' /* 1m ago */,
                                                ),
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // FlutterFlowIconButton(
                                      //   borderColor: FlutterFlowTheme.of(context)
                                      //       .primaryBackground,
                                      //   borderRadius: 30,
                                      //   borderWidth: 2,
                                      //   buttonSize: 50,
                                      //   fillColor:
                                      //       FlutterFlowTheme.of(context).primaryColor,
                                      //   icon: Icon(
                                      //     Icons.add_rounded,
                                      //     color:
                                      //         FlutterFlowTheme.of(context).primaryBtnText,
                                      //     size: 24,
                                      //   ),
                                      //   onPressed: () async {
                                      //     return builSpeedDial();
                                      //     // await showModalBottomSheet(
                                      //     //   isScrollControlled: true,
                                      //     //   backgroundColor: Colors.transparent,
                                      //     //   barrierColor: Color(0x9A000000),
                                      //     //   context: context,
                                      //     //   builder: (context) {
                                      //     //     return Padding(
                                      //     //       padding: MediaQuery.of(context)
                                      //     //           .viewInsets,
                                      //     //       child: Container(
                                      //     //         height: 370,
                                      //     //         child: CreateCommentWidget(),
                                      //     //       ),
                                      //     //     );
                                      //     //   },
                                      //     // ).then((value) => setState(() {}));
                                      //   },
                                      // ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'rnaiavvh' /* Lorem ipsum dolor sit amet, co... */,
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyText2,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.mode_comment_outlined,
                                          color:
                                              FlutterFlowTheme.of(context).secondaryText,
                                          size: 24,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'bujmmf46' /* 8 */,
                                            ),
                                            style: FlutterFlowTheme.of(context).bodyText1,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'ntlrz0gk' /* Notes */,
                                            ),
                                            style: FlutterFlowTheme.of(context).bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(40),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional.fromSTEB(
                                                            12, 0, 0, 0),
                                                    child: Container(
                                                      constraints: BoxConstraints(
                                                        maxWidth: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(context)
                                                                .lineColor,
                                                        borderRadius:
                                                            BorderRadius.circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(12, 8, 12, 8),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(context)
                                                                  .getText(
                                                                'rw21s3dk' /* Randy Alcorn */,
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(context)
                                                                  .getText(
                                                                'mj096u71' /* I'm not really sure about this... */,
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional.fromSTEB(
                                                            12, 4, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(context).getText(
                                                        '1n2y2xin' /* a min ago */,
                                                      ),
                                                      style: FlutterFlowTheme.of(context)
                                                          .bodyText2,
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
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(animationsMap['listViewOnPageLoadAnimation']!),
                    
                      ],
                      ),
                  ),
            
                  // Expanded(
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       if (responsiveVisibility(
                  //         context: context,
                  //         phone: false,
                  //         tablet: false,
                  //       ))
                  //         WebNavWidget(
                  //           iconOne: Icon(
                  //             Icons.dashboard_rounded,
                  //             color: FlutterFlowTheme.of(context).secondaryText,
                  //           ),
                  //           iconTwo: Icon(
                  //             Icons.group,
                  //             color: FlutterFlowTheme.of(context).secondaryText,
                  //           ),
                  //           iconThree: Icon(
                  //             Icons.home_work_rounded,
                  //             color: FlutterFlowTheme.of(context).primaryColor,
                  //           ),
                  //           iconFour: Icon(
                  //             Icons.account_circle,
                  //             color: FlutterFlowTheme.of(context).secondaryText,
                  //           ),
                  //           colorBgOne:
                  //               FlutterFlowTheme.of(context).secondaryBackground,
                  //           colorBgTwo:
                  //               FlutterFlowTheme.of(context).secondaryBackground,
                  //           colorBgThree:
                  //               FlutterFlowTheme.of(context).primaryBackground,
                  //           colorBgFour:
                  //               FlutterFlowTheme.of(context).secondaryBackground,
                  //           textOne: FlutterFlowTheme.of(context).secondaryText,
                  //           textTwo: FlutterFlowTheme.of(context).secondaryText,
                  //           textThree: FlutterFlowTheme.of(context).primaryText,
                  //           textFour: FlutterFlowTheme.of(context).secondaryText,
                  //           iconFive: Icon(
                  //             Icons.reduce_capacity,
                  //             color: FlutterFlowTheme.of(context).secondaryText,
                  //           ),
                  //           colorBgFive:
                  //               FlutterFlowTheme.of(context).secondaryBackground,
                  //           textFive: FlutterFlowTheme.of(context).secondaryText,
                  //         ),
                  //       Expanded(
                  //         child: Padding(
                  //           padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  //           child: Container(
                  //             width: 300,
                  //             decoration: BoxDecoration(
                  //               color: FlutterFlowTheme.of(context).primaryBackground,
                  //             ),
                  //             child: Column(
                  //               mainAxisSize: MainAxisSize.max,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 if (responsiveVisibility(
                  //                   context: context,
                  //                   tablet: false,
                  //                   tabletLandscape: false,
                  //                   desktop: false,
                  //                 ))
                  //                   Container(
                  //                     width: double.infinity,
                  //                     height: 34,
                  //                     decoration: BoxDecoration(
                  //                       color: FlutterFlowTheme.of(context)
                  //                           .primaryBackground,
                  //                     ),
                  //                   ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(12, 1, 0, 0),
                  //                   child: Container(
                  //                     width: double.infinity,
                  //                     decoration: BoxDecoration(
                  //                       color: FlutterFlowTheme.of(context)
                  //                           .primaryBackground,
                  //                     ),
                  //                     alignment: AlignmentDirectional(-1, 0),
                  //                     child: Padding(
                  //                       padding: EdgeInsetsDirectional.fromSTEB(
                  //                           0, 0, 16, 0),
                  //                       child: Row(
                  //                         mainAxisSize: MainAxisSize.max,
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           Padding(
                  //                             padding: EdgeInsetsDirectional.fromSTEB(
                  //                                 4, 16, 0, 0),
                  //                             child: Text(
                  //                               FFLocalizations.of(context).getText(
                  //                                 'smh1o93d' /* Contracts */,
                  //                               ),
                  //                               textAlign: TextAlign.start,
                  //                               style: FlutterFlowTheme.of(context)
                  //                                   .title1,
                  //                             ).animateOnPageLoad(animationsMap[
                  //                                 'textOnPageLoadAnimation1']!),
                  //                           ),
                  //                           FlutterFlowIconButton(
                  //                             borderColor: Colors.transparent,
                  //                             borderRadius: 30,
                  //                             borderWidth: 1,
                  //                             buttonSize: 60,
                  //                             icon: Icon(
                  //                               Icons.search_rounded,
                  //                               color: FlutterFlowTheme.of(context)
                  //                                   .primaryText,
                  //                               size: 30,
                  //                             ),
                  //                             onPressed: () async {
                  //                               await showModalBottomSheet(
                  //                                 isScrollControlled: true,
                  //                                 backgroundColor: Colors.transparent,
                  //                                 barrierColor: Color(0x1A000000),
                  //                                 context: context,
                  //                                 builder: (context) {
                  //                                   return Padding(
                  //                                     padding: MediaQuery.of(context)
                  //                                         .viewInsets,
                  //                                     child: Container(
                  //                                       height: double.infinity,
                  //                                       child: CommandPaletteWidget(),
                  //                                     ),
                  //                                   );
                  //                                 },
                  //                               ).then((value) => setState(() {}));
                  //                             },
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                  //                   child: Text(
                  //                     FFLocalizations.of(context).getText(
                  //                       't967eizl' /* Projects */,
                  //                     ),
                  //                     style: FlutterFlowTheme.of(context).subtitle2,
                  //                   ),
                  //                 ),
                  //                 Container(
                  //                   width: 700,
                  //                   height: 200,
                  //                   decoration: BoxDecoration(
                  //                     color: FlutterFlowTheme.of(context)
                  //                         .primaryBackground,
                  //                   ),
                  //                   child: ListView(
                  //                     padding: EdgeInsets.zero,
                  //                     primary: false,
                  //                     shrinkWrap: true,
                  //                     scrollDirection: Axis.horizontal,
                  //                     children: [
                  //                       Padding(
                  //                         padding: EdgeInsetsDirectional.fromSTEB(
                  //                             16, 12, 12, 12),
                  //                         child: Container(
                  //                           width: 230,
                  //                           decoration: BoxDecoration(
                  //                             color: FlutterFlowTheme.of(context)
                  //                                 .secondaryBackground,
                  //                             boxShadow: [
                  //                               BoxShadow(
                  //                                 blurRadius: 4,
                  //                                 color: Color(0x34090F13),
                  //                                 offset: Offset(0, 2),
                  //                               )
                  //                             ],
                  //                             borderRadius: BorderRadius.circular(12),
                  //                             border: Border.all(
                  //                               color: FlutterFlowTheme.of(context)
                  //                                   .lineColor,
                  //                               width: 1,
                  //                             ),
                  //                           ),
                  //                           child: Padding(
                  //                             padding: EdgeInsetsDirectional.fromSTEB(
                  //                                 0, 0, 0, 4),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Container(
                  //                                   width: double.infinity,
                  //                                   height: 120,
                  //                                   decoration: BoxDecoration(
                  //                                     color:
                  //                                         FlutterFlowTheme.of(context)
                  //                                             .primaryColor,
                  //                                     borderRadius: BorderRadius.only(
                  //                                       bottomLeft:
                  //                                           Radius.circular(0),
                  //                                       bottomRight:
                  //                                           Radius.circular(0),
                  //                                       topLeft: Radius.circular(12),
                  //                                       topRight: Radius.circular(12),
                  //                                     ),
                  //                                   ),
                  //                                   child: Padding(
                  //                                     padding: EdgeInsetsDirectional
                  //                                         .fromSTEB(12, 12, 12, 12),
                  //                                     child: Column(
                  //                                       mainAxisSize:
                  //                                           MainAxisSize.max,
                  //                                       mainAxisAlignment:
                  //                                           MainAxisAlignment
                  //                                               .spaceBetween,
                  //                                       crossAxisAlignment:
                  //                                           CrossAxisAlignment.start,
                  //                                       children: [
                  //                                         Container(
                  //                                           width: 36,
                  //                                           height: 36,
                  //                                           decoration: BoxDecoration(
                  //                                             color:
                  //                                                 Color(0x98FFFFFF),
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(12),
                  //                                           ),
                  //                                           alignment:
                  //                                               AlignmentDirectional(
                  //                                                   0, 0),
                  //                                           child: Icon(
                  //                                             Icons.desktop_windows,
                  //                                             color: Colors.white,
                  //                                             size: 20,
                  //                                           ),
                  //                                         ),
                  //                                         Text(
                  //                                           FFLocalizations.of(
                  //                                                   context)
                  //                                               .getText(
                  //                                             'dpt94d56' /* No-Code Platform Design */,
                  //                                           ),
                  //                                           style: FlutterFlowTheme
                  //                                                   .of(context)
                  //                                               .subtitle1
                  //                                               .override(
                  //                                                 fontFamily:
                  //                                                     'Outfit',
                  //                                                 color: Colors.white,
                  //                                                 fontSize: 18,
                  //                                                 fontWeight:
                  //                                                     FontWeight.w500,
                  //                                                 useGoogleFonts: GoogleFonts
                  //                                                         .asMap()
                  //                                                     .containsKey(
                  //                                                         FlutterFlowTheme.of(
                  //                                                                 context)
                  //                                                             .subtitle1Family),
                  //                                               ),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(12, 12, 12, 0),
                  //                                   child: Row(
                  //                                     mainAxisSize: MainAxisSize.max,
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .spaceBetween,
                  //                                     children: [
                  //                                       Container(
                  //                                         width: 150,
                  //                                         child: Stack(
                  //                                           alignment:
                  //                                               AlignmentDirectional(
                  //                                                   -1, 0),
                  //                                           children: [
                  //                                             Align(
                  //                                               alignment:
                  //                                                   AlignmentDirectional(
                  //                                                       -0.91, 0),
                  //                                               child: Container(
                  //                                                 width: 28,
                  //                                                 height: 28,
                  //                                                 clipBehavior:
                  //                                                     Clip.antiAlias,
                  //                                                 decoration:
                  //                                                     BoxDecoration(
                  //                                                   shape: BoxShape
                  //                                                       .circle,
                  //                                                 ),
                  //                                                 child:
                  //                                                     Image.network(
                  //                                                   'https://images.unsplash.com/photo-1610737241336-371badac3b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  //                                                   fit: BoxFit
                  //                                                       .fitWidth,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                             Align(
                  //                                               alignment:
                  //                                                   AlignmentDirectional(
                  //                                                       -0.62, 0),
                  //                                               child: Container(
                  //                                                 width: 28,
                  //                                                 height: 28,
                  //                                                 clipBehavior:
                  //                                                     Clip.antiAlias,
                  //                                                 decoration:
                  //                                                     BoxDecoration(
                  //                                                   shape: BoxShape
                  //                                                       .circle,
                  //                                                 ),
                  //                                                 child:
                  //                                                     Image.network(
                  //                                                   'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  //                                                   fit: BoxFit
                  //                                                       .fitWidth,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                             Align(
                  //                                               alignment:
                  //                                                   AlignmentDirectional(
                  //                                                       -0.35, 0),
                  //                                               child: Container(
                  //                                                 width: 28,
                  //                                                 height: 28,
                  //                                                 clipBehavior:
                  //                                                     Clip.antiAlias,
                  //                                                 decoration:
                  //                                                     BoxDecoration(
                  //                                                   shape: BoxShape
                  //                                                       .circle,
                  //                                                 ),
                  //                                                 child:
                  //                                                     Image.network(
                  //                                                   'https://images.unsplash.com/photo-1598346762291-aee88549193f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  //                                                   fit: BoxFit
                  //                                                       .fitHeight,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           ],
                  //                                         ),
                  //                                       ),
                  //                                       Icon(
                  //                                         Icons.chevron_right_rounded,
                  //                                         color: FlutterFlowTheme.of(
                  //                                                 context)
                  //                                             .secondaryText,
                  //                                         size: 24,
                  //                                       ),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ).animateOnPageLoad(animationsMap[
                  //                             'containerOnPageLoadAnimation1']!),
                  //                       ),
                  //                       Padding(
                  //                         padding: EdgeInsetsDirectional.fromSTEB(
                  //                             0, 12, 12, 12),
                  //                         child: Container(
                  //                           width: 230,
                  //                           decoration: BoxDecoration(
                  //                             color: FlutterFlowTheme.of(context)
                  //                                 .secondaryBackground,
                  //                             boxShadow: [
                  //                               BoxShadow(
                  //                                 blurRadius: 4,
                  //                                 color: Color(0x34090F13),
                  //                                 offset: Offset(0, 2),
                  //                               )
                  //                             ],
                  //                             borderRadius: BorderRadius.circular(12),
                  //                             border: Border.all(
                  //                               color: FlutterFlowTheme.of(context)
                  //                                   .lineColor,
                  //                               width: 1,
                  //                             ),
                  //                           ),
                  //                           child: Padding(
                  //                             padding: EdgeInsetsDirectional.fromSTEB(
                  //                                 0, 0, 0, 4),
                  //                             child: Column(
                  //                               mainAxisSize: MainAxisSize.max,
                  //                               children: [
                  //                                 Container(
                  //                                   width: double.infinity,
                  //                                   height: 120,
                  //                                   decoration: BoxDecoration(
                  //                                     color:
                  //                                         FlutterFlowTheme.of(context)
                  //                                             .alternate,
                  //                                     borderRadius: BorderRadius.only(
                  //                                       bottomLeft:
                  //                                           Radius.circular(0),
                  //                                       bottomRight:
                  //                                           Radius.circular(0),
                  //                                       topLeft: Radius.circular(12),
                  //                                       topRight: Radius.circular(12),
                  //                                     ),
                  //                                   ),
                  //                                   child: Padding(
                  //                                     padding: EdgeInsetsDirectional
                  //                                         .fromSTEB(12, 12, 12, 12),
                  //                                     child: Column(
                  //                                       mainAxisSize:
                  //                                           MainAxisSize.max,
                  //                                       mainAxisAlignment:
                  //                                           MainAxisAlignment
                  //                                               .spaceBetween,
                  //                                       crossAxisAlignment:
                  //                                           CrossAxisAlignment.start,
                  //                                       children: [
                  //                                         Container(
                  //                                           width: 36,
                  //                                           height: 36,
                  //                                           decoration: BoxDecoration(
                  //                                             color:
                  //                                                 Color(0x98FFFFFF),
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(12),
                  //                                           ),
                  //                                           alignment:
                  //                                               AlignmentDirectional(
                  //                                                   0, 0),
                  //                                           child: Icon(
                  //                                             Icons
                  //                                                 .design_services_outlined,
                  //                                             color: Colors.white,
                  //                                             size: 20,
                  //                                           ),
                  //                                         ),
                  //                                         Text(
                  //                                           FFLocalizations.of(
                  //                                                   context)
                  //                                               .getText(
                  //                                             '2a7y5e2w' /* Design Team Docs */,
                  //                                           ),
                  //                                           style: FlutterFlowTheme
                  //                                                   .of(context)
                  //                                               .subtitle1
                  //                                               .override(
                  //                                                 fontFamily:
                  //                                                     'Outfit',
                  //                                                 color: Colors.white,
                  //                                                 fontSize: 18,
                  //                                                 fontWeight:
                  //                                                     FontWeight.w500,
                  //                                                 useGoogleFonts: GoogleFonts
                  //                                                         .asMap()
                  //                                                     .containsKey(
                  //                                                         FlutterFlowTheme.of(
                  //                                                                 context)
                  //                                                             .subtitle1Family),
                  //                                               ),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsetsDirectional
                  //                                       .fromSTEB(12, 12, 12, 0),
                  //                                   child: Row(
                  //                                     mainAxisSize: MainAxisSize.max,
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .spaceBetween,
                  //                                     children: [
                  //                                       Container(
                  //                                         width: 150,
                  //                                         child: Stack(
                  //                                           alignment:
                  //                                               AlignmentDirectional(
                  //                                                   -1, 0),
                  //                                           children: [
                  //                                             Align(
                  //                                               alignment:
                  //                                                   AlignmentDirectional(
                  //                                                       -0.91, 0),
                  //                                               child: Container(
                  //                                                 width: 28,
                  //                                                 height: 28,
                  //                                                 clipBehavior:
                  //                                                     Clip.antiAlias,
                  //                                                 decoration:
                  //                                                     BoxDecoration(
                  //                                                   shape: BoxShape
                  //                                                       .circle,
                  //                                                 ),
                  //                                                 child:
                  //                                                     Image.network(
                  //                                                   'https://images.unsplash.com/photo-1610737241336-371badac3b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  //                                                   fit: BoxFit
                  //                                                       .fitWidth,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                             Align(
                  //                                               alignment:
                  //                                                   AlignmentDirectional(
                  //                                                       -0.62, 0),
                  //                                               child: Container(
                  //                                                 width: 28,
                  //                                                 height: 28,
                  //                                                 clipBehavior:
                  //                                                     Clip.antiAlias,
                  //                                                 decoration:
                  //                                                     BoxDecoration(
                  //                                                   shape: BoxShape
                  //                                                       .circle,
                  //                                                 ),
                  //                                                 child:
                  //                                                     Image.network(
                  //                                                   'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  //                                                   fit: BoxFit
                  //                                                       .fitWidth,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                             Align(
                  //                                               alignment:
                  //                                                   AlignmentDirectional(
                  //                                                       -0.35, 0),
                  //                                               child: Container(
                  //                                                 width: 28,
                  //                                                 height: 28,
                  //                                                 clipBehavior:
                  //                                                     Clip.antiAlias,
                  //                                                 decoration:
                  //                                                     BoxDecoration(
                  //                                                   shape: BoxShape
                  //                                                       .circle,
                  //                                                 ),
                  //                                                 child:
                  //                                                     Image.network(
                  //                                                   'https://images.unsplash.com/photo-1598346762291-aee88549193f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  //                                                   fit: BoxFit
                  //                                                       .fitHeight,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           ],
                  //                                         ),
                  //                                       ),
                  //                                       Icon(
                  //                                         Icons.chevron_right_rounded,
                  //                                         color: FlutterFlowTheme.of(
                  //                                                 context)
                  //                                             .secondaryText,
                  //                                         size: 24,
                  //                                       ),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ).animateOnPageLoad(animationsMap[
                  //                             'containerOnPageLoadAnimation2']!),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                  //                   child: Text(
                  //                     FFLocalizations.of(context).getText(
                  //                       'dlt46loo' /* Contracts */,
                  //                     ),
                  //                     style: FlutterFlowTheme.of(context).subtitle2,
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  //                   child: ListView(
                  //                     padding: EdgeInsets.zero,
                  //                     primary: false,
                  //                     shrinkWrap: true,
                  //                     scrollDirection: Axis.vertical,
                  //                     children: [
                  //                       Padding(
                  //                         padding: EdgeInsetsDirectional.fromSTEB(
                  //                             16, 0, 16, 12),
                  //                         child: InkWell(
                  //                           onTap: () async {
                  //                             context.pushNamed('projectDetails');
                  //                           },
                  //                           child: Container(
                  //                             width: 300,
                  //                             decoration: BoxDecoration(
                  //                               color: FlutterFlowTheme.of(context)
                  //                                   .secondaryBackground,
                  //                               boxShadow: [
                  //                                 BoxShadow(
                  //                                   blurRadius: 4,
                  //                                   color: Color(0x2C000000),
                  //                                   offset: Offset(0, 2),
                  //                                 )
                  //                               ],
                  //                               borderRadius:
                  //                                   BorderRadius.circular(12),
                  //                               border: Border.all(
                  //                                 color: FlutterFlowTheme.of(context)
                  //                                     .lineColor,
                  //                                 width: 1,
                  //                               ),
                  //                             ),
                  //                             child: Padding(
                  //                               padding:
                  //                                   EdgeInsetsDirectional.fromSTEB(
                  //                                       12, 8, 12, 12),
                  //                               child: Column(
                  //                                 mainAxisSize: MainAxisSize.max,
                  //                                 crossAxisAlignment:
                  //                                     CrossAxisAlignment.start,
                  //                                 children: [
                  //                                   Padding(
                  //                                     padding: EdgeInsetsDirectional
                  //                                         .fromSTEB(0, 4, 0, 0),
                  //                                     child: Row(
                  //                                       mainAxisSize:
                  //                                           MainAxisSize.max,
                  //                                       children: [
                  //                                         Padding(
                  //                                           padding:
                  //                                               EdgeInsetsDirectional
                  //                                                   .fromSTEB(
                  //                                                       0, 0, 12, 0),
                  //                                           child: Card(
                  //                                             clipBehavior: Clip
                  //                                                 .antiAliasWithSaveLayer,
                  //                                             color: FlutterFlowTheme
                  //                                                     .of(context)
                  //                                                 .primaryBackground,
                  //                                             elevation: 0,
                  //                                             shape:
                  //                                                 RoundedRectangleBorder(
                  //                                               borderRadius:
                  //                                                   BorderRadius
                  //                                                       .circular(12),
                  //                                             ),
                  //                                             child: Padding(
                  //                                               padding:
                  //                                                   EdgeInsetsDirectional
                  //                                                       .fromSTEB(2,
                  //                                                           2, 2, 2),
                  //                                               child: ClipRRect(
                  //                                                 borderRadius:
                  //                                                     BorderRadius
                  //                                                         .circular(
                  //                                                             12),
                  //                                                 child: Image.asset(
                  //                                                   'assets/images/app-icon-app-store.png',
                  //                                                   width: 60,
                  //                                                   height: 60,
                  //                                                   fit: BoxFit.cover,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                         Column(
                  //                                           mainAxisSize:
                  //                                               MainAxisSize.max,
                  //                                           crossAxisAlignment:
                  //                                               CrossAxisAlignment
                  //                                                   .start,
                  //                                           children: [
                  //                                             Text(
                  //                                               FFLocalizations.of(
                  //                                                       context)
                  //                                                   .getText(
                  //                                                 'sqmgdsam' /* ACME Co. */,
                  //                                               ),
                  //                                               style: FlutterFlowTheme
                  //                                                       .of(context)
                  //                                                   .title3,
                  //                                             ).animateOnPageLoad(
                  //                                                 animationsMap[
                  //                                                     'textOnPageLoadAnimation2']!),
                  //                                             Padding(
                  //                                               padding:
                  //                                                   EdgeInsetsDirectional
                  //                                                       .fromSTEB(0,
                  //                                                           4, 0, 0),
                  //                                               child: Text(
                  //                                                 FFLocalizations.of(
                  //                                                         context)
                  //                                                     .getText(
                  //                                                   '8t72ssfn' /* Contracts for New Opportunitie... */,
                  //                                                 ),
                  //                                                 style: FlutterFlowTheme
                  //                                                         .of(context)
                  //                                                     .bodyText2,
                  //                                               ).animateOnPageLoad(
                  //                                                   animationsMap[
                  //                                                       'textOnPageLoadAnimation3']!),
                  //                                             ),
                  //                                           ],
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                   ),
                  //                                   Divider(
                  //                                     height: 24,
                  //                                     thickness: 1,
                  //                                     color:
                  //                                         FlutterFlowTheme.of(context)
                  //                                             .lineColor,
                  //                                   ),
                  //                                   Row(
                  //                                     mainAxisSize: MainAxisSize.max,
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment.start,
                  //                                     children: [
                  //                                       Text(
                  //                                         FFLocalizations.of(context)
                  //                                             .getText(
                  //                                           'h9kiq8rj' /* Next Action */,
                  //                                         ),
                  //                                         style: FlutterFlowTheme.of(
                  //                                                 context)
                  //                                             .bodyText1,
                  //                                       ),
                  //                                       Expanded(
                  //                                         child: Padding(
                  //                                           padding:
                  //                                               EdgeInsetsDirectional
                  //                                                   .fromSTEB(
                  //                                                       4, 0, 0, 0),
                  //                                           child: Text(
                  //                                             FFLocalizations.of(
                  //                                                     context)
                  //                                                 .getText(
                  //                                               '7mjz03wi' /* Tuesday, 10:00am */,
                  //                                             ),
                  //                                             style:
                  //                                                 FlutterFlowTheme.of(
                  //                                                         context)
                  //                                                     .bodyText1
                  //                                                     .override(
                  //                                                       fontFamily: FlutterFlowTheme.of(
                  //                                                               context)
                  //                                                           .bodyText1Family,
                  //                                                       color: FlutterFlowTheme.of(
                  //                                                               context)
                  //                                                           .primaryColor,
                  //                                                       useGoogleFonts: GoogleFonts
                  //                                                               .asMap()
                  //                                                           .containsKey(
                  //                                                               FlutterFlowTheme.of(context)
                  //                                                                   .bodyText1Family),
                  //                                                     ),
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                       Container(
                  //                                         width: 90,
                  //                                         height: 32,
                  //                                         decoration: BoxDecoration(
                  //                                           color:
                  //                                               FlutterFlowTheme.of(
                  //                                                       context)
                  //                                                   .primaryText,
                  //                                           borderRadius:
                  //                                               BorderRadius.circular(
                  //                                                   32),
                  //                                         ),
                  //                                         alignment:
                  //                                             AlignmentDirectional(
                  //                                                 0, 0),
                  //                                         child: Text(
                  //                                           FFLocalizations.of(
                  //                                                   context)
                  //                                               .getText(
                  //                                             '8e820p1r' /* In Progress */,
                  //                                           ),
                  //                                           style:
                  //                                               FlutterFlowTheme.of(
                  //                                                       context)
                  //                                                   .bodyText1
                  //                                                   .override(
                  //                                                     fontFamily: FlutterFlowTheme.of(
                  //                                                             context)
                  //                                                         .bodyText1Family,
                  //                                                     color: FlutterFlowTheme.of(
                  //                                                             context)
                  //                                                         .secondaryBackground,
                  //                                                     useGoogleFonts: GoogleFonts
                  //                                                             .asMap()
                  //                                                         .containsKey(
                  //                                                             FlutterFlowTheme.of(context)
                  //                                                                 .bodyText1Family),
                  //                                                   ),
                  //                                         ),
                  //                                       ),
                  //                                     ],
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ).animateOnPageLoad(animationsMap[
                  //                             'containerOnPageLoadAnimation3']!),
                  //                       ),
                  //                       Padding(
                  //                         padding: EdgeInsetsDirectional.fromSTEB(
                  //                             16, 0, 16, 12),
                  //                         child: InkWell(
                  //                           onTap: () async {
                  //                             context.pushNamed(
                  //                                 'projectDetailsHealthAi');
                  //                           },
                  //                           child: Container(
                  //                             width: 300,
                  //                             decoration: BoxDecoration(
                  //                               color: FlutterFlowTheme.of(context)
                  //                                   .secondaryBackground,
                  //                               boxShadow: [
                  //                                 BoxShadow(
                  //                                   blurRadius: 4,
                  //                                   color: Color(0x2C000000),
                  //                                   offset: Offset(0, 2),
                  //                                 )
                  //                               ],
                  //                               borderRadius:
                  //                                   BorderRadius.circular(12),
                  //                               border: Border.all(
                  //                                 color: FlutterFlowTheme.of(context)
                  //                                     .lineColor,
                  //                                 width: 1,
                  //                               ),
                  //                             ),
                  //                             child: Padding(
                  //                               padding:
                  //                                   EdgeInsetsDirectional.fromSTEB(
                  //                                       12, 8, 12, 12),
                  //                               child: Column(
                  //                                 mainAxisSize: MainAxisSize.max,
                  //                                 crossAxisAlignment:
                  //                                     CrossAxisAlignment.start,
                  //                                 children: [
                  //                                   Padding(
                  //                                     padding: EdgeInsetsDirectional
                  //                                         .fromSTEB(0, 4, 0, 0),
                  //                                     child: Row(
                  //                                       mainAxisSize:
                  //                                           MainAxisSize.max,
                  //                                       children: [
                  //                                         Padding(
                  //                                           padding:
                  //                                               EdgeInsetsDirectional
                  //                                                   .fromSTEB(
                  //                                                       0, 0, 12, 0),
                  //                                           child: Card(
                  //                                             clipBehavior: Clip
                  //                                                 .antiAliasWithSaveLayer,
                  //                                             color: FlutterFlowTheme
                  //                                                     .of(context)
                  //                                                 .primaryBackground,
                  //                                             elevation: 0,
                  //                                             shape:
                  //                                                 RoundedRectangleBorder(
                  //                                               borderRadius:
                  //                                                   BorderRadius
                  //                                                       .circular(12),
                  //                                             ),
                  //                                             child: Padding(
                  //                                               padding:
                  //                                                   EdgeInsetsDirectional
                  //                                                       .fromSTEB(2,
                  //                                                           2, 2, 2),
                  //                                               child: ClipRRect(
                  //                                                 borderRadius:
                  //                                                     BorderRadius
                  //                                                         .circular(
                  //                                                             12),
                  //                                                 child: Image.asset(
                  //                                                   'assets/images/ic_launcher_google_play.png',
                  //                                                   width: 60,
                  //                                                   height: 60,
                  //                                                   fit: BoxFit.cover,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                         Column(
                  //                                           mainAxisSize:
                  //                                               MainAxisSize.max,
                  //                                           crossAxisAlignment:
                  //                                               CrossAxisAlignment
                  //                                                   .start,
                  //                                           children: [
                  //                                             Text(
                  //                                               FFLocalizations.of(
                  //                                                       context)
                  //                                                   .getText(
                  //                                                 '7wcrhzda' /* HealthAi */,
                  //                                               ),
                  //                                               style: FlutterFlowTheme
                  //                                                       .of(context)
                  //                                                   .title3,
                  //                                             ).animateOnPageLoad(
                  //                                                 animationsMap[
                  //                                                     'textOnPageLoadAnimation4']!),
                  //                                             Padding(
                  //                                               padding:
                  //                                                   EdgeInsetsDirectional
                  //                                                       .fromSTEB(0,
                  //                                                           4, 0, 0),
                  //                                               child: Text(
                  //                                                 FFLocalizations.of(
                  //                                                         context)
                  //                                                     .getText(
                  //                                                   'sen48p1q' /* Client Acquisition for Q3 */,
                  //                                                 ),
                  //                                                 style: FlutterFlowTheme
                  //                                                         .of(context)
                  //                                                     .bodyText2,
                  //                                               ).animateOnPageLoad(
                  //                                                   animationsMap[
                  //                                                       'textOnPageLoadAnimation5']!),
                  //                                             ),
                  //                                           ],
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                   ),
                  //                                   Divider(
                  //                                     height: 24,
                  //                                     thickness: 1,
                  //                                     color:
                  //                                         FlutterFlowTheme.of(context)
                  //                                             .lineColor,
                  //                                   ),
                  //                                   Row(
                  //                                     mainAxisSize: MainAxisSize.max,
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment.start,
                  //                                     children: [
                  //                                       Text(
                  //                                         FFLocalizations.of(context)
                  //                                             .getText(
                  //                                           'fp6xlmv9' /* Next Action */,
                  //                                         ),
                  //                                         style: FlutterFlowTheme.of(
                  //                                                 context)
                  //                                             .bodyText1,
                  //                                       ),
                  //                                       Expanded(
                  //                                         child: Padding(
                  //                                           padding:
                  //                                               EdgeInsetsDirectional
                  //                                                   .fromSTEB(
                  //                                                       4, 0, 0, 0),
                  //                                           child: Text(
                  //                                             FFLocalizations.of(
                  //                                                     context)
                  //                                                 .getText(
                  //                                               'k0rirjak' /* Tuesday, 10:00am */,
                  //                                             ),
                  //                                             style:
                  //                                                 FlutterFlowTheme.of(
                  //                                                         context)
                  //                                                     .bodyText1
                  //                                                     .override(
                  //                                                       fontFamily: FlutterFlowTheme.of(
                  //                                                               context)
                  //                                                           .bodyText1Family,
                  //                                                       color: FlutterFlowTheme.of(
                  //                                                               context)
                  //                                                           .primaryColor,
                  //                                                       useGoogleFonts: GoogleFonts
                  //                                                               .asMap()
                  //                                                           .containsKey(
                  //                                                               FlutterFlowTheme.of(context)
                  //                                                                   .bodyText1Family),
                  //                                                     ),
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                       Container(
                  //                                         width: 90,
                  //                                         height: 32,
                  //                                         decoration: BoxDecoration(
                  //                                           color:
                  //                                               FlutterFlowTheme.of(
                  //                                                       context)
                  //                                                   .primaryText,
                  //                                           borderRadius:
                  //                                               BorderRadius.circular(
                  //                                                   32),
                  //                                         ),
                  //                                         alignment:
                  //                                             AlignmentDirectional(
                  //                                                 0, 0),
                  //                                         child: Text(
                  //                                           FFLocalizations.of(
                  //                                                   context)
                  //                                               .getText(
                  //                                             'nanoxp6w' /* In Progress */,
                  //                                           ),
                  //                                           style:
                  //                                               FlutterFlowTheme.of(
                  //                                                       context)
                  //                                                   .bodyText1
                  //                                                   .override(
                  //                                                     fontFamily: FlutterFlowTheme.of(
                  //                                                             context)
                  //                                                         .bodyText1Family,
                  //                                                     color: FlutterFlowTheme.of(
                  //                                                             context)
                  //                                                         .secondaryBackground,
                  //                                                     useGoogleFonts: GoogleFonts
                  //                                                             .asMap()
                  //                                                         .containsKey(
                  //                                                             FlutterFlowTheme.of(context)
                  //                                                                 .bodyText1Family),
                  //                                                   ),
                  //                                         ),
                  //                                       ),
                  //                                     ],
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ).animateOnPageLoad(animationsMap[
                  //                             'containerOnPageLoadAnimation4']!),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SpeedDial builSpeedDial() {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: Icon(Icons.chrome_reader_mode, color: Colors.white),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          onTap: () => print('Pressed Read Later'),
          label: 'Upload Doc',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: Icon(Icons.create, color: Colors.white),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          onTap: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Color(0x9A000000),
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    height: 370,
                    child: CreateCommentWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          label: 'Write Note',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }
}
