import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import 'widget/contact_list.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage(this.contacts);
  List<Contact> contacts =[];
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contactsFiltered = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();
  bool contactsLoaded = true;
  @override
  void initState() {
    getContacts();
    super.initState();
  }
String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }
  getContacts() async {
  List<Contact> _contacts = widget.contacts;

    // //We already have permissions for contact when we get to this page, so we
    // // are now just retrieving it
    // final List<Contact> contacts = await ContactsService.getContacts();
    //   _contacts = contacts;
    //   contactsLoaded = true;
    searchController.addListener(() {
        filterContacts();
      });
    
    // setState(() {
    //   _contacts = contacts;
    //   contactsLoaded = true;
    // });
  }

 filterContacts() {
    List<Contact> contacts = [];
    contacts.addAll(widget.contacts);
    if (searchController.text.isNotEmpty) {
      contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.displayName!.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.phones!.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value??'');
          return phnFlattened.contains(searchTermFlatten);
        }
        );

        return phone != null;
      });
    }
    setState(() {
      contactsFiltered = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    bool listItemsExist = (
        (isSearching == true && contactsFiltered.length > 0) ||
        (isSearching != true &&   widget.contacts.length > 0)
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        title: (Text('Add from device Contacts',
        style: FlutterFlowTheme.of(context)
                                                .title3.override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title3Family,
                                              color:Colors.white,
                                              fontSize: 20,
                                          )))),
      
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor
                    )
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: FlutterFlowTheme.of(context).primaryColor
                  )
                ),
              ),
            ),
            contactsLoaded == true ?  // if the contacts have not been loaded yet
              listItemsExist == true ?  // if we have contacts to show
              ContactsList(
                reloadContacts: () {
                  getContacts();
                },
                contacts: isSearching == true ? contactsFiltered : widget.contacts,
              ) : Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  isSearching ?'No search results to show' : 'No contacts exist',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )
               ) 
              :
            Container(  // still loading contacts
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}