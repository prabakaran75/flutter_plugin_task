import 'package:flutter/material.dart';

class TabBarWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            
            dividerHeight: 1,
            indicatorColor: Colors.white, // Customize tab indicator
            labelColor: Colors.white, // Selected tab text color
            unselectedLabelColor: Colors.grey, // Unselected tab text color
            tabs: [
              Tab(text: "Today"),
              Tab(text: "Yesterday"),
              Tab(text: "Others"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Today's Content")), // Content for Today
            Center(child: Text("Yesterday's Content")), // Content for Yesterday
            Center(child: Text("Others' Content")), // Content for Others
          ],
        ),
      ),
    );
  }
}
