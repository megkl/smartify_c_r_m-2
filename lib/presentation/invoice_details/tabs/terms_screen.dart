import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartify_c_r_m/auth/firebase_user_provider.dart';
import 'package:smartify_c_r_m/database/products_database_helper.dart';
import 'package:smartify_c_r_m/database/term_database.dart';
import 'package:smartify_c_r_m/model/invoice_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../model/terms_model.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  TextEditingController descController = TextEditingController();
  bool isChecked = false;
  bool isLoading = false;
  final db = TermsDatabaseHelper();
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
              child: FutureBuilder(
                future: db.getAllTerms(),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  var data = snapshot
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
                              child: InkWell(
                                  onTap: () async {
                                    setState(() {
                                      isChecked = true;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Container(
                                        height: 100,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: ListTile(
                                          title: Text(data[i]['description'],
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
                                          trailing: isChecked
                                              ? IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isChecked = false;
                                                    });
                                                  },
                                                  icon: Icon(Icons.check_box))
                                              : IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isChecked = true;
                                                    });
                                                  },
                                                  icon: Icon(Icons
                                                      .check_box_outline_blank)),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ))),
                        );
                },
              ),
            ),
          ),
        ),
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
                      Text(
                        'Add Term',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: FlutterFlowTheme.of(context).primaryColor),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              descController.clear();
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
                            text: 'description',
                            controller: descController,
                            textInputType: TextInputType.multiline,
                            hintText: 'Enter Terms & Condition'),
                        SizedBox(
                          height: 20,
                        ),
                        isLoading
                            ? CircularProgressIndicator()
                            : Material(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    addTerm();
                                    Navigator.pop(context);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    width: 300,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: "Add Terms"
                                        .text
                                        .textStyle(
                                          FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
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

  Widget textFormFields(
      {controller, hintText, onChanged, textInputType, text}) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val!.isEmpty) {
          return "Enter your $hintText first";
        }
        return null;
      },
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Outfit',
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: 5,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        hintText: hintText,
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

  Future addTerm() async {
    final term =
        Terms(description: descController.text, userId: currentUser!.user!.uid);

    await db.saveTerms(term);
    setState(() {
      isLoading = false;
    });
  }
}
