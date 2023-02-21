import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartify_c_r_m/auth/firebase_user_provider.dart';
import 'package:smartify_c_r_m/database/products_database_helper.dart';
import 'package:smartify_c_r_m/model/invoice_model.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/add_invoice_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import 'customers_screen.dart';

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
  bool isLoading = false;
  int currentIndex = 0;
  final db = ProductDatabaseHelper();

  @override
  void initState() {
    if (customerInvoice == null) {
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
              child: FutureBuilder<List<InvoiceItem>>(
                future: db.getAllProduct(),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  List<InvoiceItem> data = snapshot
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
                                          height: 130,
                                          width: 350,
                                          margin: EdgeInsets.only(
                                              left: 60, top: 20, bottom: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[i].description!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                'Qty: ${data[i].quantity}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'Unit Price: KES ${data[i].unitPrice}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'Vat: KES ${data[i].vat}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'Discount: KES ${data[i].discount}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'Total Amount: KES ${data[i].unitPrice! * data[i].quantity! + data[i].vat! - data[i].discount!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                            onTap: (){
                                               showEditProductDialog(
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
                                                    showEditProductDialog(
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
                                          child: GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                       isChecked? isChecked =false:isChecked = true;
                                                    currentIndex = i;
                                                    productsListInvoice.add(data[i]);
                                                    });
                                            },
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
                                                    productsListInvoice.add(data[i]);
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
  
    showAlertDialog(){
    return showDialog(context: context, builder: (_) =>
       AlertDialog(
        title: const Text("Info"),
        content: Text('Select a customer to proceed'),
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
                            controller: productNameController,
                            context: context,
                            textInputType: TextInputType.text,
                            hintText: 'Product name *'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            context: context,
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
                            context: context,
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
                            Column(
                              children: [
                                Container(
                                  width: 120,
                                  child: textFormFields(
                            context: context,
                                      controller: discountController,
                                      textInputType: TextInputType.text,
                                      onChanged: (val) {
                                        setState(() {
                                          discountAmount = (priceAmount *
                                                  double.parse(
                                                      val.toString())) /
                                              100;
                                        });
                                      },
                                      hintText: 'Discount %'),
                                ),
                                discountController.text.isNotEmpty
                                    ? Container(
                                        width: 100,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'KES ${discountAmount.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 120,
                                  child: textFormFields(
                            context: context,
                                      controller: taxController,
                                      textInputType: TextInputType.text,
                                      onChanged: (val) {
                                        setState(() {
                                          taxAmount = (priceAmount *
                                                  double.parse(
                                                      val.toString())) /
                                              100;
                                        });
                                      },
                                      hintText: 'Tax %'),
                                ),
                                taxController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: 100,
                                        child: Text(
                                          'KES ${taxAmount.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    addProduct();
                                    Navigator.pop(context);
                                  },
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

  showEditProductDialog(InvoiceItem product) {
    productNameController = TextEditingController(text: product.description);
    priceController = TextEditingController(text: product.unitPrice.toString());
    qtyController = TextEditingController(text: product.quantity.toString());
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
                            context: context,
                            controller: productNameController,
                            textInputType: TextInputType.text,
                            hintText: 'Product name *'),
                        SizedBox(
                          height: 20,
                        ),
                        textFormFields(
                            context: context,
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
                            context: context,
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
                            Column(
                              children: [
                                Container(
                                  width: 120,
                                  child: textFormFields(
                            context: context,
                                      controller: discountController,
                                      textInputType: TextInputType.text,
                                      onChanged: (val) {
                                        setState(() {
                                          discountAmount = (priceAmount *
                                                  double.parse(
                                                      val.toString())) /
                                              100;
                                        });
                                      },
                                      hintText: 'Discount %'),
                                ),
                                discountController.text.isNotEmpty
                                    ? Container(
                                        width: 100,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'KES ${discountAmount.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 120,
                                  child: textFormFields(
                            context: context,
                                      controller: taxController,
                                      textInputType: TextInputType.text,
                                      onChanged: (val) {
                                        setState(() {
                                          taxAmount = (priceAmount *
                                                  double.parse(
                                                      val.toString())) /
                                              100;
                                        });
                                      },
                                      hintText: 'Tax %'),
                                ),
                                taxController.text.isNotEmpty
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: 100,
                                        child: Text(
                                          'KES ${taxAmount.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    editProduct(product);
                                    Navigator.pop(context);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    width: 300,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: "Edit Product"
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


  Future addProduct() async {
    final product = InvoiceItem(
      description: productNameController.text,
      userId: currentUser!.user!.uid,
      unitPrice: double.parse(priceController.text),
      quantity: int.parse(qtyController.text),
      discount: discountAmount,
      vat: taxAmount,
      invoiceId: 0
    );

    await ProductDatabaseHelper().saveProduct(product);
    setState(() {
      isLoading = false;
    });
  }

  Future editProduct(InvoiceItem prdct) async {
    final product = InvoiceItem(
      id: prdct.id,
      description: productNameController.text,
      userId: currentUser!.user!.uid,
      unitPrice: double.parse(priceController.text),
      quantity: int.parse(qtyController.text),
      discount: discountAmount,
      vat: taxAmount,
      
    );

    await ProductDatabaseHelper().updateInvoiceItem(product);
    setState(() {
      isLoading = false;
    });
  }
}
