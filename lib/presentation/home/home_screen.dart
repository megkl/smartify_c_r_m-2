import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartify_c_r_m/presentation/company_details/company_details_screen.dart';
import 'package:smartify_c_r_m/presentation/contact/main_customer_list_widget.dart';
import 'package:smartify_c_r_m/presentation/company_details/add_company_details_screen.dart';
import 'package:smartify_c_r_m/presentation/invoice_details/invoice_details_screen.dart';
import 'package:smartify_c_r_m/presentation/presentation.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../schedule/meeting/meetings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Scaffold(
        appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              title:   Text(
                                            'Smartify CRM',
                                            
                                            style: FlutterFlowTheme.of(context)
                                                .title3.override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title3Family,
                                              color:Colors.white,
                                              fontSize: 20,
                                          )) ,
              actions: [],
              centerTitle: true,
              elevation: 0,
            )
         ,
        body: Container(
          margin: EdgeInsets.all(12),
          child:  
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StaggeredGrid.count(
                              crossAxisCount: 4,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              children: [
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 2,
                                  child: getMenus(0),
                                ),
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 2.5,
                                  child: getMenus(1),
                                ),
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 2.3,
                                  child: getMenus(2),
                                ),
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 1.8,
                                  child: getMenus(3),
                                ),
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 4,
                                  mainAxisCellCount: 1.0,
                                  child: getMenus(4),
                                ),
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 4,
                                  mainAxisCellCount: 1.0,
                                  child: getMenus(5),
                                ),
                              ],
                            ),
              ],
            ),
          )),
      ),
    );
  }
  getMenus(index){
    return GestureDetector(
      onTap: (){
        index == 0? Navigator.of(context).push(MaterialPageRoute(builder: ((context) => CompanyDetailsScreen()))):
        index == 1? Navigator.of(context).push(MaterialPageRoute(builder: ((context) => MainCustomerListWidget()))):
        index == 2? Navigator.of(context).push(MaterialPageRoute(builder: ((context) => CalendarScheduleScreen()))):
        index == 3? Navigator.of(context).push(MaterialPageRoute(builder: ((context) => InvoicedetailsScreen()))):
        index == 4? Navigator.of(context).push(MaterialPageRoute(builder: ((context) => MainProfilePageWidget()))):
         Navigator.of(context).push(MaterialPageRoute(builder: ((context) => MainProfilePageWidget())));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                    blurRadius: 7,
                    spreadRadius: 2,
                    color: Colors.grey.withOpacity(0.15))
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: 
          index == 4 || index == 5?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
                          ListTile(
                            
                              title:Text(menus[index].title!, style: FlutterFlowTheme.of(context)
                                                .title1.override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title1Family,
                                              color: FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18,
                                          ),),
                              subtitle:Text(
                                  menus[index].subTitle!,
                                  style:  FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w300,
                                    color: FlutterFlowTheme.of(context)
                                                      .gray600,
                                              fontSize: 14,
                                          ),
                                
                              ),
                            
                        
                          
                          trailing:ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: FlutterFlowTheme.of(context).primaryColor,
                                child: Icon(menus[index].icon,size: 30,color: FlutterFlowTheme.of(context).primaryBackground,))
                              ),
                        
          ))
          : Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: menus[index].iconBgColor,
                                child: Icon(menus[index].icon,size: 30,color: FlutterFlowTheme.of(context).primaryBackground,))
                              ),
                          SizedBox(
                            height: 15,
                          ),
                           Text(menus[index].title!, style: FlutterFlowTheme.of(context)
                                                  .title1.override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .title1Family,
                                                color: FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18,
                                            ),),
                                            SizedBox(
                            height: 15,
                          ),
                                Text(
                                    menus[index].subTitle!,
                                    style:  FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w300,
                                      color: FlutterFlowTheme.of(context)
                                                        .gray600,
                                                fontSize: 14,
                                            ),
                                  
                                ),
                              
                          ],
                      ),
          ),
        
        ),
      ),
    );
  }
   List<Menu> menus = [
    Menu(
        title: "COMPANY PROFILE",
        subTitle: "Modify,view company details",
        icon: Icons.location_city,
        iconBgColor: Color.fromARGB(255, 226, 136, 26)
    ),
    Menu(
        title: "CONTACTS",
        subTitle: "Add, edit and view contacts",
        icon: Icons.group,
        iconBgColor: Color.fromARGB(255, 163, 14, 4)
        ),
    Menu(
       title: "SCHEDULE",
        subTitle: "schedule meetings on your calendar",
        iconBgColor:Color.fromARGB(255, 3, 50, 120),
        icon: Icons.calendar_month),
    Menu(
        title: "INVOICE",
        subTitle: "Add and customize your invoice & quotations",
        iconBgColor: Colors.black,
        icon: FontAwesomeIcons.fileInvoice),
     Menu(
        title: "ANALYTICS",
        subTitle: "Reports section",
        iconBgColor: Colors.white,
        icon: Icons.stacked_line_chart),
    Menu(
        title: "SETTINGS",
        subTitle: "Configure your settings",
        iconBgColor: Colors.white,
        icon: Icons.settings),
  ];
   
}

class Menu {
  String? title;
  String? subTitle;
  IconData? icon;
  Color? iconBgColor;

  Menu({this.title,this.subTitle,this.icon, this.iconBgColor});
}
