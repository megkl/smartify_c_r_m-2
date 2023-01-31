import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdf/pdf.dart';
import 'package:smartify_c_r_m/model/company_model.dart';
import 'package:smartify_c_r_m/model/contact_model.dart';
import '../../../components/pdf_invoice/pdf_api.dart';
import '../../../components/pdf_invoice/pdf_invoice_example.dart';
import '../../../components/utils.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../model/invoice_model.dart';
import '../widget/button_widget.dart';
import '../widget/title_widget.dart';
import 'package:pdf/widgets.dart' as pw;


class ReviewInvoiceScreen extends StatefulWidget {
  const ReviewInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<ReviewInvoiceScreen> createState() => _ReviewInvoiceScreenState();
}

class _ReviewInvoiceScreenState extends State<ReviewInvoiceScreen> {
  @override
  Widget build(BuildContext context) {

          final date = DateTime.now();
          final dueDate = date.add(Duration(days: 7));

    var kPrimaryColor = FlutterFlowTheme.of(context).primaryColor;
       final invoice = Invoice(
            company: CompanyModel(
              companyName: 'Encomm Solutions',
              companyAddress: 'View Park Towers, 10th floor',
              paypal: 'https://paypal.me/encommsolutions',
            ),
            customer: ContactModel(
              fullName: 'Magdaline Luke.',
              address: 'Design By Meg',
            ),
            info: InvoiceInfo(
              date: date,
              dueDate: dueDate,
              description: 'ENC0MM-S',
              number: '${DateTime.now().year}-9999',
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

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () async {
          final date = DateTime.now();
          final dueDate = date.add(Duration(days: 7));

          final invoice = Invoice(
            company: CompanyModel(
              companyName: 'Encomm Solutions',
              companyAddress: 'View Park Towers, 10th floor',
              paypal: 'https://paypal.me/encommsolutions',
            ),
            customer: ContactModel(
              fullName: 'Magdaline Luke.',
              address: 'Design By Meg',
            ),
            info: InvoiceInfo(
              date: date,
              dueDate: dueDate,
              description: 'ENC0MM-S',
              number: '${DateTime.now().year}-9999',
            ),
            items: [
              InvoiceItem(
                description: 'Macbook LAPTOPS',
                date: DateTime.now(),
                quantity: 2,
                vat: 0.19,
                discount: 0,
                unitPrice: 5.99,
              ),
              InvoiceItem(
                description: '20 Earpods',
                date: DateTime.now(),
                quantity: 8,
                vat: 0.16,
                discount: 0,
                unitPrice: 0.99,
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
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: buildHeader(invoice)),
          SizedBox(height: 30,),
          buildTitle(invoice),
          SizedBox(height: 20,),
          buildInvoice(invoice),
          Divider(),
          buildTotal(invoice),
        ],),
      )
    );
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
             buildSupplierAddress(invoice.company),

 Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/letter-s.png')
              ),
              
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer),
              buildInvoiceInfo(invoice.info,invoice.company),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(ContactModel customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bill To'),
          Text(customer.fullName!, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(customer.address!),
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo info,CompanyModel supplier) {
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

    return 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(titles.length, (index) {
            final title = titles[index];
            final value = data[index];

            return buildText(title: title, value: value, width: 200);
          }),
        
    );
  }

  static Widget buildSupplierAddress(CompanyModel supplier) => 
  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(supplier.companyName!, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.companyAddress!),
        ],
      );

  static Widget buildTitle(Invoice invoice) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment .center,
        children: [
          Text(
            'PRODUCT INVOICE',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Outfit',),
          ),
        ],
      );

  static Widget buildInvoice(Invoice invoice) {
    final headers = [
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Date')),
      DataColumn(label: Text('Qty')),
      DataColumn(label: Expanded(child: Text('Price',))),
      DataColumn(label: Text('VAT')),
      DataColumn(label: Text('Total'))
    ];
    final data = invoice.items.map((item) {
      final total = item.unitPrice! * item.quantity! * (1 + item.vat!);

      return DataRow(cells:[
        DataCell(Text(item.description!)),
        DataCell(Text(Utils.formatDate(item.date!))),
        DataCell(Text('${item.quantity}')),
        DataCell(Text('\KES ${item.unitPrice}')),
        DataCell(Text('${item.vat!*100} %')),
        DataCell(Text('\KES ${total.toStringAsFixed(2)}')),
  ]);
    }).toList();
   return DataTable(
    columnSpacing: 20,
    columns: headers, rows: data);
  
  }

  static Widget buildTotal(Invoice invoice) {
    final netTotal = invoice.items
        .map((item) => item.unitPrice! * item.quantity!)
        .reduce((item1, item2) => item1 + item2);
    final vatPercent = invoice.items.first.vat;
    final discountPercent = invoice.items.first.discount;
    final vat = netTotal * vatPercent!;
    final total = netTotal + vat;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
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
                buildText(
                  title: 'Vat ${vatPercent * 100} %',
                  value: Utils.formatPrice(vat),
                  unite: true,
                ),
                buildText(
                  title: 'Discount ${discountPercent! * 100} %',
                  value: Utils.formatPrice(vat),
                  unite: true,
                ),
                Divider(),
                buildText(
                  title: 'Total amount due',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: Utils.formatPrice(total),
                  unite: true,
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
          buildSimpleText(title: 'Address', value: invoice.company.companyAddress!),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Paypal', value: invoice.company.paypal!),
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
}
