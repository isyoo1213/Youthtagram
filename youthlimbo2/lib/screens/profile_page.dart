import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'file:///E:/flutter_workspace/youthlimbo2/lib/constants/size.dart';
import 'package:youthlimbo2/widgets/profile_side_menu.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool _menuOpened = false;

  double menuWidth;

  AlignmentGeometry tabAlign = Alignment.centerLeft;

  bool _tableIconGridSelected = true;

  double _gridMargin = 0;
  double _myImageGridMargin = size.width;



  @override
  void initState(){
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    menuWidth = size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _side_menu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _side_menu() {
    return AnimatedContainer(
      width: menuWidth,
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      duration: Duration(milliseconds: 200),
      transform: Matrix4.translationValues(
        _menuOpened ? size.width - menuWidth : size.width,
        0,
        0,
      ),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: ProfileSideMenu(),
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.transparent,
      duration: Duration(milliseconds: 200),
      transform: Matrix4.translationValues(
        _menuOpened ? -menuWidth : 0,
        0,
        0,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _username_iconbutton(),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _get_pforile_header,
                      _username(),
                      _user_bio(),
                      _edit_profile_button(),
                      _get_tab_icon_buttons,
                      _get_animated_selected_bar,
                    ]),
                  ),
                  _getImageGrid(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  SliverToBoxAdapter _getImageGrid(BuildContext context) => SliverToBoxAdapter(
    child: Stack(
      children: <Widget>[
        AnimatedContainer(
          child: _imageGrid,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
          transform: Matrix4.translationValues(
              _gridMargin,
              0,
              0),
        ),
        AnimatedContainer(
          child: _imageGrid,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
          transform: Matrix4.translationValues(
              _myImageGridMargin,
              0,
              0),
        ),
      ],
    ),
  );

  GridView get _imageGrid => GridView.count(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 3,
    childAspectRatio: 1, //가로세로비율
    children:
    List.generate(30, (index) => _gridImageItem(index)
    ),
  );

  CachedNetworkImage _gridImageItem(int index) => CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: 'https://picsum.photos/id/$index/30/30');

  Padding _edit_profile_button() {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: (){},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Edit Pforile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Padding _user_bio() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        'Bio from user. So say something.',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding _username() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        'User real name',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row get _get_pforile_header => Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(common_gap),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/youth_appbar.png'),
          radius: 40,
        ),
      ),
      Expanded(
        child: Table(
          children: [
            TableRow(children: [
              _get_status_value_widget('123'),
              _get_status_value_widget('123'),
              _get_status_value_widget('123'),
            ]),
            TableRow(children: [
              _get_status_label_widget('Posts'),
              _get_status_label_widget('Followers'),
              _get_status_label_widget('Followings'),
            ]),
          ],
        ),
      )
    ],
  );

  Widget _get_status_value_widget(String value) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap_s),
      child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    ),
  );

  Widget _get_status_label_widget(String value) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap_s),
      child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w300),
          )),
    ),
  );

  Row _username_iconbutton() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: common_gap),
              child: Text(
                'YouthLimbo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
        IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
            semanticLabel: 'Show menu',
          ),
          onPressed: (){
            _menuOpened ? _animationController.reverse() : _animationController.forward();
            setState(() {
              _menuOpened = !_menuOpened;
            });
          },
        ),
      ],
    );
  }

  Widget get _get_tab_icon_buttons => Row(
    children: <Widget>[
      Expanded(
          child: IconButton(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              color: _tableIconGridSelected?Colors.black:Colors.black26,
              onPressed: (){
                _set_tab(true);
              })
      ),
      Expanded(
          child: IconButton(
              icon: ImageIcon(AssetImage('assets/saved.png')),
              color: _tableIconGridSelected?Colors.black26:Colors.black,
              onPressed: (){
                _set_tab(false);
              })
      ),
    ],
  );

  Widget get _get_animated_selected_bar => AnimatedContainer(
    duration: Duration(milliseconds: 200),
    alignment: tabAlign,
    curve: Curves.easeInOut,
    color: Colors.transparent,
    height: 1,
    width: size.width,
    child: Container(
      height: 1,
      width: size.width/2,
      color: Colors.black87,
    ),
  );

  _set_tab(bool tab_left){
    setState(() {
      if(tab_left==true){
        this.tabAlign = Alignment.centerLeft;
        this._tableIconGridSelected = true;
        this._gridMargin = 0;
        this._myImageGridMargin = size.width;
      } else {
        this.tabAlign = Alignment.centerRight;
        this._tableIconGridSelected = false;
        this._gridMargin = -size.width;
        this._myImageGridMargin = 0;
      }
    });
  }
}
