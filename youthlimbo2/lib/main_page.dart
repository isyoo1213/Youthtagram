import 'package:flutter/material.dart';
import 'package:youthlimbo2/screens/camera_page.dart';
import 'package:youthlimbo2/screens/feed_page.dart';
import 'package:youthlimbo2/screens/profile_page.dart';
import 'package:youthlimbo2/screens/search_page.dart';
import 'file:///E:/flutter_workspace/youthlimbo2/lib/constants/size.dart';
import 'package:youthlimbo2/widgets/my_progress_indicator.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex=0;

  static List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    SearchPage(),
    CameraPage(),
    MyProgressIndicator(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    if(size==null){
      size = MediaQuery.of(context).size;
    }

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, //아이콘 밑에 레이블 없애기
        showUnselectedLabels: false, //이것도 아이콘 밑에 레이블 없애고 네비게이션바 가운데로 오게끔
        unselectedItemColor: Colors.grey[900],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(249,249,249,1),
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(activeIconPath: "assets/home_selected.png", iconPath: "assets/home.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/search_selected.png", iconPath: "assets/search.png"),
          _buildBottomNavigationBarItem(iconPath: "assets/add.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/heart_selected.png", iconPath: "assets/heart.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/profile_selected.png", iconPath: "assets/profile.png")
        ],
        currentIndex: _selectedIndex,
        onTap: (index)=> _onItemTapped(index),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({String activeIconPath, String iconPath}) {
    return BottomNavigationBarItem(
        activeIcon: activeIconPath == null?null:ImageIcon(AssetImage(activeIconPath)),
        icon: ImageIcon(AssetImage(iconPath)),
        title: Text('')
    );
  }

  void _onItemTapped(int index){
    if(index==2){
      openCamera(context);
    }else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  openCamera(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>CameraPage())
    );
  }

}