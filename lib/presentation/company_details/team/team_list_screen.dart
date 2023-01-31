import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartify_c_r_m/database/team_database_helper.dart';
import 'package:smartify_c_r_m/presentation/company_details/team/update_team_screen.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../contact/widget/button_widget.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({Key? key}) : super(key: key);

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
 final scaffoldKey = GlobalKey<ScaffoldState>();
  final db = TeamDatabaseHelper();
  String? contactGroup;
  int currentIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: 
      !isLoading? GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child:  FutureBuilder(
                                                future: db.getAllTeam(),
                                                initialData: const [],
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<List>
                                                        snapshot) {
                                                  var data = snapshot
                                                      .data; // this is the data we have to show. (list of todo)
                                                  var datalength = data!.length;

                                                  return datalength == 0
                                                      ? const Center(
                                                          child: Text(
                                                              'no data found'),
                                                        )
                                                      : ListView.builder(
                                                          itemCount: datalength,
                                                          itemBuilder:
                                                              (context, i) =>
                                                                  Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16,
                                                                        8,
                                                                        16,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'userDetails');
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          3,
                                                                      color: Color(
                                                                          0x20000000),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          12,
                                                                          8),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          child: Container(
                                                                              height: 40,
                                                                              width: 40,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  data[i]['fullName'][0].toString().toUpperCase(),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(color: Colors.white),
                                                                                ),
                                                                              ))),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                              child: Text(
                                                                                data[i]['fullName'].toString().toUpperCase(),
                                                                                style: FlutterFlowTheme.of(context).subtitle1,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                                                                              child: Text(
                                                                                data[i]['phoneNumbers'].toString().toLowerCase(),
                                                                                style: FlutterFlowTheme.of(context).bodyText2,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                              child: data[i]['phoneNumbers'] == null || data[i]['phoneNumbers'] ==[]?Text(
                                                                                data[i]['phoneNumbers'].toString().toUpperCase(),
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      fontSize: 12,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                    ),
                                                                              ):Text(''),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap: (){
                                                                          showActionsBottomSheet(
                                                context,data, i);
                                                                        },
                                                                        child: Container(
                                                                          width: 50,
                                                                          child: Icon(
                                                                            FontAwesomeIcons
                                                                                .ellipsisVertical,
                                                                            color: FlutterFlowTheme.of(context)
                                                                                .primaryColor,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ),
                                                        );
                                                },
                                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ): Center(child: CircularProgressIndicator(),) 
    );
  }

    Future<dynamic> showActionsBottomSheet(
      BuildContext context,dynamic data, int index) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Actions",
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateTeamScreen(contact: data[index],)));
                         },
                        child: ActionsButtonWidget(
                          text: "Edit",
                          textColor: Colors.white,
                          icon: FontAwesomeIcons.penClip,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: ActionsButtonWidget(
                            text: "Remove",
                            textColor: Colors.white,
                            icon: Icons.delete),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

}
