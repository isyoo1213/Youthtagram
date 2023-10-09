import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _selectedIndex = 1;
  var _pageController = PageController(initialPage: 1);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close, color: Colors.black,),
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          _gallery_page(),
          _photo_page(),
          _video_page()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/actionbar_camera.png')),
              title: Text('GALLERY')
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/actionbar_camera.png')),
              title: Text('PHOTO')
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/actionbar_camera.png')),
              title: Text('VIDEO')
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index){
    _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  Widget _gallery_page(){
    return Container(
      color: Colors.green,
    );
  }

  Widget _photo_page(){
    return Container(
      color: Colors.red,
    );
  }

  Widget _video_page(){
    return Container(
      color: Colors.blue,
    );
  }

}
