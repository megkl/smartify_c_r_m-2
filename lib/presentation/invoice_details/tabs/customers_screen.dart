import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:smartify_c_r_m/model/contact_model.dart';
import 'package:smartify_c_r_m/presentation/home/home_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/add_invoice_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../auth/auth_util.dart';
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
  int currentIndex = 0;
  void initState() {
    if (companyProfile == null) {
      Future.delayed(Duration.zero, () {
        showAlertDialog();
      });
    }
    super.initState();
  }

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
      body: companyProfile == null
          ? showAlertDialog()
          : SingleChildScrollView(
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
                    child: FutureBuilder<List<ContactModel>>(
                      future: db.getAllContact(),
                      initialData: const [],
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        List<ContactModel> data = snapshot.data;
                        // this is the data we have to show. (list of todo)
                        var datalength = data.length;

                        return datalength == 0
                            ? const Center(
                                child: Text('no data found'),
                              )
                            : ListView.builder(
                                itemCount: datalength,
                                itemBuilder: (context, i) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 0),
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
                                            height: 130,
                                            width: 350,
                                            margin: EdgeInsets.only(
                                                left: 60, top: 20, bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[i].fullName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  'Job Title: ${data[i].jobTitle ?? ''}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                                Text(
                                                  'Company: ${data[i].companyName ?? ''}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                                Text(
                                                  'Phone Number: ${data[i].phoneNumbers ?? ''}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                                Text(
                                                  'Email: ${data[i].emails ?? ''}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                                Text(
                                                  'website: ${data[i].website ?? ''}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          UpdateContactScreen(
                                                              group: 2,
                                                              contact:
                                                                  data[i]))));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor),
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                UpdateContactScreen(
                                                                    group: 2,
                                                                    contact: data[
                                                                        i]))));
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
                                                    isChecked
                                                        ? isChecked = false
                                                        : isChecked = true;
                                                    currentIndex = i;
                                                    customerId = data[i].id;
                                                    customerInvoice = data[i];
                                                  });
                                                },
                                                icon: currentIndex == i &&
                                                        isChecked
                                                    ? Icon(
                                                        Icons.check_box,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color: Colors.white,
                                                      )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  showAlertDialog() {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Info"),
              content: Text('Please fill in company details'),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  showAddCustomerDialog() {
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
                        'Customer Info',
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
                            icon: Icon(Icons.person),
                            controller: fullnameController,
                            textInputType: TextInputType.text,
                            hintText: 'Customer name'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            context: context,
                            icon: Icon(Icons.location_city),
                            controller: jobCompanyController,
                            textInputType: TextInputType.text,
                            hintText: 'Company Name'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            context: context,
                            icon: Icon(Icons.call),
                            controller: phoneController,
                            textInputType: TextInputType.text,
                            hintText: 'Phone Number'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            context: context,
                            icon: Icon(Icons.email),
                            controller: emailController,
                            textInputType: TextInputType.text,
                            hintText: 'Email Address'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            context: context,
                            icon: Icon(FontAwesomeIcons.chrome),
                            controller: websiteController,
                            textInputType: TextInputType.text,
                            hintText: 'Website'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            context: context,
                            icon: Icon(FontAwesomeIcons.locationPin),
                            controller: addressController,
                            textInputType: TextInputType.text,
                            hintText: 'Address'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            icon: Icon(FontAwesomeIcons.locationArrow),
                            context: context,
                            controller: locationController,
                            textInputType: TextInputType.text,
                            hintText: 'Location'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            context: context,
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
                            onTap: (){
                              addContact();
                              Navigator.pop(context);
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: 300,
                              height: 50,
                              alignment: Alignment.center,
                              child: "Add Customer"
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
      {controller,
      hintText,
      onSaved,
      textInputType,
      icon,
      BuildContext? context}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
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
        style: FlutterFlowTheme.of(context!).bodyText1.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).secondaryText,
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
          hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).secondaryText,
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

  Future addContact() async {
    final contact = ContactModel(
      fullName: fullnameController.text,
      userId: currentUserUid,
      phoneNumbers: phoneController.text,
      emails: emailController.text,
      website: websiteController.text,
      jobTitle: jobCompanyController.text,
      contactGroup: 'Customer',
      locationDetails: PostalAddress(street: addressController.text, country: countryController.text, city: locationController.text)
    );

    await ContactDatabaseHelper().saveContact(contact);
  }
}
