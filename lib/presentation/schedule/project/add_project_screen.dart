import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartify_c_r_m/auth/firebase_user_provider.dart';
import 'package:smartify_c_r_m/model/project_model.dart';
import 'package:smartify_c_r_m/model/task_model.dart';

import '../../../database/project_db_helper.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../contact/widget/button_widget.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  TextEditingController projectNamecontroller = TextEditingController();
  TextEditingController projectDesccontroller = TextEditingController();
  TextEditingController taskcontroller = TextEditingController();
  bool isEditPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        foregroundColor: kPrimaryColor,
        title: textFormField(context, projectNamecontroller,'Project Name', false),
        actions: [
          GestureDetector(
            onTap: (){
              addProject();
            },
            child: Center(child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Center(child: Text('SAVE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
            )),
          )
        ],
    ),
    body: Center(child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text('Add your project by typing in the project name and Description, then click on SAVE button to save it.', textAlign: TextAlign.center,),)),
    
    bottomSheet: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Container(
        height: 60,
        width: 250,
        child: textFormField(context, projectDesccontroller, 'Project Description', isEditPressed? true:false)),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
        child: GestureDetector(
          onTap: (){
            setState(() {
              isEditPressed = true;
            });
          },
          child: Icon(FontAwesomeIcons.pencil),
        )),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
        child: Icon(FontAwesomeIcons.share)),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
        child: GestureDetector(
          onTap: (){
            showActionsBottomSheet(context, '', 0);
          },
          child: Icon(FontAwesomeIcons.plus))),
    ]),
    );
     
  }
  
  Container textFormField(BuildContext context, controller, hinText, bool focus) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 0),
    child: TextFormField(
      controller: controller,
      autofocus: focus,
      style: FlutterFlowTheme.of(context).bodyText1
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w300,
                                                    ),
      decoration: new InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.redAccent, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 16,
                        bottom: 16,
                        top: 16,
                        right: 16,
                      ),
                      hintText: hinText,
                      hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                      errorStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
  );
  }
  
   Future<dynamic> showActionsBottomSheet(
      BuildContext context,dynamic data, int index) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 330,
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
                  
                  Container(
                    height: 150,
                    child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        primary: false,
        padding: const EdgeInsets.all(20),
                      children: [
                        GestureDetector(
                          onTap: () {
                           },
                          child: ActionsButtonWidget(
                            text: "Add Note",
                            textColor: Colors.white,
                            icon: FontAwesomeIcons.noteSticky,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //showGroupDialog("Lead",data[index]);
                          },
                          child: ActionsButtonWidget(
                              text: "Add Task",
                              icon: FontAwesomeIcons.check,
                              textColor: Colors.white),
                        ),
                       ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  addProject() async {
    ProjectModel projectObj = ProjectModel(
				projectName: projectNamecontroller.text, 
				projectDescription: projectDesccontroller.text, 
				status: ProjectStatus.todo.name,
        userId: currentUser!.user!.uid
			);
			try {
				await _insertProject(projectObj);
			} catch (e) {

			} finally {
				Navigator.pop(context);
				return;
			}
  }
  	Future<void> _insertProject(ProjectModel project) async {
	  ProjectDatabaseHelper projectsDb = ProjectDatabaseHelper();
	  await projectsDb.initDatabase();
	  int result = await projectsDb.insertProject(project);
	  //await projectsDb.closeDatabase();
	}

	Future<void> _updateProject(ProjectModel project) async {
	  ProjectDatabaseHelper projectsDb = ProjectDatabaseHelper();
	  await projectsDb.initDatabase();
	  int result = await projectsDb.updateProject(project);
	  await projectsDb.closeDatabase();
	}
}