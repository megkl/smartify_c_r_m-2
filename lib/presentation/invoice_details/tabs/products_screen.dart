import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  double discountAmount = 0.0, taxAmount = 0.0, priceAmount = 0.0;
  TextEditingController productNameController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController amountController = TextEditingController(text: '0');
  TextEditingController qtyController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showAddProductDialog();
        },
        child: Center(
            child: Text(
          'Add Product',
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
                  title:  Text('Macbook Laptops', style: FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),),subtitle:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('KES 200,000', style: FlutterFlowTheme.of(context).subtitle2.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context).primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        Text('Qty: 2', style: FlutterFlowTheme.of(context).subtitle2.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context).primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        ],
                                      ),),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ]),
      ),
   
    );
  }

  showAddProductDialog() {
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
                        'Product Info',
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
                              priceController.clear(); 
                              discountController.clear(); 
                              taxController.clear();
                              qtyController.clear();
                              priceAmount = 0.0; 
                              discountAmount = 0.0; 
                              taxAmount = 0.0; 
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
                            text: 'product',
                            controller: productNameController,
                            textInputType: TextInputType.text,
                            hintText: 'Product name *'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            text: 'Price',
                            controller: priceController,
                            textInputType: TextInputType.number,
                            onChanged: (val) {
                               setState(() {
                              priceAmount = double.parse(val);
                               });
                            },
                            hintText: 'Price *'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            text: 'Quantity',
                            controller: qtyController,
                            textInputType: TextInputType.text,
                            onChanged: (val) {
                               setState(() {
                              priceAmount = priceAmount * double.parse(val);
                               });
                            },
                            hintText: 'Quantity'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 150,
                              child: textFormFields(
                                  controller: discountController,
                                  textInputType: TextInputType.text,
                                  onChanged: (val) {
                                     setState(() {
                             discountAmount =(priceAmount *
                                            double.parse(val
                                                .toString())) /
                                        100;
                               });
                                    
                                  },
                                  hintText: 'Discount %'),
                            ),
                            discountController.text.isNotEmpty
                                ? Container(
                                    width: 100,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'KES ${discountAmount.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 150,
                              child: textFormFields(
                                  text: 'Tax',
                                  controller: taxController,
                                  textInputType: TextInputType.text,
                                  onChanged: (val) {
                                    setState(() {
                              taxAmount = (priceAmount *
                                            double.parse(val
                                                .toString())) /
                                        100;
                               });
                                    
                                  },
                                  hintText: 'Tax %'),
                            ),
                            taxController.text.isNotEmpty
                                ? Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    width: 100,
                                    child: Text(
                                      'KES ${taxAmount.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Amount:',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'KES ${priceAmount + taxAmount - discountAmount}',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ],
                        ),
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
                              child: "Add Product"
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
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: null,
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
}
