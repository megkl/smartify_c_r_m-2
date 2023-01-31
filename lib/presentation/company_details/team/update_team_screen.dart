import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smartify_c_r_m/database/team_database_helper.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../auth/auth_util.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../model/contact_model.dart';

class UpdateTeamScreen extends StatefulWidget {
   UpdateTeamScreen({Key? key, this.contact}) : super(key: key);
  dynamic contact;
  @override
  State<UpdateTeamScreen> createState() => _UpdateTeamScreenState();
}

class _UpdateTeamScreenState extends State<UpdateTeamScreen> {
  String? countrySelectedValue, phoneCountryCode = '254';
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController jobCompanyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  List<Item> phoneNumbers = [];
  List<PostalAddress>? postalUpdateresses = [];
  List<Item> emails = [];
  List<dynamic> dynamicPhones = [];
  List<dynamic> dynamicEmails = [];
  bool addPhoneNumbers = false;
  bool deletePhoneNumbers = false;
  bool addEmails = false;
  final _formKey = GlobalKey<FormState>();

  void initState(){
    super.initState();
     phoneController = TextEditingController(text: widget.contact!['phoneNumbers']);
  fullnameController = TextEditingController(text: widget.contact!['fullName']);
  jobCompanyController = TextEditingController(text: widget.contact!['jobTitle']);
  emailController = TextEditingController(text: widget.contact!['emails']);
  websiteController = TextEditingController(text: widget.contact!['website']);
  addressController = TextEditingController(text: widget.contact!['address']);

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                        "Update Team Member"
                            .text
                            .textStyle(
                              FlutterFlowTheme.of(context).title2.override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )
                            .make(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //"Create your company information".text.textStyle(FlutterFlowTheme.of(context).subtitle2).make(),
                    CupertinoFormSection(
                        margin: EdgeInsets.all(10),
                        header: "Basic Information".text.make(),
                        children: [
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: fullnameController,
                              placeholder: "Enter team member Name",
                            ),
                            prefix: Row(
                              children: [
                                "Full Name:"
                                    .text
                                    .textStyle(
                                      FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    )
                                    .make(),
                                "*".text.color(Colors.red).make(),
                              ],
                            ),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              placeholder: "Job Title",
                              controller: jobCompanyController,
                            ),
                            prefix: "Identification:"
                                .text
                                .textStyle(
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                )
                                .make(),
                          )
                        ]),
                    Container(
                      child: CupertinoFormSection(
                          margin: EdgeInsets.all(10),
                          header: "Contact details".text.make(),
                          children: [
                            CupertinoFormRow(
                              child: CupertinoSwitch(
                                value: addPhoneNumbers,
                                onChanged: (value) {
                                  value =
                                      addPhoneNumbers == false ? true : false;
                                  setState(() {
                                    addPhoneNumbers =
                                        addPhoneNumbers == false ? true : false;
                                  });
                                },
                              ),
                              //addPhoneNumbers?  buildPhoneTextField():Container()

                              prefix: "Phone Numbers:"
                                  .text
                                  .textStyle(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )
                                  .make(),
                            ),
                            addPhoneNumbers
                                ?  buildPhoneTextField()
                                    
                                : Container(),
                          ]),
                    ),
                    CupertinoFormSection(margin: EdgeInsets.all(10), children: [
                      CupertinoFormRow(
                        child: CupertinoSwitch(
                          value: addEmails,
                          onChanged: (value) {
                            value = addEmails == false ? true : false;
                            setState(() {
                              addEmails = addEmails == false ? true : false;
                            });
                          },
                        ),
                        //addPhoneNumbers?  buildPhoneTextField():Container()

                        prefix: "Emails:"
                            .text
                            .textStyle(
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )
                            .make(),
                      ),
                      CupertinoFormRow(
                          child: addEmails
                              ? ListTile(
                                  leading: Icon(
                                    Icons.email,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                  title: CupertinoTextFormFieldRow(
                                    controller: emailController,
                                    placeholder: "Enter Email",
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        emails.add(Item(value: emailController.text));
                                      }, icon: Icon(Icons.add)),
                                )
                              : Container()),
                    ]),

                    CupertinoFormSection(
                        margin: EdgeInsets.all(10),
                        header: "Other Information".text.make(),
                        children: [
                          CupertinoFormRow(
                            child: countryListWidget(context),
                            prefix: "Country:"
                                .text
                                .textStyle(
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                )
                                .make(),
                          ),
                          CupertinoFormRow(
                              child: CupertinoTextFormFieldRow(
                                controller: locationController,
                                placeholder: "Enter Location",
                              ),
                              prefix: Icon(
                                FontAwesomeIcons.locationCrosshairs,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              )),
                          CupertinoFormRow(
                              child: CupertinoTextFormFieldRow(
                                controller: addressController,
                                placeholder: "Enter Updateress",
                                onChanged: ((value) {
                                }),
                              ),
                              prefix: Icon(
                                FontAwesomeIcons.locationArrow,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              )),
                          CupertinoFormRow(
                              child: CupertinoTextFormFieldRow(
                                placeholder: "Enter website",
                              ),
                              prefix: Icon(
                                FontAwesomeIcons.globe,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              )),
                        ]),

                    20.heightBox,
                    Material(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: (){
                          addEditContact();
                          context.pushNamed('home');
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: 160,
                          height: 50,
                          alignment: Alignment.center,
                          child: "Save"
                              .text
                              .textStyle(
                                FlutterFlowTheme.of(context).title2.override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                              .make(),
                        ),
                      ),
                    ).centered(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container countryListWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CountryListPick(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
          ),
          theme: CountryTheme(
            isShowFlag: true,
            isShowTitle: true,
            isShowCode: false,
            isDownIcon: true,
            showEnglishName: true,
          ),
          initialSelection: '+254',
          onChanged: (CountryCode? code) {
            countrySelectedValue = code?.name;
          },
          useUiOverlay: true,
          useSafeArea: false),
    );
  }

  buildPhoneTextField() {
    return ListTile(
      horizontalTitleGap: 0,
      leading: CountryListPick(
          // To disable option set to false
          theme: CountryTheme(
            isShowFlag: true,
            isShowTitle: false,
            isShowCode: true,
            isDownIcon: false,
            showEnglishName: true,
          ),
          // Set default value
          initialSelection: '+254',
          // or
          // initialSelection: 'US'
          onChanged: (CountryCode? code) {
            //senderCountryIso = code?.flagUri;
            phoneCountryCode = code?.dialCode;
          },
          // Whether to allow the widget to set a custom UI overlay
          useUiOverlay: true,
          // Whether the country list should be wrapped in a SafeArea
          useSafeArea: false),
      title: CupertinoTextFormFieldRow(
        controller: phoneController,
        placeholder: "7*******",
        onChanged: (value) {
          setState(() {
            //phoneNumbers.add(Item(value: phoneController.text));
          });
        },
      ),
      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
    );
  }

  addPhones() {
    dynamicPhones.add(buildPhoneTextField());
  }

void addEditContact() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      await updateContact();
      //final isUpdating = widget.note != null;

      // if (isUpdating) {
      //   await updateNote();
      // } else {
      //   await addNote();
      // }

 context.pushNamed(
                    'home');
    }
  }

  Future updateContact() async {
    final contact = ContactModel(
      fullName: fullnameController.text,
      id: widget.contact['id'],
      userId: currentUserUid,
      phoneNumbers: '$phoneCountryCode${phoneController.text}',
      emails: emailController.text,
      website: websiteController.text,
      jobTitle: jobCompanyController.text,
      contactGroup: '',
      locationDetails: PostalAddress(street: addressController.text, country: countrySelectedValue, city: locationController.text)
    );

    await TeamDatabaseHelper().updateTeamModel(contact);
  }

}

