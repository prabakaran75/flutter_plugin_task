import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_task/screens/last_login/widgets/list_of_data.dart';
import 'package:intl/intl.dart';

class TabBarViewData extends StatelessWidget {
  const TabBarViewData({
    super.key,
    required this.height,
    required this.width,
    required this.user,
  });

  final double height;
  final double width;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.6,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontSize: 13,
              ),
              tabs: [
                Tab(text: "Today"),
                Tab(text: "Yesterday"),
                Tab(text: "Others"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ListOfData(height: height, width: width, user: user);
                        }),
                  ),


                  Container(
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ListOfData(height: height, width: width, user: user);
                        }),
                  ),


                  Container(
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ListOfData(height: height, width: width, user: user);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
