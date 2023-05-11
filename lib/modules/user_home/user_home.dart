import 'package:dawaey/modules/Search/search_screen.dart';
import 'package:dawaey/modules/user_home/medicine_list_tab.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            // BottomNavigationBarItem(
            //     icon: Icon(CupertinoIcons.list_bullet), label: "List"),
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.mosque,
            //     ),
            //     label: 'Charity'),
          ],
        ),
      ),
    );
  }

  var tabs = [MedicineListTab(), SearchPage()];
}
