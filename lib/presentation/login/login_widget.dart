import '../../auth/auth_util.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
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
          begin: Offset(0, 20),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.9,
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
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0, 40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0, 60),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(0, 80),
          end: Offset(0, 0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.7,
          end: 1,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.8,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: Offset(0, 40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 700.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: Offset(0, 30),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: 0.4,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 900.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: Offset(0, 30),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: 0.4,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
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

    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).primaryColor
              ],
              stops: [0.3, 1],
              begin: AlignmentDirectional(1, -1),
              end: AlignmentDirectional(-1, 1),
            ),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 530,
                  ),
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       if (Theme.of(context).brightness ==
                          //           Brightness.light)
                          //         Image.asset(
                          //           'assets/images/logo_newforceLight_alt@3x.png',
                          //           width: 170,
                          //           height: 60,
                          //           fit: BoxFit.fitWidth,
                          //         ),
                          //       if (Theme.of(context).brightness ==
                          //           Brightness.dark)
                          //         Image.asset(
                          //           'assets/images/logo_newforceDark_alt@3x.png',
                          //           width: 170,
                          //           height: 60,
                          //           fit: BoxFit.fitWidth,
                          //         ),
                          //     ],
                          //   ).animateOnPageLoad(
                          //       animationsMap['rowOnPageLoadAnimation1']!),
                          // ),
                          
                          Text(
                            
                            FFLocalizations.of(context).getText(
                              '3p97u62u' /* Welcome Back! */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'xkz4xjo6' /* Use the form below to access y... */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText2,
                              
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation2']!),
                          ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Expanded(
                          //         child: Padding(
                          //           padding: EdgeInsetsDirectional.fromSTEB(
                          //               0, 16, 0, 0),
                          //           child: TextFormField(
                          //             controller: emailAddressController,
                          //             obscureText: false,
                          //             decoration: InputDecoration(
                          //               labelText:
                          //                   FFLocalizations.of(context).getText(
                          //                 'k9u5spqi' /* Email Address */,
                          //               ),
                          //               labelStyle: FlutterFlowTheme.of(context)
                          //                   .bodyText2,
                          //               hintText:
                          //                   FFLocalizations.of(context).getText(
                          //                 'f4xxyrqv' /* Enter your email here... */,
                          //               ),
                          //               hintStyle: FlutterFlowTheme.of(context)
                          //                   .bodyText2,
                          //               enabledBorder: OutlineInputBorder(
                          //                 borderSide: BorderSide(
                          //                   color: FlutterFlowTheme.of(context)
                          //                       .lineColor,
                          //                   width: 2,
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(40),
                          //               ),
                          //               focusedBorder: OutlineInputBorder(
                          //                 borderSide: BorderSide(
                          //                   color: FlutterFlowTheme.of(context)
                          //                       .lineColor,
                          //                   width: 2,
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(40),
                          //               ),
                          //               errorBorder: OutlineInputBorder(
                          //                 borderSide: BorderSide(
                          //                   color: Color(0x00000000),
                          //                   width: 2,
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(40),
                          //               ),
                          //               focusedErrorBorder: OutlineInputBorder(
                          //                 borderSide: BorderSide(
                          //                   color: Color(0x00000000),
                          //                   width: 2,
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(40),
                          //               ),
                          //               filled: true,
                          //               fillColor: FlutterFlowTheme.of(context)
                          //                   .secondaryBackground,
                          //               contentPadding:
                          //                   EdgeInsetsDirectional.fromSTEB(
                          //                       16, 24, 0, 24),
                          //             ),
                          //             style: FlutterFlowTheme.of(context)
                          //                 .bodyText1,
                          //           ).animateOnPageLoad(animationsMap[
                          //               'textFieldOnPageLoadAnimation1']!),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Expanded(
                          //         child: TextFormField(
                          //           controller: passwordController,
                          //           obscureText: !passwordVisibility,
                          //           decoration: InputDecoration(
                          //             labelText:
                          //                 FFLocalizations.of(context).getText(
                          //               'lfzvgi5q' /* Password */,
                          //             ),
                          //             labelStyle: FlutterFlowTheme.of(context)
                          //                 .bodyText2,
                          //             hintText:
                          //                 FFLocalizations.of(context).getText(
                          //               'wt8sx5du' /* Enter your password here... */,
                          //             ),
                          //             hintStyle: FlutterFlowTheme.of(context)
                          //                 .bodyText2,
                          //             enabledBorder: OutlineInputBorder(
                          //               borderSide: BorderSide(
                          //                 color: FlutterFlowTheme.of(context)
                          //                     .lineColor,
                          //                 width: 2,
                          //               ),
                          //               borderRadius: BorderRadius.circular(40),
                          //             ),
                          //             focusedBorder: OutlineInputBorder(
                          //               borderSide: BorderSide(
                          //                 color: FlutterFlowTheme.of(context)
                          //                     .lineColor,
                          //                 width: 2,
                          //               ),
                          //               borderRadius: BorderRadius.circular(40),
                          //             ),
                          //             errorBorder: OutlineInputBorder(
                          //               borderSide: BorderSide(
                          //                 color: Color(0x00000000),
                          //                 width: 2,
                          //               ),
                          //               borderRadius: BorderRadius.circular(40),
                          //             ),
                          //             focusedErrorBorder: OutlineInputBorder(
                          //               borderSide: BorderSide(
                          //                 color: Color(0x00000000),
                          //                 width: 2,
                          //               ),
                          //               borderRadius: BorderRadius.circular(40),
                          //             ),
                          //             filled: true,
                          //             fillColor: FlutterFlowTheme.of(context)
                          //                 .secondaryBackground,
                          //             contentPadding:
                          //                 EdgeInsetsDirectional.fromSTEB(
                          //                     16, 24, 24, 24),
                          //             suffixIcon: InkWell(
                          //               onTap: () => setState(
                          //                 () => passwordVisibility =
                          //                     !passwordVisibility,
                          //               ),
                          //               focusNode:
                          //                   FocusNode(skipTraversal: true),
                          //               child: Icon(
                          //                 passwordVisibility
                          //                     ? Icons.visibility_outlined
                          //                     : Icons.visibility_off_outlined,
                          //                 color: Color(0xFF57636C),
                          //                 size: 22,
                          //               ),
                          //             ),
                          //           ),
                          //           style:
                          //               FlutterFlowTheme.of(context).bodyText1,
                          //         ).animateOnPageLoad(animationsMap[
                          //             'textFieldOnPageLoadAnimation2']!),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       FFButtonWidget(
                          //         onPressed: () async {
                          //           context.pushNamed('forgotPassword');
                          //         },
                          //         text: FFLocalizations.of(context).getText(
                          //           's8bicxzh' /* Forgot Password? */,
                          //         ),
                          //         options: FFButtonOptions(
                          //           width: 170,
                          //           height: 40,
                          //           color: Color(0x00FFFFFF),
                          //           textStyle:
                          //               FlutterFlowTheme.of(context).bodyText2,
                          //           elevation: 0,
                          //           borderSide: BorderSide(
                          //             color: Colors.transparent,
                          //             width: 1,
                          //           ),
                          //         ),
                          //       ).animateOnPageLoad(animationsMap[
                          //           'buttonOnPageLoadAnimation1']!),
                          //       FFButtonWidget(
                          //         onPressed: () async {
                          //           GoRouter.of(context).prepareAuthEvent();

                          //           final user = await signInWithEmail(
                          //             context,
                          //             emailAddressController!.text,
                          //             passwordController!.text,
                          //           );
                          //           if (user == null) {
                          //             return;
                          //           }

                          //           context.goNamedAuth('Home', mounted);
                          //         },
                          //         text: FFLocalizations.of(context).getText(
                          //           'm9klj9ah' /* Login */,
                          //         ),
                          //         options: FFButtonOptions(
                          //           width: 130,
                          //           height: 50,
                          //           color: FlutterFlowTheme.of(context)
                          //               .primaryColor,
                          //           textStyle: FlutterFlowTheme.of(context)
                          //               .subtitle1
                          //               .override(
                          //                 fontFamily: 'Outfit',
                          //                 color: Colors.white,
                          //                 fontSize: 18,
                          //                 fontWeight: FontWeight.w500,
                          //                 useGoogleFonts: GoogleFonts.asMap()
                          //                     .containsKey(
                          //                         FlutterFlowTheme.of(context)
                          //                             .subtitle1Family),
                          //               ),
                          //           elevation: 2,
                          //           borderSide: BorderSide(
                          //             color: Colors.transparent,
                          //             width: 1,
                          //           ),
                          //           borderRadius: BorderRadius.circular(50),
                          //         ),
                          //       ).animateOnPageLoad(animationsMap[
                          //           'buttonOnPageLoadAnimation2']!),
                          //     ],
                          //   ).animateOnPageLoad(
                          //       animationsMap['rowOnPageLoadAnimation2']!),
                          // ),
                          
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'zy328lg7' /* Use a social platform to conti... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation3']!),
                          ),
                          
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: InkWell(
                                    onTap: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user =
                                          await signInWithGoogle(context);
                                      if (user == null) {
                                        return;
                                      }

                                      context.goNamedAuth('Home', mounted);
                                    },
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                      child: Container(
                                        width: 300,
                                        height: 60,
                                        decoration: BoxDecoration(
                                           color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                        ),
                                        
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color:Color.fromARGB(255, 219, 68, 55),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5,
                                                    color: Color(0x3314181B),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(0, 0),
                                              child: FaIcon(
                                                FontAwesomeIcons.google,
                                                color: FlutterFlowTheme.of(context)
                                                    .primaryBtnText,
                                                size: 24,
                                              ),
                                            ),
                                           Container(
                                            margin:EdgeInsetsDirectional.fromSTEB(
                                      2, 8, 8, 8),
                                             child: Text(
                            
                            'Continue With Google'
                            ,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).subtitle1.override(
                              color: FlutterFlowTheme.of(context)
                                                    .primaryBtnText,
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          fontWeight: FontWeight.bold,
                          )).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                                           ),
                                             ],
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                ),
                               
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         FFLocalizations.of(context).getText(
                          //           'tcu0c8bu' /* Don't have an account? */,
                          //         ),
                          //         style: FlutterFlowTheme.of(context).bodyText1,
                          //       ),
                          //       FFButtonWidget(
                          //         onPressed: () async {
                          //           context.pushNamed('createAccount');
                          //         },
                          //         text: FFLocalizations.of(context).getText(
                          //           'kk2rdqi2' /* Create Account */,
                          //         ),
                          //         options: FFButtonOptions(
                          //           width: 130,
                          //           height: 30,
                          //           color: Color(0x00FFFFFF),
                          //           textStyle: FlutterFlowTheme.of(context)
                          //               .bodyText1
                          //               .override(
                          //                 fontFamily:
                          //                     FlutterFlowTheme.of(context)
                          //                         .bodyText1Family,
                          //                 fontWeight: FontWeight.bold,
                          //                 useGoogleFonts: GoogleFonts.asMap()
                          //                     .containsKey(
                          //                         FlutterFlowTheme.of(context)
                          //                             .bodyText1Family),
                          //               ),
                          //           elevation: 0,
                          //           borderSide: BorderSide(
                          //             color: Colors.transparent,
                          //             width: 1,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ).animateOnPageLoad(
                          //       animationsMap['rowOnPageLoadAnimation4']!),
                          // ),
                       
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } }
//  Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       8, 8, 8, 8),
//                                   child: InkWell(
//                                     onTap: () async {
//                                       GoRouter.of(context).prepareAuthEvent();
//                                       final user =
//                                           await signInWithApple(context);
//                                       if (user == null) {
//                                         return;
//                                       }

//                                       context.goNamedAuth('Home', mounted);
//                                     },
//                                     child: Container(
//                                       width: 50,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .lineColor,
//                                         boxShadow: [
//                                           BoxShadow(
//                                             blurRadius: 5,
//                                             color: Color(0x3314181B),
//                                             offset: Offset(0, 2),
//                                           )
//                                         ],
//                                         shape: BoxShape.circle,
//                                       ),
//                                       alignment: AlignmentDirectional(0, 0),
//                                       child: FaIcon(
//                                         FontAwesomeIcons.apple,
//                                         color: FlutterFlowTheme.of(context)
//                                             .primaryText,
//                                         size: 24,
//                                       ),
//                                     ),
//                                   ).animateOnPageLoad(animationsMap[
//                                       'containerOnPageLoadAnimation2']!),
//                                 ),
                              