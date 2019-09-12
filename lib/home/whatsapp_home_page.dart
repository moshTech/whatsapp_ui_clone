import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/tabs/calls.dart';
import 'package:whatsapp_ui_clone/tabs/camera.dart';
import 'package:whatsapp_ui_clone/tabs/chats.dart';
import 'package:whatsapp_ui_clone/tabs/status.dart';

// ignore: public_member_api_docs
class WhatsAppHomePage extends StatefulWidget {
  /// Constructor
  const WhatsAppHomePage({Key key, this.title}) : super(key: key);

  /// Variables
  final String title;

  @override
  _WhatsAppHomePageState createState() => _WhatsAppHomePageState();
}

class _WhatsAppHomePageState extends State<WhatsAppHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (context) {
              return ActionItems.choices.map((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Camera(),
          Chats(),
          Status(),
          Calls(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        tooltip: 'Contacts',
      ),
    );
  }

  void choiceAction(String value) {
    print('Working');
  }
}

class ActionItems {
  static const String newGroup = 'New group';
  static const String newBroadcast = 'New broadcast';
  static const String whatsAppWeb = 'WhatsApp Web';
  static const String starredMessages = 'Starred messages';
  static const String settings = 'Settings';

  static const List<String> choices = <String>[
    newGroup,
    newBroadcast,
    whatsAppWeb,
    starredMessages,
    settings
  ];
}
