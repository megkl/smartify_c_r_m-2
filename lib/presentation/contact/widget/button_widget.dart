import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartify_c_r_m/flutter_flow/flutter_flow_theme.dart';


class ActionsButtonWidget extends StatelessWidget {
  const ActionsButtonWidget({Key? key,
     required this.text,
     required this.textColor, this.icon}) : super(key: key);
  //final Color backgroundcolor;
  final String text;
  final Color textColor;
  final IconData? icon;

  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 80,
        height: 90,
        decoration: BoxDecoration(
          //color: backgroundcolor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Icon(icon, color: FlutterFlowTheme.of(context).primaryColor,),
          SizedBox(height: 5,),
          Text(text, style: FlutterFlowTheme.of(context).bodyText2)
        ],)
        
      ),
    );
  }
}