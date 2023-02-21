import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartify_c_r_m/database/project_db_helper.dart';
import 'package:smartify_c_r_m/model/project_model.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import 'add_project_screen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final db = ProjectDatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: ((context) => AddProjectScreen())));
        },),
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        foregroundColor: kPrimaryColor,
        title: Text('Projects'), 
        actions: [
          
        ],
    ),
       body: SingleChildScrollView(
        child: Container(
          height: 500,
          width: 400,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: FutureBuilder<List<ProjectModel>>(
                future: db.getAllProject(),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  List<ProjectModel> data = snapshot
                      .data!; // this is the data we have to show. (list of todo)
                  var datalength = data.length;

                  return datalength == 0
                      ? const Center(
                          child: Text('no data found'),
                        )
                      : ListView.builder(
                          itemCount: datalength,
                          itemBuilder: (context, i) => Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
      
                                 
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 5),
                                    child: Stack(
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Container(
                                            height: 100,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 20),
                                            child: ListTile(
                                              title: Text(data[i].projectDescription??'',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                      )),
                                              ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        
                                       
                                      ],
                                    ),
                                  )),
                        );
                },
              ),
            ),
          ),
        ),
 ),
   
    );
  }
}