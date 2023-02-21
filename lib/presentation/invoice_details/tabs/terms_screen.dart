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
import '../add_invoice_screen.dart';

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
  int currentIndex = 0;

  void initState() {
    if(productsListInvoice.isEmpty){Future.delayed(Duration.zero, () {
      showAlertDialog(); });}
      super.initState();
  }

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
              child: FutureBuilder<List<Terms>>(
                future: db.getAllTerms(),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  List<Terms> data = snapshot
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
                                              title: Text(data[i].description!,
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
                                        
                                       Positioned(
                                          top: 0,
                                          left: 0,
                                          child: GestureDetector(
                                            onTap: (){
                                               showEditTermDialog(
                                                        data[i]);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .primaryColor),
                                              child: IconButton(
                                                  onPressed: () {
                                                    showEditTermDialog(
                                                        data[i]);
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        
                                      ),
                                      Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {
                                                   setState(() {
                                                       isChecked? isChecked =false:isChecked = true;
                                                    currentIndex = i;
                                                    termsInvoice = data[i];
                                                    });
                                                },
                                                icon: currentIndex == i && isChecked? Icon(
                                                  Icons.check_box,
                                                  color: Colors.white,
                                                ):Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: Colors.white,
                                                )),
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
   showAlertDialog(){
    return showDialog(context: context, builder: (_) =>
       AlertDialog(
        title: const Text("Info"),
        content: Text('Select products to proceed'),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => AddInvoiceScreen())));
            },
          )
        ],
      ));
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
                            context: context,
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
  
  showEditTermDialog(Terms term) {
    descController = TextEditingController(text: term.description);
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
                        'Edit Term',
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
                            context: context,
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
                                    editTerm(term);
                                    Navigator.pop(context);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    width: 300,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: "Edit Term"
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

  Widget textFormFields({controller, hintText, onChanged, textInputType, icon, BuildContext? context}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        controller: controller,
        validator: (val) {
          if (val!.isEmpty) {
            return "Enter your $hintText";
          }
          return null;
        },
        onChanged: onChanged,
        keyboardType: textInputType,
        maxLines: null,
        style: FlutterFlowTheme.of(context!).bodyText1
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
                          borderSide: BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: kPrimaryColor, width: 2),
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
                        hintText: hintText,
                        hintStyle: FlutterFlowTheme.of(context).bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
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


  Future addTerm() async {
    final term =
        Terms(description: descController.text, userId: currentUser!.user!.uid);

    await db.saveTerms(term);
    setState(() {
      isLoading = false;
    });
  }
  Future editTerm(Terms terms) async {
    final term =
        Terms(id: terms.id, description: descController.text, userId: currentUser!.user!.uid);

    await db.updateTermsModel(term);
    setState(() {
      isLoading = false;
    });
  }
}
