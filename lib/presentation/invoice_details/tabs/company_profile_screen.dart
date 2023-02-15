import 'dart:io';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smartify_c_r_m/auth/auth_util.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';
import 'package:smartify_c_r_m/model/company_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../auth/firebase_user_provider.dart';
import '../../../database/profile_database_helper.dart';
import '../../home/home_screen.dart';

class EditCompanyProfileScreen extends StatefulWidget {
  EditCompanyProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditCompanyProfileScreen> createState() =>
      _EditCompanyProfileScreenState();
}

class _EditCompanyProfileScreenState extends State<EditCompanyProfileScreen> {
  String? countrySelectedValue = '';
  String? locationAddress = '';
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? _imageFile;
  File? _image;
  IconData iconphoto = Icons.image;
  bool isProfileAdded = false;
  bool isLoading = false;
  void initState() {
    super.initState();
    phoneController = TextEditingController(
        text: companyProfile.isNotEmpty
            ? companyProfile['companyPhoneNumber']
            : '');
    companyNameController = TextEditingController(
        text: companyProfile.isNotEmpty ? companyProfile['companyName'] : '');
    contactNameController = TextEditingController(
        text: companyProfile.isNotEmpty ? companyProfile['contactName'] : '');
    emailController = TextEditingController(
        text: companyProfile.isNotEmpty ? companyProfile['companyEmail'] : '');
    websiteController = TextEditingController(
        text:
            companyProfile.isNotEmpty ? companyProfile['companyWebsite'] : '');
    addressController = TextEditingController(
        text:
            companyProfile.isNotEmpty ? companyProfile['companyAddress'] : '');
    locationController = TextEditingController(
        text:
            companyProfile.isNotEmpty ? companyProfile['companyLocation'] : '');
    countryController = TextEditingController(
        text: companyProfile.isNotEmpty ? companyProfile['country'] : '');
  }

  @override
  Widget build(BuildContext context) {
    var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: companyProfile.isEmpty
            ? FloatingActionButton(
                onPressed: () {
                  context.pushNamed('addCompanyDetails');
                },
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: kPrimaryColor,
                ),
              )
            : Container(),
        body: companyProfile.isNotEmpty
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              companyLogoImage(context),
                              signatureImg(context),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          textFormFields(
                              context: context,
                              icon: Icon(Icons.group,color: kPrimaryColor,),
                              controller: companyNameController,
                              textInputType: TextInputType.text,
                              hintText: 'Company name'),
                          15.heightBox,
                          textFormFields(
                              context: context,
                              icon: Icon(Icons.person,color: kPrimaryColor,),
                              controller: contactNameController,
                              textInputType: TextInputType.text,
                              hintText: 'Person name'),
                          15.heightBox,
                          textFormFields(
                              icon: Icon(Icons.phone_android,color: kPrimaryColor,),
                              context: context,
                              controller: phoneController,
                              textInputType: TextInputType.text,
                              hintText: 'Contact No *'),
                          15.heightBox,
                          textFormFields(
                              icon: Icon(Icons.mail,color: kPrimaryColor,),
                              context: context,
                              controller: emailController,
                              textInputType: TextInputType.text,
                              hintText: 'Email Address'),
                          15.heightBox,
                          textFormFields(
                              icon: Icon(FontAwesomeIcons.locationArrow,color: kPrimaryColor,),
                              context: context,
                              controller: addressController,
                              textInputType: TextInputType.text,
                              hintText: 'Address'),
                          15.heightBox,
                          textFormFields(
                              context: context,
                              icon: Icon(Icons.location_city,color: kPrimaryColor,),
                              controller: locationController,
                              textInputType: TextInputType.text,
                              hintText: 'City'),
                          15.heightBox,
                          textFormFields(
                              icon: Icon(FontAwesomeIcons.locationCrosshairs,color: kPrimaryColor,),
                              context: context,
                              controller: countryController,
                              textInputType: TextInputType.text,
                              hintText: 'Country'),
                          15.heightBox,
                          textFormFields(
                              icon: Icon(FontAwesomeIcons.mapPin,color: kPrimaryColor,),
                              context: context,
                              controller: zipController,
                              textInputType: TextInputType.text,
                              hintText: 'Zip Code'),
                          15.heightBox,
                          textFormFields(
                              icon: Icon(FontAwesomeIcons.chrome,color: kPrimaryColor,),
                              context: context,
                              controller: websiteController,
                              textInputType: TextInputType.text,
                              hintText: 'Website'),
                          15.heightBox,
                          Material(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            child: InkWell(
                              onTap: () {
                                updateCompanyDetails();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Company Profile updated successfully')));
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                width: 300,
                                height: 50,
                                alignment: Alignment.center,
                                child: "Update Company Details"
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
                          15.heightBox,
                          
                         ],
                      ),
                    ),
                  ),
                ),
              )
            : Center(
                child: Container(
                    child: Text(
                'Add a company profile below',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
              ))));
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

  showModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (context) {
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
                    locationAddress = pickedData.address;
                  });
                }),
          );
        });
  }

  Widget companyLogoImage(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        _imageFile != null || companyProfile['photoUrl'] != null
            ? ClipRect(
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: companyProfile['photoUrl'] != null
                                ? FileImage(File(companyProfile['photoUrl']))
                                : FileImage(File(_imageFile!.path))))),
              )
            : InkWell(
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
                            color: FlutterFlowTheme.of(context).primaryColor,
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
    );
  }

  Widget signatureImg(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        _imageFile != null
            ? ClipRect(
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.2),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(_imageFile!.path))))),
              )
            : InkWell(
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
                            color: FlutterFlowTheme.of(context).primaryColor,
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
    );
  }

  Widget choosePhotoBottomSheet(BuildContext context) {
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
                    "Choose Logo option",
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Outfit',
                          fontSize: 16,
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {
                  takePhoto(ImageSource.camera, context);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.camera,
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  title: Text('Take a picture',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            fontSize: 16,
                            color: FlutterFlowTheme.of(context).primaryColor,
                          )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                takePhoto(ImageSource.camera, context);
              },
              child: ListTile(
                leading: Icon(
                  Icons.photo,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                title: Text('Choose from gallery',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Outfit',
                          fontSize: 16,
                          color: FlutterFlowTheme.of(context).primaryColor,
                        )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {
                  takePhoto(ImageSource.camera, context);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.camera,
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  title: Text('Remove Logo',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            fontSize: 16,
                            color: FlutterFlowTheme.of(context).primaryColor,
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chooseSignatureDialog(BuildContext context) {
    return Dialog(
      child: Container(
        height: 335.0,
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {
                  takePhoto(ImageSource.camera, context);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.camera,
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  title: Text('Take a picture',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            fontSize: 16,
                            color: FlutterFlowTheme.of(context).primaryColor,
                          )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                takePhoto(ImageSource.camera, context);
              },
              child: ListTile(
                leading: Icon(
                  Icons.photo,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                title: Text('Choose from gallery',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Outfit',
                          fontSize: 16,
                          color: FlutterFlowTheme.of(context).primaryColor,
                        )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                takePhoto(ImageSource.camera, context);
              },
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.signature,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                title: Text('Signature Pad',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Outfit',
                          fontSize: 16,
                          color: FlutterFlowTheme.of(context).primaryColor,
                        )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.remove_circle_outline,
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  title: Text('Remove Signature',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            fontSize: 16,
                            color: FlutterFlowTheme.of(context).primaryColor,
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFormFields({controller, hintText, onSaved, textInputType, icon, BuildContext? context}) {
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
        
        style: FlutterFlowTheme.of(context!).bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w300,
                                                      ),
        decoration: new InputDecoration(
          prefixIcon: icon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          iconColor: kPrimaryColor,
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

  void takePhoto(ImageSource source, BuildContext context) async {
    Navigator.pop(context);
    final pickedFile = await picker.pickImage(source: source, imageQuality: 50);
    _imageFile = pickedFile;
    setState(() {
      _imageFile = pickedFile;
    });

    File tmpFile = File(_imageFile!.path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(_imageFile!.path);
    _image = await tmpFile.copy('${appDir.path}/$fileName');
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

  Future updateCompanyDetails() async {
    final companyDetails = CompanyModel(
        companyName: companyNameController.text,
        companyAddress: addressController.text,
        companyPhoneNumber: phoneController.text,
        companyEmail: emailController.text,
        companyWebsite: websiteController.text,
        contactName: contactNameController.text,
        companyLocation: locationController.text,
        country: countrySelectedValue,
        userId: currentUser!.user!.uid,
        id: companyProfile['id'],
        paypal: '',
        photoUrl: _image == null
            ? companyProfile['photoUrl'] == null
                ? ''
                : companyProfile['photoUrl']
            : _image!.path);

    await CompanyDatabaseHelper().updateCompanyModel(companyDetails);
  }
}
