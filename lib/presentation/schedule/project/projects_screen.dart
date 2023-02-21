import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartify_c_r_m/database/project_db_helper.dart';
import 'package:smartify_c_r_m/database/task_db_helper.dart';
import 'package:smartify_c_r_m/model/project_model.dart';
import 'package:smartify_c_r_m/model/task_model.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import 'add_project_screen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final db = ProjectDatabaseHelper();
  final tasksDb = TaskDatabaseHelper();
  List<TaskModel> tasksList = [];

  void initState() {
    getTasks();

    super.initState();
  }

  getTasks() async {
    tasksList = await tasksDb.getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => AddProjectScreen())));
          },
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        foregroundColor: kPrimaryColor,
        title: Text('Projects'),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          width: 400,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
            child: Container(
              width: 300,
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
                  List<Widget> list = [];
                  
                  for (var i = 0; i < tasksList.length; i++) {
                    list.add(new Text(tasksList[i].taskName!));
                  }
                  print(list);
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
                                        height: 150,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        child: ListTile(
                                          leading: Text((i + 1).toString(),
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
                                          title: Text(data[i].projectName ?? '',
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
                                          subtitle: ListView(
                                            children: [
                                              Text(
                                                  data[i].projectDescription ??
                                                      '',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text('Tasks',style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                              Container(
                                                  height: 100,
                                                  child: getTaskWidgets(data[i].id!.toString()))
                                            ],
                                          ),
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
  Widget getTaskWidgets(String projectId)
  {
    List<Widget> list = [];
    var tasksListFiltered = tasksList.where((element) => element.projectId == projectId).toList();
    for(var i = 0; i < tasksListFiltered.length; i++){
        list.add(new Text('${tasksListFiltered[i].taskName!} - In ${tasksListFiltered[i].status!}'));
    }
    return new ListView(children: list);
  }
}
