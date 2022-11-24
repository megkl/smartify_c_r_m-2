import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class ContactsList extends StatelessWidget {
  final List<Contact>? contacts;
  Function()? reloadContacts;
  ContactsList({Key? key, this.contacts, this.reloadContacts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts!.length,
        itemBuilder: (context, index) {
          Contact contact = contacts![index];

          return 
            ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                  leading: (contact.avatar != null && contact.avatar!.isNotEmpty)
                      ? CircleAvatar(
                        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                          backgroundImage: MemoryImage(contact.avatar!),
                        )
                      : CircleAvatar(
                          child: Text(contact.initials(), style: TextStyle(color: Colors.white),),
                                                 backgroundColor: FlutterFlowTheme.of(context).primaryColor,

                        ),
                  title: Text(contact.displayName ?? ''),
                  subtitle: contact.phones!.isNotEmpty ? Text(contact.phones![0].value ?? ''):Text(''),
                  //This can be further expanded to showing contacts detail
                  // onPressed().
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add))
                );
               },
      ),
    );
  }
}