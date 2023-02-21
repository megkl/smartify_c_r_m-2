import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartify_c_r_m/presentation/home/home_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/add_invoice_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/company_profile_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/customers_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/products_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/review_invoice.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/terms_screen.dart';
import '../../database/profile_database_helper.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../model/company_model.dart';
import '../../model/contact_model.dart';
import '../../model/invoice_model.dart';
import '../../model/terms_model.dart';

dynamic customerId;
dynamic userId;
dynamic termId;
List<InvoiceItem> productsListInvoice =[];
ContactModel? customerInvoice;
Terms? termsInvoice;
dynamic  invoiceDate = '${DateFormat.yMd().format(DateTime.now())}';
var  dueDate = '${DateFormat.yMd().format(DateTime.now().add(Duration(days: 7)))}';
var invoiceNumber = '${DateFormat.y().format(DateTime.now())} - ${DateFormat('HH:mm:ss').format(DateTime.now())}';

class AddInvoiceScreen extends StatefulWidget {
  const AddInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<AddInvoiceScreen> createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text('Create New Invoice'),
        leading: IconButton(
          onPressed: (){
            context.pushNamed('invoiceDetails');
          },
          icon: Icon(Icons.arrow_back),),
        
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          indicatorColor: Color.fromARGB(255, 226, 136, 26),
          indicatorWeight: 2,
          isScrollable: true,
          indicator: UnderlineTabIndicator(
           
              borderSide: BorderSide(
                color: Color.fromARGB(255, 226, 136, 26),
                width: 5.0,
              ),
              insets: EdgeInsets.symmetric(horizontal: 40.0)),
          // indicator: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(5),
          // ),
          controller: tabController,
          tabs: [
            Tab(
              text: 'Company',
            ),
            Tab(
              text: 'Customer',
            ),
            Tab(
              text: 'Product',
            ),
            Tab(
              text: 'Terms',
            ),
            Tab(
              text: 'Review',
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
                      EditCompanyProfileScreen(),
                      CustomersScreen(),
                      ProductsScreen(),
                      TermsScreen(),
                      ReviewInvoiceScreen()
                      //InvoiceReviewScreen()
                    ],
                  ),
                )
              ],
            ),
         
    );
  }
}
