import 'dart:io';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AddCompanyDetailsScreen extends StatefulWidget {
  const AddCompanyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddCompanyDetailsScreen> createState() =>
      _AddCompanyDetailsScreenState();
}

class _AddCompanyDetailsScreenState extends State<AddCompanyDetailsScreen> {
  String? countrySelectedValue;
  String? locationAddress;
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? _imageFile;
  File? _image;
  IconData iconphoto = Icons.image;
  @override
  Widget build(BuildContext context) {
  var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      "Create Company Information"
                          .text
                          .textStyle(
                            FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      companyLogoImage(context),

                      signatureImg(context),
                    ],
                  ),
                  SizedBox(height: 30,),
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
                        )
                      ]),
                  CupertinoFormSection(
                      margin: EdgeInsets.all(10),
                      header: "Location Details".text.make(),
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
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(side: BorderSide(color: kPrimaryColor)),
                              onPressed: ()=>showModal(context), child: ListTile(leading: Icon(FontAwesomeIcons.locationArrow, color: kPrimaryColor,), 
                              title: Text('Mark Location in map',style: FlutterFlowTheme.of(context).title2.override(
                                      fontFamily: 'Outfit',
                                      color: kPrimaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),),)
                                    ))
                           ),
                       locationAddress!= null?
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            controller: addressController,
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
                        ):Container()
                        
                      ]),

                  // CupertinoFormSection(
                  //     margin: EdgeInsets.all(10),
                  //     header: "Read Terms & Conditions"
                  //         .text
                  //         .color(kPrimaryColor)
                  //         .make(),
                  //     children: [
                  //       CupertinoFormRow(
                  //         child: CupertinoSwitch(
                  //           value: true,
                  //           onChanged: (value) {
                  //             value = false;
                  //           },
                  //         ),
                  //         prefix: "I Agree"
                  //             .text
                  //             .textStyle(
                  //               FlutterFlowTheme.of(context).subtitle2.override(
                  //                     fontFamily: 'Outfit',
                  //                     color: FlutterFlowTheme.of(context)
                  //                         .primaryText,
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w500,
                  //                   ),
                  //             )
                  //             .make(),
                  //       ),
                  //     ]),
                  
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
   showModal(BuildContext ctx){
     showModalBottomSheet(context: ctx, builder: (context){
    return Container(
                            height: 500,
                            child: OpenStreetMapSearchAndPick(
                                center: LatLong(-1.3226022, 36.7986286),
                                buttonColor: Colors.blue,
                                buttonText: 'Set Current Location',
                                onPicked: (pickedData) {
                                  //Navigator.pop(context);
                                  setState(() {
                                  addressController.text = pickedData.address;
                                  locationAddress =pickedData.address; 
                                  });
                                }),
                          );
                       
    });
  }
  Widget companyLogoImage(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        _imageFile != null
            ? Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(_imageFile!.path)))))
            :  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => choosePhotoBottomSheet(context)),
                      );
                    },
                    child: ClipRect(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Text(
                          "Add Logo",
                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                fontFamily: 'Outfit',
                                color:FlutterFlowTheme.of(context).primaryColor,
                              ),
                        )),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.1),
                            ),
                      ),
                    ),
                  ),
        Positioned(
          bottom: 5,
          right: 0,
          child: GestureDetector(
            onTap: (() {
              showDialog(
                context: context,
                builder: ((builder) => choosePhotoBottomSheet(context)),
              );
            }),
            child: Container(
              decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            ),
              child: Icon(
                Icons.add_a_photo,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 28,
              ),
            ),
          ),
        ),
      ]),
    );}
  
   Widget signatureImg(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        _imageFile != null
            ? Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(_imageFile!.path)))))
            :  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: ((builder) => choosePhotoBottomSheet(context)),
                      );
                    },
                    child: ClipRect(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Text(
                          "Add Signature",
                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                fontFamily: 'Outfit',
                                fontSize: 12,
                                color:FlutterFlowTheme.of(context).primaryColor,
                              ),
                        )),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.1),
                            ),
                      ),
                    ),
                  ),
        Positioned(
          bottom: 5,
          right: 0,
          child: GestureDetector(
            onTap: (() {
              showDialog(
                context: context,
                builder: ((builder) => chooseSignatureDialog(context)),
              );
            }),
            child: Container(
              decoration: BoxDecoration(
                          shape: BoxShape.circle,
                                                     color: FlutterFlowTheme.of(context).primaryBackground,

                            ),
              child: Icon(
                FontAwesomeIcons.signature,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 28,
              ),
            ),
          ),
        ),
      ]),
    );}

  Widget choosePhotoBottomSheet(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Choose Logo option",
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16,
                                      color:FlutterFlowTheme.of(context).primaryColor,
                                    
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                  Navigator.pop(context);
                },
                  child: Icon(Icons.close,color:FlutterFlowTheme.of(context).primaryColor,
),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {
                    takePhoto(ImageSource.camera,context);
                  },
                child: ListTile(
                  leading:  Icon(
                      Icons.camera,
                                    color:FlutterFlowTheme.of(context).primaryColor,
                    ),
                  title: Text('Take a picture',style: FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 16,
                                    color:FlutterFlowTheme.of(context).primaryColor,
                                  
                )),),
              ),
            ),
            SizedBox(height: 10,),
             OutlinedButton(
              onPressed: () {
                  takePhoto(ImageSource.camera,context);
                },
               child: ListTile(
                leading:  Icon(
                    Icons.photo,
                                  color:FlutterFlowTheme.of(context).primaryColor,
                  ),
                title: Text('Choose from gallery',style: FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Outfit',
                                  fontSize: 16,
                                  color:FlutterFlowTheme.of(context).primaryColor,
                                
            )),),
             ),
           ],
        ),
      ),
    );
  }
  
   Widget chooseSignatureDialog(BuildContext context) {
    return Dialog(
      child: Container(
        height: 250.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Choose User Signature",
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16,
                                      color:FlutterFlowTheme.of(context).primaryColor,
                                    
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                  Navigator.pop(context);
                },
                  child: Icon(Icons.close,color:FlutterFlowTheme.of(context).primaryColor,
),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {
                    takePhoto(ImageSource.camera,context);
                  },
                child: ListTile(
                  leading:  Icon(
                      Icons.camera,
                                    color:FlutterFlowTheme.of(context).primaryColor,
                    ),
                  title: Text('Take a picture',style: FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 16,
                                    color:FlutterFlowTheme.of(context).primaryColor,
                                  
                )),),
              ),
            ),
            SizedBox(height: 10,),
             OutlinedButton(
              onPressed: () {
                  takePhoto(ImageSource.camera,context);
                },
               child: ListTile(
                leading:  Icon(
                    Icons.photo,
                                  color:FlutterFlowTheme.of(context).primaryColor,
                  ),
                title: Text('Choose from gallery',style: FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Outfit',
                                  fontSize: 16,
                                  color:FlutterFlowTheme.of(context).primaryColor,
                                
            )),),
             ),
           SizedBox(height: 10,),
             OutlinedButton(
              onPressed: () {
                  takePhoto(ImageSource.camera,context);
                },
               child: ListTile(
                leading:  Icon(
                    FontAwesomeIcons.signature,
                                  color:FlutterFlowTheme.of(context).primaryColor,
                  ),
                title: Text('Signature Pad',style: FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Outfit',
                                  fontSize: 16,
                                  color:FlutterFlowTheme.of(context).primaryColor,
                                
            )),),
             ),
           
           ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source, BuildContext context) async {
    Navigator.pop(context);
    final pickedFile =
        await picker.pickImage(source: source, imageQuality: 50);
    _imageFile = pickedFile;
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void getImage(ImageSource imageSource) async {

   PickedFile? _imageFile = await picker.getImage(source: imageSource);
    if (_imageFile == null) return;

    File tmpFile = File(_imageFile.path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(_imageFile.path);
    tmpFile = await tmpFile.copy('${appDir.path}/$fileName');

    setState(() {
      _image = tmpFile;
      iconphoto = Icons.check_box;
    });
  }
}


