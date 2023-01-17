import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logging/logging.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smartify_c_r_m/auth/auth_util.dart';
import 'package:smartify_c_r_m/database/contact_database_helper.dart';
import '../../components/command_palette_widget.dart';
import '../../components/web_nav_widget.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/contact_model.dart';


class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({Key? key}) : super(key: key);

  @override
  _CompanyDetailsScreenState createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 20),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 30),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 60),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 70),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 80),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 20),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 30),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 20),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation11': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 30),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();
 
  String? contactGroup;
  int currentIndex = 0;

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
      //             'fcyoodds' /* Customers */,
      //           ),
      //           style: FlutterFlowTheme.of(context).title1,
      //         ),
      //         actions: [],
      //         centerTitle: false,
      //         elevation: 0,
      //       )
      //     : null,
      // floatingActionButton: FloatingActionButton(
      //   elevation: 0,
      //   backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      //   onPressed: () async {},
      //   child: currentIndex==0? Container() :builSpeedDial(),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              WebNavWidget(
                iconOne: Icon(
                  Icons.dashboard_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                iconTwo: Icon(
                  Icons.group,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                iconThree: Icon(
                  Icons.home_work_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                iconFour: Icon(
                  Icons.account_circle,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                colorBgOne: FlutterFlowTheme.of(context).secondaryBackground,
                colorBgTwo: FlutterFlowTheme.of(context).primaryBackground,
                colorBgThree: FlutterFlowTheme.of(context).secondaryBackground,
                colorBgFour: FlutterFlowTheme.of(context).secondaryBackground,
                textOne: FlutterFlowTheme.of(context).secondaryText,
                textTwo: FlutterFlowTheme.of(context).primaryText,
                textThree: FlutterFlowTheme.of(context).secondaryText,
                textFour: FlutterFlowTheme.of(context).secondaryText,
                iconFive: Icon(
                  Icons.reduce_capacity,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                colorBgFive: FlutterFlowTheme.of(context).secondaryBackground,
                textFive: FlutterFlowTheme.of(context).secondaryText,
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Container(
                              width: double.infinity,
                              height: 34,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      context.pushNamed('Home');
                                    },
                                    icon: Icon(Icons.arrow_back_ios)),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 0, 0),
                                  child: Text(
                                      'Company Details',
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          )),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                currentIndex != 0?
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.search_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x1A000000),
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: double.infinity,
                                              child: CommandPaletteWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ):Container(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.94,
                              decoration: BoxDecoration(),
                              child: DefaultTabController(
                                length: 3,
                                initialIndex: 0,
                                child: Column(
                                  children: [
                                    TabBar(
                                      onTap: (index){
                                        setState(() {
                                          currentIndex = index;
                                        
                                        });
                                      },
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
                                          text: 'Profile'
                                        ),
                                        Tab(
                                          text: 'Team'
                                        ),
                                        Tab(
                                          text: 'Products'
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          Center(
                                           child: Container(
                                            height: 50,
                                            width: 200,
                                            child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(primary: FlutterFlowTheme.of(context).primaryColor),
                                            onPressed: (){
                                            context.pushNamed('addCompanyDetails');
                                           }, child: Text('Add Company Profile')),)
                                          ),
                                          Center(
                                           child: Container(
                                            height: 50,
                                            width: 200,
                                            child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(primary: FlutterFlowTheme.of(context).primaryColor),
                                            onPressed: (){
                                            context.pushNamed('addCompanyDetails');
                                           }, child: Text('Add Team Member')),)
                                          ),
                                          Center(
                                           child: Container(
                                            height: 50,
                                            width: 200,
                                            child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(primary: FlutterFlowTheme.of(context).primaryColor),
                                            onPressed: (){
                                            context.pushNamed('addCompanyDetails');
                                           }, child: Text('Add Products')),)
                                          ),
                                          // Padding(
                                          //   padding:
                                          //       EdgeInsetsDirectional.fromSTEB(
                                          //           0, 0, 0, 24),
                                          //   child: Container(
                                          //     width: 100,
                                          //     decoration: BoxDecoration(
                                          //       color:
                                          //           FlutterFlowTheme.of(context)
                                          //               .primaryBackground,
                                          //     ),
                                          //     child: FutureBuilder(
                                          //       future: db.getAllContact(),
                                          //       initialData: const [],
                                          //       builder: (BuildContext context,
                                          //           AsyncSnapshot<List>
                                          //               snapshot) {
                                          //         var data = snapshot
                                          //             .data!.where((element) => element['contactGroup'] == 'Lead').toList(); // this is the data we have to show. (list of todo)
                                          //         var datalength = data.length;

                                          //         return datalength == 0
                                          //             ? const Center(
                                          //                 child: Text(
                                          //                     'no data found'),
                                          //               )
                                          //             : ListView.builder(
                                          //                 itemCount: datalength,
                                          //                 itemBuilder:
                                          //                     (context, i) =>
                                          //                         Padding(
                                          //                   padding:
                                          //                       EdgeInsetsDirectional
                                          //                           .fromSTEB(
                                          //                               16,
                                          //                               8,
                                          //                               16,
                                          //                               0),
                                          //                   child: InkWell(
                                          //                     onTap: () async {
                                          //                       context.pushNamed(
                                          //                           'userDetails');
                                          //                     },
                                          //                     child: Container(
                                          //                       width: double
                                          //                           .infinity,
                                          //                       decoration:
                                          //                           BoxDecoration(
                                          //                         color: FlutterFlowTheme.of(
                                          //                                 context)
                                          //                             .secondaryBackground,
                                          //                         boxShadow: [
                                          //                           BoxShadow(
                                          //                             blurRadius:
                                          //                                 3,
                                          //                             color: Color(
                                          //                                 0x20000000),
                                          //                             offset:
                                          //                                 Offset(
                                          //                                     0,
                                          //                                     1),
                                          //                           )
                                          //                         ],
                                          //                         borderRadius:
                                          //                             BorderRadius
                                          //                                 .circular(
                                          //                                     12),
                                          //                       ),
                                          //                       child: Padding(
                                          //                         padding: EdgeInsetsDirectional
                                          //                             .fromSTEB(
                                          //                                 8,
                                          //                                 8,
                                          //                                 12,
                                          //                                 8),
                                          //                         child: Row(
                                          //                           mainAxisSize:
                                          //                               MainAxisSize
                                          //                                   .max,
                                          //                           crossAxisAlignment:
                                          //                               CrossAxisAlignment
                                          //                                   .center,
                                          //                           children: [
                                          //                             ClipRRect(
                                          //                                 borderRadius:
                                          //                                     BorderRadius.circular(8),
                                          //                                 child: Container(
                                          //                                     height: 40,
                                          //                                     width: 40,
                                          //                                     decoration: BoxDecoration(
                                          //                                       color: FlutterFlowTheme.of(context).primaryColor,
                                          //                                     ),
                                          //                                     child: Center(
                                          //                                       child: Text(
                                          //                                         data[i]['fullName'][0].toString().toUpperCase(),
                                          //                                         textAlign: TextAlign.center,
                                          //                                         style: TextStyle(color: Colors.white),
                                          //                                       ),
                                          //                                     ))),
                                          //                             Expanded(
                                          //                               child:
                                          //                                   Column(
                                          //                                 mainAxisSize:
                                          //                                     MainAxisSize.max,
                                          //                                 crossAxisAlignment:
                                          //                                     CrossAxisAlignment.start,
                                          //                                 children: [
                                          //                                   Padding(
                                          //                                     padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                          //                                     child: Text(
                                          //                                       data[i]['fullName'].toString().toUpperCase(),
                                          //                                       style: FlutterFlowTheme.of(context).subtitle1,
                                          //                                     ),
                                          //                                   ),
                                          //                                   Padding(
                                          //                                     padding: EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                                          //                                     child: Text(
                                          //                                       data[i]['jobTitle'].toString().toLowerCase(),
                                          //                                       style: FlutterFlowTheme.of(context).bodyText2,
                                          //                                     ),
                                          //                                   ),
                                          //                                   Padding(
                                          //                                     padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                          //                                     child: data[i]['phoneNumbers'] == null || data[i]['phoneNumbers'] ==[]?Text(
                                          //                                       data[i]['phoneNumbers'].toString().toUpperCase(),
                                          //                                       style: FlutterFlowTheme.of(context).bodyText2.override(
                                          //                                             fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                                          //                                             color: FlutterFlowTheme.of(context).primaryColor,
                                          //                                             fontSize: 12,
                                          //                                             useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                          //                                           ),
                                          //                                     ):Text(''),
                                          //                                   ),
                                          //                                 ],
                                          //                               ),
                                          //                             ),
                                          //                             GestureDetector(
                                          //                               onTap: (){
                                          //                                 },
                                          //                               child: Container(
                                          //                                 width: 50,
                                          //                                 child: Icon(
                                          //                                   FontAwesomeIcons
                                          //                                       .ellipsisVertical,
                                          //                                   color: FlutterFlowTheme.of(context)
                                          //                                       .primaryColor,
                                          //                                   size:
                                          //                                       24,
                                          //                                 ),
                                          //                               ),
                                          //                             ),
                                          //                           ],
                                          //                         ),
                                          //                       ),
                                          //                     ),
                                          //                   ).animateOnPageLoad(
                                          //                       animationsMap[
                                          //                           'containerOnPageLoadAnimation1']!),
                                          //                 ),
                                          //               );
                                          //       },
                                          //     ),
                                          //   ),
                                          // ),
                                          // Padding(
                                          //   padding:
                                          //       EdgeInsetsDirectional.fromSTEB(
                                          //           0, 0, 0, 24),
                                          //   child: Container(
                                          //     width: 100,
                                          //     decoration: BoxDecoration(
                                          //       color:
                                          //           FlutterFlowTheme.of(context)
                                          //               .primaryBackground,
                                          //     ),
                                          //     child: FutureBuilder(
                                          //       future: db.getAllContact(),
                                          //       initialData: const [],
                                          //       builder: (BuildContext context,
                                          //           AsyncSnapshot<List>
                                          //               snapshot) {
                                          //         var data = snapshot
                                          //             .data!.where((element) => element['contactGroup'] == 'Customer').toList(); // this is the data we have to show. (list of todo)
                                          //         var datalength = data.length;

                                          //         return datalength == 0
                                          //             ? const Center(
                                          //                 child: Text(
                                          //                     'no data found'),
                                          //               )
                                          //             : ListView.builder(
                                          //                 itemCount: datalength,
                                          //                 itemBuilder:
                                          //                     (context, i) =>
                                          //                         Padding(
                                          //                   padding:
                                          //                       EdgeInsetsDirectional
                                          //                           .fromSTEB(
                                          //                               16,
                                          //                               8,
                                          //                               16,
                                          //                               0),
                                          //                   child: InkWell(
                                          //                     onTap: () async {
                                          //                       context.pushNamed(
                                          //                           'userDetails');
                                          //                     },
                                          //                     child: Container(
                                          //                       width: double
                                          //                           .infinity,
                                          //                       decoration:
                                          //                           BoxDecoration(
                                          //                         color: FlutterFlowTheme.of(
                                          //                                 context)
                                          //                             .secondaryBackground,
                                          //                         boxShadow: [
                                          //                           BoxShadow(
                                          //                             blurRadius:
                                          //                                 3,
                                          //                             color: Color(
                                          //                                 0x20000000),
                                          //                             offset:
                                          //                                 Offset(
                                          //                                     0,
                                          //                                     1),
                                          //                           )
                                          //                         ],
                                          //                         borderRadius:
                                          //                             BorderRadius
                                          //                                 .circular(
                                          //                                     12),
                                          //                       ),
                                          //                       child: Padding(
                                          //                         padding: EdgeInsetsDirectional
                                          //                             .fromSTEB(
                                          //                                 8,
                                          //                                 8,
                                          //                                 12,
                                          //                                 8),
                                          //                         child: Row(
                                          //                           mainAxisSize:
                                          //                               MainAxisSize
                                          //                                   .max,
                                          //                           crossAxisAlignment:
                                          //                               CrossAxisAlignment
                                          //                                   .center,
                                          //                           children: [
                                          //                             ClipRRect(
                                          //                                 borderRadius:
                                          //                                     BorderRadius.circular(8),
                                          //                                 child: Container(
                                          //                                     height: 40,
                                          //                                     width: 40,
                                          //                                     decoration: BoxDecoration(
                                          //                                       color: FlutterFlowTheme.of(context).primaryColor,
                                          //                                     ),
                                          //                                     child: Center(
                                          //                                       child: Text(
                                          //                                         data[i]['fullName'][0].toString().toUpperCase(),
                                          //                                         textAlign: TextAlign.center,
                                          //                                         style: TextStyle(color: Colors.white),
                                          //                                       ),
                                          //                                     ))),
                                          //                             Expanded(
                                          //                               child:
                                          //                                   Column(
                                          //                                 mainAxisSize:
                                          //                                     MainAxisSize.max,
                                          //                                 crossAxisAlignment:
                                          //                                     CrossAxisAlignment.start,
                                          //                                 children: [
                                          //                                   Padding(
                                          //                                     padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                          //                                     child: Text(
                                          //                                       data[i]['fullName'].toString().toUpperCase(),
                                          //                                       style: FlutterFlowTheme.of(context).subtitle1,
                                          //                                     ),
                                          //                                   ),
                                          //                                   Padding(
                                          //                                     padding: EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                                          //                                     child: Text(
                                          //                                       data[i]['jobTitle'].toString().toLowerCase(),
                                          //                                       style: FlutterFlowTheme.of(context).bodyText2,
                                          //                                     ),
                                          //                                   ),
                                          //                                   Padding(
                                          //                                     padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                          //                                     child: data[i]['phoneNumbers'] == null || data[i]['phoneNumbers'] ==[]?Text(
                                          //                                       data[i]['phoneNumbers'].toString().toUpperCase(),
                                          //                                       style: FlutterFlowTheme.of(context).bodyText2.override(
                                          //                                             fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                                          //                                             color: FlutterFlowTheme.of(context).primaryColor,
                                          //                                             fontSize: 12,
                                          //                                             useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                          //                                           ),
                                          //                                     ):Text(''),
                                          //                                   ),
                                          //                                 ],
                                          //                               ),
                                          //                             ),
                                          //                             GestureDetector(
                                          //                               onTap: (){
                                                                        
                                          //                               },
                                          //                               child: Container(
                                          //                                 width: 50,
                                          //                                 child: Icon(
                                          //                                   FontAwesomeIcons
                                          //                                       .ellipsisVertical,
                                          //                                   color: FlutterFlowTheme.of(context)
                                          //                                       .primaryColor,
                                          //                                   size:
                                          //                                       24,
                                          //                                 ),
                                          //                               ),
                                          //                             ),
                                          //                           ],
                                          //                         ),
                                          //                       ),
                                          //                     ),
                                          //                   ).animateOnPageLoad(
                                          //                       animationsMap[
                                          //                           'containerOnPageLoadAnimation1']!),
                                          //                 ),
                                          //               );
                                          //       },
                                          //     ),
                                          //   ),
                                          // ),
                                          
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }

  showGroupDialog(String? group, dynamic contact){
      return showDialog(
          context: context,
        builder: (context) {
          return CupertinoAlertDialog(
                        title: Text('Move to $group'),
                        content: Text('Do you want to move this contact to $group'),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No'),
                          ),
                          CupertinoDialogAction(
                            onPressed: () async{
                              await updateContact(contact,group);
                               context.pushNamed(
                    'Main_customerList');
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
        }
      );
                
  }

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.restricted;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw PlatformException(
          code: 'PERMISSION_DENIED',
          message: 'Access to location data denied',
          details: null);
    } else if (permissionStatus == PermissionStatus.restricted) {
      throw PlatformException(
          code: 'PERMISSION_DISABLED',
          message: 'Location data is not available on device',
          details: null);
    }
  }

   builSpeedDial() {
   
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: Icon(Icons.group, color: Colors.white),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          onTap: () async {
            context.pushNamed('addCompanyDetails');

          },
         label: currentIndex ==0 ?'Add Company Profile': currentIndex == 1? 'Add Team':'Add Product',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }
  
 
  Future updateContact(dynamic contactModel, String? group) async {
    final contact = ContactModel(
      id: contactModel['id'],
      fullName: contactModel['fullName'],
      userId: currentUserUid,
      phoneNumbers: contactModel['phoneNumbers'],
      emails: contactModel['emails'],
      website: contactModel['website'],
      jobTitle: contactModel['jobTitle'],
      contactGroup: group,
      //locationDetails: contactModel['locationDetails']
    );

  await ContactDatabaseHelper().updateContactModel(contact);
   }

}
