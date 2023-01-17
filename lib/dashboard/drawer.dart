import 'package:flutter/material.dart';
import 'privacy_policy.dart';
import 'about_us.dart';
import 'map_fathi.dart';
import 'dashboard.dart';
import 'my_drawer_header.dart';
import 'notifications.dart';
import 'map_fathi.dart';


class todays_report extends StatefulWidget {
  @override
  _todays_reportState createState() => _todays_reportState();
}

class _todays_reportState extends State<todays_report> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.map) {
      container = Map_by_fatti();
    }   else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.about_us) {
      container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6A8E78),
        title: Text("today's report"),
        centerTitle: true,
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Today's Report", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Map", Icons.map,
              currentPage == DrawerSections.map ? true : false),
          Divider(color: Colors.grey[400],),
          menuItem(3, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(color: Colors.grey[400],),
          menuItem(4, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(5, "About us", Icons.feedback_outlined,
              currentPage == DrawerSections.about_us ? true : false),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: MaterialButton(
              onPressed: () {},
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              minWidth: double.infinity,
              child: Text(
                "Login as Admin",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.map;
            } else if (id == 3) {
              currentPage = DrawerSections.notifications;
            } else if (id == 4) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 5) {
              currentPage = DrawerSections.about_us;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  map,
  notifications,
  // ignore: constant_identifier_names
  privacy_policy,
  // ignore: constant_identifier_names
  about_us,
}
