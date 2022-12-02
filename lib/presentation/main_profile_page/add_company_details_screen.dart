import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class AddCompanyDetailsScreen extends StatefulWidget {
  const AddCompanyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddCompanyDetailsScreen> createState() =>
      _AddCompanyDetailsScreenState();
}

class _AddCompanyDetailsScreenState extends State<AddCompanyDetailsScreen> {
  String? countrySelectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios)),
                      "Create Company Information"
                          .text
                          .textStyle(
                            FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).primaryText,
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
                      header: "Main Company Details".text.make(),
                      children: [
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            placeholder: "Enter company name",
                          ),
                          prefix: "Company Name:"
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
                            placeholder: "Enter contact person name",
                          ),
                          prefix: "Contact Person Name:"
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
                  CupertinoFormSection(
                      margin: EdgeInsets.all(10),
                      header: "Contact Details".text.make(),
                      children: [
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            placeholder: "Enter email",
                          ),
                          prefix: "Email:"
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
                            placeholder: "Enter phone number",
                          ),
                          prefix: "Phone Number:"
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
                            placeholder: "Enter website",
                          ),
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
                        )
                      ]),
                  CupertinoFormSection(
                      margin: EdgeInsets.all(10),
                      header: "Location Details".text.make(),
                      children: [
                        CupertinoFormRow(
                          child:   countryListWidget(context),
                          
                          prefix: "Website:"
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
                            placeholder: "Enter Location",
                          ),
                          prefix: "Location:"
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
                            placeholder: "Enter Address",
                          ),
                          prefix: "Address:"
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
                      ]),

                  CupertinoFormSection(
                      margin: EdgeInsets.all(10),
                      header: "Read Terms & Conditions"
                          .text
                          .color(Colors.blue)
                          .make(),
                      children: [
                        CupertinoFormRow(
                          child: CupertinoSwitch(
                            value: true,
                            onChanged: (value) {
                              value = false;
                            },
                          ),
                          prefix: "I Agree".text
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
                      ]),
                  20.heightBox,
                  Material(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: 300,
                        height: 50,
                        alignment: Alignment.center,
                        child: "Add Company Details"
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container countryListWidget(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        child: CountryListPick(
          appBar: AppBar(elevation: 0,toolbarHeight: 0,),
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
}
