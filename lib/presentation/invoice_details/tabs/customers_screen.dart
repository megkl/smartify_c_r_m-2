import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../database/contact_database_helper.dart';
import '../../contact/update_contact_screen.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  String? countrySelectedValue, phoneCountryCode;
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController jobCompanyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool isChecked = false;
  final db = ContactDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showAddCustomerDialog();
        },
        child: Center(
            child: Text(
          'Add Customer',
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          width: 400,
          child: Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      0, 0, 0, 24),
                                              child: Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .primaryBackground,
                                                ),
                                                child: FutureBuilder(
                                                  future: db.getAllContact(),
                                                  initialData: const [],
                                                  builder: (BuildContext context,
                                                      AsyncSnapshot<List>
                                                          snapshot) {
                                                    var data = snapshot
                                                        .data!.where((element) => element['contactGroup'] == 'Customer').toList(); // this is the data we have to show. (list of todo)
                                                    var datalength = data.length;

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
                                                                  setState(() {
                                                                    isChecked = true;
                                                                  });
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
                                                                                  child: IconButton(
                     onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateContactScreen(contact: data[i],)));

                     },
                    icon: Icon(FontAwesomeIcons.penClip)),
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
                                                                                  data[i]['jobTitle'].toString().toLowerCase(),
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
                                                                
                                                                          },
                                                                          child: Container(
                                                                            width: 50,
                                                                            child: Icon(
                                                                              isChecked? Icons
                                                                                  .check_box:Icons
                                                                                  .check_box_outline_blank,
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
                                            ),
        ),
                                          
        
//         Column(children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//             child: Card(
//               child: Container(
//                 child: ListTile(
//                   leading: IconButton(
//                     onPressed: (){},
//                     icon: Icon(FontAwesomeIcons.penClip)),
//                   trailing: IconButton(
//                     onPressed: (){
//                       setState(() {
// isChecked?isChecked = false: isChecked = true;
                        
//                       });
//                     },
//                     icon: isChecked? Icon(Icons.check_box) :Icon(Icons.check_box_outline_blank)),
//                   title:  Text('Magdaline Luke', style: FlutterFlowTheme.of(context).title2.override(
//                                         fontFamily: 'Outfit',
//                                         color: FlutterFlowTheme.of(context).primaryText,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                       ),),subtitle:  Text('Design By Meg', style: FlutterFlowTheme.of(context).subtitle2.override(
//                                         fontFamily: 'Outfit',
//                                         color: FlutterFlowTheme.of(context).primaryColor,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                       ),),),
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           )
//         ]),
      
      ),
    );
  }

  showAddCustomerDialog() {
    StateSetter _setState;
    showGeneralDialog(
        barrierColor:   Colors.black.withOpacity(0.5),

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
                      Text('Customer Info', style: FlutterFlowTheme.of(context).title2.override(
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
                            icon: Icon(Icons.person),
                            controller: fullnameController,
                            textInputType: TextInputType.text,
                            hintText: 'Customer name'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            icon: Icon(Icons.location_city),
                            controller: jobCompanyController,
                            textInputType: TextInputType.text,
                            hintText: 'Company Name'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            icon: Icon(Icons.call),
                            controller: phoneController,
                            textInputType: TextInputType.text,
                            hintText: 'Phone Number'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            icon: Icon(Icons.email),
                            controller: emailController,
                            textInputType: TextInputType.text,
                            hintText: 'Email Address'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            icon: Icon(FontAwesomeIcons.chrome),
                            controller: websiteController,
                            textInputType: TextInputType.text,
                            hintText: 'Website'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            icon: Icon(FontAwesomeIcons.locationPin),
                            controller: addressController,
                            textInputType: TextInputType.text,
                            hintText: 'Address'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            icon: Icon(FontAwesomeIcons.locationArrow),
                            controller: locationController,
                            textInputType: TextInputType.text,
                            hintText: 'Location'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            icon: Icon(FontAwesomeIcons.globe),
                            controller: countryController,
                            textInputType: TextInputType.text,
                            hintText: 'Country'),
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
                        child: "Add Customer"
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
          return "Enter your $hintText first";
        }
        return null;
      },
      onSaved: onSaved,
      keyboardType: textInputType,
      maxLines: null,
      decoration: InputDecoration(
        prefixIcon: icon,
        prefixIconColor: FlutterFlowTheme.of(context).primaryColor,
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
