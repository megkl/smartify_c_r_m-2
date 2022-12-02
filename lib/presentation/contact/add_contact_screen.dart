import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartify_c_r_m/auth/auth_util.dart';
import 'package:smartify_c_r_m/database/contact_database_helper.dart';
import 'package:smartify_c_r_m/model/contact_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  String? countrySelectedValue, phoneCountryCode;
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController jobCompanyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  List<Item> phoneNumbers = [];
  List<PostalAddress>? postalAddresses = [];
  List<Item> emails = [];
  List<dynamic> dynamicPhones = [];
  List<dynamic> dynamicEmails = [];
  bool addPhoneNumbers = false;
  bool deletePhoneNumbers = false;
  bool addEmails = false;
  final _formKey = GlobalKey<FormState>();
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
                        "Add Contact"
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
                              placeholder: "Enter Full Name",
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
                              placeholder: "Company Name or Job Title",
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
                                ? phoneNumbers.length == 0
                                    ? buildPhoneTextField()
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: dynamicPhones.length,
                                        itemBuilder: (_, index) =>
                                            dynamicPhones[index],
                                      )
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
                                    placeholder: "Enter Email",
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {}, icon: Icon(Icons.add)),
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
                                placeholder: "Enter Address",
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
        placeholder: "7*******",
        onChanged: (value) {
          setState(() {
            phoneNumbers.add(Item(label: '',value: value));
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
      await addContact();
      //final isUpdating = widget.note != null;

      // if (isUpdating) {
      //   await updateNote();
      // } else {
      //   await addNote();
      // }

      Navigator.of(context).pop();
    }
  }

  // Future updateNote() async {
  //   final note = widget.note!.copy(
  //     isImportant: isImportant,
  //     number: number,
  //     title: title,
  //     description: description,
  //   );

  //   await NotesDatabase.instance.update(note);
  // }

  Future addContact() async {
    final contact = Contact(
      displayName: fullnameController.text,
      userId: currentUserUid,
      phones: phoneNumbers,
      emails: emails,
      website: websiteController.text,
                          jobTitle: jobCompanyController.text,
      
    );

    await ContactDatabaseHelper().saveContact(contact);
  }

}
