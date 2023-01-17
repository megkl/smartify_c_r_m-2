import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/add_invoice_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/company_profile_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/customers_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/products_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/review_invoice.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/tabs/terms_screen.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../model/invoice_model.dart';

class InvoicedetailsScreen extends StatefulWidget {
  const InvoicedetailsScreen({Key? key}) : super(key: key);

  @override
  State<InvoicedetailsScreen> createState() => _InvoicedetailsScreenState();
}

class _InvoicedetailsScreenState extends State<InvoicedetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
        title: Text('New Invoice'),
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
                    ],
                  ),
                )
              ],
            ),
         
    );
  }
}
