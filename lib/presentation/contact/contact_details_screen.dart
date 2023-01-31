
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/create_comment_widget.dart';
import '../../components/modal_success_widget.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../../flutter_flow/internationalization.dart';

class ContactDetailsScreen extends StatefulWidget {
   ContactDetailsScreen({Key? key, this.contact}) : super(key: key);
  dynamic contact;
  @override
  _ContactDetailsScreenState createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen>
    with TickerProviderStateMixin {
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240,
                    child: Stack(
                      alignment: AlignmentDirectional(-0.95, -0.7),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Image.asset(
'assets/images/letter-s.png'    ,                        
width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation']!),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.95, -0.55),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed('main_customerlist');
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['cardOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Name',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation1']!),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                widget.contact['fullName'],
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).title2,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation2']!),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x2B000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.mark_chat_unread,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(20, 12, 0, 0),
                  //   child: Container(
                  //     width: 120,
                  //     height: 32,
                  //     decoration: BoxDecoration(
                  //       color: Color(0x4D91D0E8),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     alignment: AlignmentDirectional(0, 0),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.max,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Padding(
                  //           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                  //           child: Icon(
                  //             Icons.stars_rounded,
                  //             color: FlutterFlowTheme.of(context).primaryText,
                  //             size: 24,
                  //           ),
                  //         ),
                  //         // Text(
                  //         //   FFLocalizations.of(context).getText(
                  //         //     'nxuoeukv' /* High Profile */,
                  //         //   ),
                  //         //   style: FlutterFlowTheme.of(context).bodyText1,
                  //         // ),
                  //       ],
                  //     ),
                  //   ).animateOnPageLoad(
                  //       animationsMap['containerOnPageLoadAnimation1']!),
                  // ),
                  
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'ecbeopja' /* Title */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation3']!),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.contact['jobTitle']??'',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation4']!),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'kl55bl1c' /* Company */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation5']!),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.contact['companyName']??'',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .subtitle1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle1Family,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle1Family),
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation6']!),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 12,
                    thickness: 2,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ).animateOnPageLoad(
                      animationsMap['dividerOnPageLoadAnimation']!),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 0, 0),
                    child: Text(
                      'Contact Info',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation7']!),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                    child: Icon(Icons.mobile_friendly)
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.contact['phoneNumbers'],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 30,
                                    borderWidth: 2,
                                    buttonSize: 50,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    icon: Icon(
                                      Icons.call,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 24,
                                    ),
                                    onPressed: () async {
                                      // await showModalBottomSheet(
                                      //   isScrollControlled: true,
                                      //   backgroundColor: Colors.transparent,
                                      //   barrierColor: Color(0x9A000000),
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return Padding(
                                      //       padding: MediaQuery.of(context)
                                      //           .viewInsets,
                                      //       child: Container(
                                      //         height: 370,
                                      //         child: CreateCommentWidget(),
                                      //       ),
                                      //     );
                                      //   },
                                      // ).then((value) => setState(() {}));
                                     
                                    },
                                  ),
                                
                                ],
                              ),
                             ],
                          ),
                        ),
                      ),
                        Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                    child: Icon(Icons.mail)
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.contact['emails'],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 30,
                                    borderWidth: 2,
                                    buttonSize: 50,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    icon: Icon(
                                      Icons.email,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 24,
                                    ),
                                    onPressed: () async {
                                    
                                    },
                                  ),
                                
                                ],
                              ),
                             ],
                          ),
                        ),
                      ),
                    
                    ],
                  ).animateOnPageLoad(
                      animationsMap['listViewOnPageLoadAnimation']!),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 120,
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0x19000000),
                  offset: Offset(0, -2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      // showModalBottomSheet(
                      //   isScrollControlled: true,
                      //   backgroundColor: Colors.transparent,
                      //   barrierColor: Colors.transparent,
                      //   context: context,
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: MediaQuery.of(context).viewInsets,
                      //       child: Container(
                      //         height: double.infinity,
                      //         child: ModalSuccessWidget(),
                      //       ),
                      //     );
                      //   },
                      // ).then((value) => setState(() {}));
                   
                    },
                    text:'Schedule Meeting',
                    options: FFButtonOptions(
                      width: 160,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            color: FlutterFlowTheme.of(context).primaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lineColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Send Invoice',
                    options: FFButtonOptions(
                      width: 160,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            color: FlutterFlowTheme.of(context).primaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lineColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
        ],
      ),
    );
  }
}
