import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/add_invoice_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/company_profile_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/customers_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/products_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/review_invoice.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/terms_screen.dart';
import '../../auth/auth_util.dart';
import '../../database/invoice_database_helper.dart';
import '../../database/profile_database_helper.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../model/invoice_model.dart';
import '../contact/widget/button_widget.dart';

class InvoicedetailsScreen extends StatefulWidget {
  const InvoicedetailsScreen({Key? key}) : super(key: key);

  @override
  State<InvoicedetailsScreen> createState() => _InvoicedetailsScreenState();
}

class _InvoicedetailsScreenState extends State<InvoicedetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final db = InvoiceDatabaseHelper();

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed('addInvoice');
        },
        backgroundColor: kPrimaryColor,
        child: Center(
            child: Text(
          'Add New Invoice',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.center,
        )),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text('Invoices'),
        leading: IconButton(
          onPressed: () {
            context.pushNamed('home');
          },
          icon: Icon(Icons.arrow_back),
        ),
        bottom: TabBar(
          //unselectedLabelColor: Colors.white60,
          labelColor: Colors.white,
          indicatorColor: Color.fromARGB(255, 226, 136, 26),
          indicatorWeight: 5,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
          controller: tabController,
          tabs: [
            Tab(
              child: tabsStyle('All', context),
            ),
            Tab(
              child: tabsStyle('Draft', context),
            ),
             Tab(
              child: tabsStyle('Fully Paid', context),
            ),
            Tab(
              child: tabsStyle('Partially Paid', context),
            ),
            Tab(
              child: tabsStyle('Overdue', context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                FutureBuilder<List<Invoice>>(
                    future: db.getAllInvoice(),
                    initialData: const [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<Invoice> data = snapshot.data;
                      var datalength = data.length;
                      return datalength == 0
                          ? const Center(
                              child: Text('no data found'),
                            )
                          : ListView.builder(
                              itemCount: datalength,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                          height: 80,
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
                                                        .subtitle1
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
                                                'Invoice Number: ${data[i].number!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                                'Invoice Status: ${data[i].status!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                            
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 0,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.chevron_right,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {
                                                  showActionsBottomSheet(
                                                      context, data[i], i);
                                                },
                                                icon: Icon(
                                                  FontAwesomeIcons.ellipsis,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                    }),
                FutureBuilder<List<Invoice>>(
                    future: db.getAllInvoice(),
                    initialData: const [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<Invoice> data = snapshot.data.where((element)=> element.status == InvoiceStatus.draft.name).toList();
                      var datalength = data.length;
                      return datalength == 0
                          ? const Center(
                              child: Text('no data found'),
                            )
                          : ListView.builder(
                              itemCount: datalength,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                          height: 80,
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
                                                        .subtitle1
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
                                                'Invoice number: ${data[i].number!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                                'Invoice Status: ${data[i].status!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                            
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 0,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.chevron_right,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {
                                                  showActionsBottomSheet(
                                                      context, data[i], i);
                                                },
                                                icon: Icon(
                                                  FontAwesomeIcons.ellipsis,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                    }),
                FutureBuilder<List<Invoice>>(
                    future: db.getAllInvoice(),
                    initialData: const [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<Invoice> data = snapshot.data.where((element)=> element.status == InvoiceStatus.fullyPaid.name).toList();
                      var datalength = data.length;
                      return datalength == 0
                          ? const Center(
                              child: Text('no data found'),
                            )
                          : ListView.builder(
                              itemCount: datalength,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                          height: 80,
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
                                                        .subtitle1
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
                                                'Invoice number: ${data[i].number!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                                'Invoice Status: ${data[i].status!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                            
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 0,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.chevron_right,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {
                                                  showActionsBottomSheet(
                                                      context, data[i], i);
                                                },
                                                icon: Icon(
                                                  FontAwesomeIcons.ellipsis,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                    }),
                FutureBuilder<List<Invoice>>(
                    future: db.getAllInvoice(),
                    initialData: const [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<Invoice> data = snapshot.data.where((element)=> element.status == InvoiceStatus.partiallyPaid.name).toList();
                      var datalength = data.length;
                      return datalength == 0
                          ? const Center(
                              child: Text('no data found'),
                            )
                          : ListView.builder(
                              itemCount: datalength,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                          height: 80,
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
                                                        .subtitle1
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
                                                'Invoice number: ${data[i].number!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                                'Invoice Status: ${data[i].status!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                            
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 0,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.chevron_right,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {
                                                  showActionsBottomSheet(
                                                      context, data[i], i);
                                                },
                                                icon: Icon(
                                                  FontAwesomeIcons.ellipsis,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                    }),
                FutureBuilder<List<Invoice>>(
                    future: db.getAllInvoice(),
                    initialData: const [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<Invoice> data = snapshot.data.where((element)=> element.status == InvoiceStatus.overdue.name).toList();
                      var datalength = data.length;
                      return datalength == 0
                          ? const Center(
                              child: Text('no data found'),
                            )
                          : ListView.builder(
                              itemCount: datalength,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                          height: 80,
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
                                                        .subtitle1
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
                                                'Invoice number: ${data[i].number!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                                'Invoice Status: ${data[i].status!}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
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
                                            
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 0,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.chevron_right,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor),
                                            child: IconButton(
                                                onPressed: () {
                                                  showActionsBottomSheet(
                                                      context, data[i], i);
                                                },
                                                icon: Icon(
                                                  FontAwesomeIcons.ellipsis,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                    }),
                
              ],
            ),
          )
        ],
      ),
    );
  }

  Text tabsStyle(String? text, BuildContext context) {
    return Text(
      text!,
      style: FlutterFlowTheme.of(context).title2.override(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Future<dynamic> showActionsBottomSheet(
      BuildContext context, Invoice data, int index) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 330,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Actions",
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                  Container(
                    height: 300,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: ActionsButtonWidget(
                            text: "Share",
                            textColor: Colors.white,
                            icon: FontAwesomeIcons.share,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            data.status = InvoiceStatus.fullyPaid.name;
                            showAlertDialog(data, 'Fully Paid');
                          },
                          child: ActionsButtonWidget(
                              text: "Fully Paid",
                              icon: FontAwesomeIcons.paypal,
                              textColor: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                             data.status = InvoiceStatus.partiallyPaid.name;
                            showAlertDialog(data, 'Partially Paid');
                          },
                          child: ActionsButtonWidget(
                            text: "Partially Paid",
                            textColor: Colors.white,
                            icon: FontAwesomeIcons.moneyBill,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                             data.status = InvoiceStatus.overdue.name;
                            showAlertDialog(data, 'Overdue');
                          },
                          child: ActionsButtonWidget(
                            text: "Overdue",
                            textColor: Colors.white,
                            icon: FontAwesomeIcons.personCircleCheck,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ActionsButtonWidget(
                              text: "Edit",
                              textColor: Colors.white,
                              icon: Icons.edit),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ActionsButtonWidget(
                              text: "Delete",
                              textColor: Colors.white,
                              icon: Icons.delete),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
     showAlertDialog(Invoice data, String txt){
    return showDialog(context: context, builder: (_) =>
       AlertDialog(
        // title: const Text("Info"),
        content: Text('Do you want to change status to $txt'),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              updateInvoice(data);
            },
          )
        ],
      ));
  }

   Future updateInvoice(Invoice invoice) async {
    final invoiceData = Invoice(
      id: invoice.id,
      name: '',
      description: invoice.description,
      number: invoice.number,
      date: invoice.date,
      dueDate: invoice.dueDate,
      termId: invoice.termId,
      customerId: invoice.customerId,
      userId: currentUserUid,
      status: invoice.status
    );

    await InvoiceDatabaseHelper().updateInvoice(invoiceData);
    Navigator.pop(context);
 
  }
}
