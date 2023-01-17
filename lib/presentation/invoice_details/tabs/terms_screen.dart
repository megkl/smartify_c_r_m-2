import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  TextEditingController termsController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showAddTermsDialog();
        },
        child: Center(
            child: Text(
          'Add Terms',
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        )),
      ),
       body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Card(
              child: Container(
                child: ListTile(
                  leading: IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.penClip)),
                  trailing: IconButton(
                    onPressed: (){
                      setState(() {
isChecked?isChecked = false: isChecked = true;
                        
                      });
                    },
                    icon: isChecked? Icon(Icons.check_box) :Icon(Icons.check_box_outline_blank)),
                  title:  Text('30% payment should be made before start of project and on completion the rest shall be paid before submitting the project to the customer.', style: FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context).bodyText2.color,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),),
                                      ), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ]),
      ),
   
    );
  }

  showAddTermsDialog() {
    StateSetter _setState;
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Terms Info', style: FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),),
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: FlutterFlowTheme.of(context).primaryColor),
                          child: IconButton(
                        icon: Icon(Icons.close,color: Colors.white,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ))
                    ],
                  ),
                  content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    _setState = setState;
                    return SingleChildScrollView(
                        child: Column(
                      children: [
                        textFormFields(
                            controller: termsController,
                            textInputType: TextInputType.text,
                            hintText: 'Enter terms and conditions'),
                        SizedBox(
                          height: 20,
                        ),
                        Material(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: 300,
                        height: 50,
                        alignment: Alignment.center,
                        child: "Add Terms"
                            .text
                            .textStyle(
                              FlutterFlowTheme.of(context).title2.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )
                            .make(),
                      ),
                    ),
                  ).centered(),
                
                      ],
                    ));
                  })),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }

  Widget textFormFields({controller, hintText, onSaved, textInputType, icon}) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val!.isEmpty) {
          return hintText;
        }
        return null;
      },
      onSaved: onSaved,
      keyboardType: textInputType,
      maxLines: 4,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }
}
