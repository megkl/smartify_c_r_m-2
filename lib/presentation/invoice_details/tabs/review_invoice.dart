import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdf/pdf.dart';
import 'package:smartify_c_r_m/auth/auth_util.dart';
import 'package:smartify_c_r_m/database/invoice_database_helper.dart';
import 'package:smartify_c_r_m/database/profile_database_helper.dart';
import 'package:smartify_c_r_m/model/company_model.dart';
import 'package:smartify_c_r_m/model/contact_model.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/add_invoice_screen.dart';
import '../../../auth/firebase_user_provider.dart';
import '../../../components/pdf_invoice/pdf_api.dart';
import '../../../components/pdf_invoice/pdf_invoice_example.dart';
import '../../../components/utils.dart';
import '../../../database/products_database_helper.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../model/invoice_model.dart';
import '../../home/home_screen.dart';
import '../widget/button_widget.dart';
import '../widget/title_widget.dart';
import 'package:pdf/widgets.dart' as pw;

class ReviewInvoiceScreen extends StatefulWidget {
  const ReviewInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<ReviewInvoiceScreen> createState() => _ReviewInvoiceScreenState();
}

class _ReviewInvoiceScreenState extends State<ReviewInvoiceScreen> {
  final profileDb = CompanyDatabaseHelper();

  @override
  void initState() {
    if (termsInvoice == null) {
      Future.delayed(Duration.zero, () {
        showAlertDialog();
      });
    }

    getProfile();
    super.initState();
  }

  getProfile() async {
    //companyProfile = await profileDb.getCompanyById(1);
    companyProfile = await profileDb.getCompanyByUserId(currentUser!.user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    List<InvoiceItem> productList = [];
    for (var i = 0; i < productsListInvoice.length; i++) {
      productList.add(
        new InvoiceItem(
          description: productsListInvoice[i].description,
          date: DateTime.now(),
          quantity: productsListInvoice[i].quantity,
          vat: double.parse((((productsListInvoice[i].vat!) /
                      (productsListInvoice[i].unitPrice! *
                          productsListInvoice[i].quantity!)) *
                  100)
              .toStringAsFixed(0)),
          discount: double.parse((((productsListInvoice[i].discount!) /
                      (productsListInvoice[i].unitPrice! *
                          productsListInvoice[i].quantity!)) *
                  100)
              .toStringAsFixed(0)),
          unitPrice: productsListInvoice[i].unitPrice,
        ),
      );
    }
    final date = DateTime.now();
    final dueDate = date.add(Duration(days: 7));

    var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
    final invoice = Invoice(
        company: CompanyModel(
          companyName: companyProfile!.companyName,
          companyAddress: companyProfile!.companyAddress,
          paypal: '',
        ),
        customer: ContactModel(
          fullName: customerInvoice!.fullName ?? '',
          address: customerInvoice!.address ?? '',
          emails: customerInvoice!.emails ?? '',
          phoneNumbers: customerInvoice!.phoneNumbers ?? '',
        ),
        info: InvoiceInfo(
          date: date,
          dueDate: dueDate,
          description:
              '${customerInvoice!.fullName ?? ''} - ${companyProfile!.companyName}',
          number: invoiceNumber,
        ),
        items: productList);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {
addInvoice(invoice);
              },
              child: Center(
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        'SAVE AS DRAFT',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ))),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () async {
            final date = DateTime.now();
            final dueDate = date.add(Duration(days: 7));

            final invoice = Invoice(
              company: CompanyModel(
                companyName: companyProfile!.companyName,
                companyAddress: companyProfile!.companyAddress,
                paypal: '',
              ),
              customer: ContactModel(
                fullName: customerInvoice!.fullName,
                address: customerInvoice!.otherInfo,
                emails: customerInvoice!.phoneNumbers,
                phoneNumbers: customerInvoice!.phoneNumbers,
              ),
              info: InvoiceInfo(
                date: date,
                dueDate: dueDate,
                description:
                    '${customerInvoice!.fullName} - ${companyProfile!.companyName}',
                number: invoiceNumber,
              ),
              items: [
                InvoiceItem(
                  description: 'Macbook LAPTOPS',
                  date: DateTime.now(),
                  quantity: 2,
                  vat: 0.19,
                  discount: 0,
                  unitPrice: 599,
                ),
                InvoiceItem(
                  description: '20 Earpods',
                  date: DateTime.now(),
                  quantity: 8,
                  vat: 0.16,
                  discount: 0,
                  unitPrice: 99,
                ),
              ],
            );

            final pdfFile = await PdfInvoiceApi.generate(invoice);

            PdfApi.openFile(pdfFile);
          },
          child: Center(
              child: Text(
            'Generate PDF',
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //buildTitle(invoice),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: buildHeader(invoice)),
              //SizedBox(height: 30,),
              //buildTitle(invoice),
              SizedBox(
                height: 20,
              ),
              buildInvoice(invoice),
              Divider(),
              buildTotal(invoice),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Terms & Conditions'),
                      Divider(),
                      Text(
                        termsInvoice!.description!,
                        textAlign: TextAlign.center,
                      )
                    ]),
              )
            ],
          ),
        ));
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(invoice.company!),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer!),
              buildInvoiceInfo(invoice.info!, invoice.company!),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(ContactModel customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bill To'),
          Text(customer.fullName!,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(customer.address ?? ''),
          Text(customer.emails ?? ''),
          Text(customer.phoneNumbers ?? ''),
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo info, CompanyModel supplier) {
    final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Invoice Number:',
      'Invoice Date:',
      'Payment Terms:',
      'Due Date:'
    ];
    final data = <String>[
      info.number,
      Utils.formatDate(info.date),
      paymentTerms,
      Utils.formatDate(info.dueDate),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildSupplierAddress(CompanyModel supplier) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(supplier.companyName!,
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.companyAddress!),
        ],
      );

  static Widget buildTitle(Invoice invoice) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'DRAFT INVOICE',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Container(height: 1, color: kPrimaryColor),
        ],
      );

  static Widget buildInvoice(Invoice invoice) {
    final headers = [
      DataColumn(
          label: Text(
        'Name',
        style: TextStyle(color: kWhiteColor),
      )),
      DataColumn(
          label: Text(
        'Date',
        style: TextStyle(color: kWhiteColor),
      )),
      DataColumn(
          label: Text(
        'Qty',
        style: TextStyle(color: kWhiteColor),
      )),
      DataColumn(
          label: Expanded(
              child: Text(
        'Price(KES)',
        style: TextStyle(color: kWhiteColor),
      ))),
      DataColumn(
          label: Text(
        'VAT(%)',
        style: TextStyle(color: kWhiteColor),
      )),
      DataColumn(
          label: Text(
        'Total',
        style: TextStyle(color: kWhiteColor),
      ))
    ];
    final data = invoice.items!.map((item) {
      print(item.vat);
      final total = item.unitPrice! * item.quantity! +
          (item.vat! / 100 * item.unitPrice! * item.quantity!) -
          (item.discount! / 100 * item.unitPrice! * item.quantity!);

      return DataRow(cells: [
        DataCell(Text(item.description!)),
        DataCell(Text(Utils.formatDate(item.date!))),
        DataCell(Text('${item.quantity}')),
        DataCell(Text('${item.unitPrice}')),
        DataCell(Text('${item.vat!} %')),
        DataCell(Text('${total.toStringAsFixed(2)}')),
      ]);
    }).toList();
    return DataTable(
        headingRowColor: MaterialStateProperty.all(kPrimaryColor),
        columnSpacing: 20,
        columns: headers,
        rows: data);
  }

  static Widget buildTotal(Invoice invoice) {
    final netTotal = invoice.items!
        .map((item) => item.unitPrice! * item.quantity!)
        .reduce((item1, item2) => item1 + item2);
    final vatPercent = invoice.items!.first.vat;
    final discountPercent = invoice.items!.first.discount;
    final vat = netTotal * vatPercent!;
    final discount = netTotal * discountPercent!;
    final total = netTotal + vat / 100 - discount / 100;

    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 3),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total',
                  value: Utils.formatPrice(netTotal),
                  unite: true,
                ),
                SizedBox(
                  height: 10,
                ),
                buildText(
                  title: 'Vat (${vatPercent.toStringAsFixed(0)} %)',
                  value: Utils.formatPrice(vat / 100),
                  unite: true,
                ),
                SizedBox(
                  height: 10,
                ),
                buildText(
                  title: 'Discount (${discountPercent.toStringAsFixed(0)} %)',
                  value: Utils.formatPrice(discount / 100),
                  unite: true,
                ),
                Divider(),
                Container(
                  width: 400,
                  height: 50,
                  color: kPrimaryColor,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: buildText(
                        title: 'Total amount due',
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor),
                        value: Utils.formatPrice(total),
                        unite: true,
                      )),
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: Colors.grey),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Address', value: invoice.company!.companyAddress!),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Paypal', value: invoice.company!.paypal!),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }

  showAlertDialog() {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Info"),
              content: Text('Select terms to proceed'),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => AddInvoiceScreen())));
                  },
                )
              ],
            ));
  }
   Future addInvoice(Invoice invoice) async {
    final invoiceData = Invoice(
      name: '',
      description: invoice.info!.description,
      number: invoice.info!.number,
      date: invoice.info!.date,
      dueDate: invoice.info!.dueDate,
      termId: termsInvoice!.id,
      customerId: invoice.customer!.id,
      userId: currentUserUid,
      status: InvoiceStatus.draft.name
    );

   var invoiceId = await InvoiceDatabaseHelper().insertInvoice(invoiceData);
  for (InvoiceItem object in invoice.items!) {
   object.invoiceId = invoiceId;
  await ProductDatabaseHelper().updateInvoiceItem(object);
}   
  }

  Future editProduct(Invoice invoice) async {
    
  }

}
