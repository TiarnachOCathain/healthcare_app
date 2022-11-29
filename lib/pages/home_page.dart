//import 'dart:math';
//import 'package:camera/camera.dart';
//import '../widgets/camera.dart';
//import 'package:image_picker/image_picker.dart';
//import '../widgets/scrollable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_project_two/pages/camera_page.dart';
import '../data.dart';

//This is the homepage class that returns the homepage
//of the app when opened.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

//This class descripes the structure of the Home page
//of the app with its scaffold of widgets that provide
//funtionality.
class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var _deviceHeight;
  // ignore: prefer_typing_uninitialized_variables
  var _deviceWidth;
  // ignore: prefer_typing_uninitialized_variables
  var _selectedPage;

  @override
  void initState() {
    super.initState();
    _selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight =
        MediaQuery.of(context).size.height; //Detects the height of users screen
    _deviceWidth =
        MediaQuery.of(context).size.width; //Detects the width of users screen
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _featuredHealthWidget(), //This widget holds the scrollable info images at top of page
          _gradientBoxWidget(), //This widget provides the gradient aesthetic for homepage
          _topLayerWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: const Icon(Icons.camera),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CameraPageWidget()),
          );
        },
      ),
    );
  }

  ///This widget holds the scrollable featured info widgets at the
  ///top of the screen
  Widget _featuredHealthWidget() {
    return SizedBox(
      height:
          _deviceHeight * 0.5, //Half of screen taken by featured info images
      width: _deviceWidth,
      child: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        scrollDirection: Axis.horizontal,
        children: featuredIcons.map((health) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(health.coverImage.url),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.80,
        width: _deviceWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 45, 59, 1.0),
              Colors.transparent,
            ],
            stops: [0.65, 1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.05, vertical: _deviceHeight * 0.005),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBarWidget(),
          SizedBox(height: _deviceHeight * 0.18),
          _featuredHealthInfoWidget(),
          //_cameraPageState(),
          // ScrollableGamesWidget(
          //     _deviceHeight * 0.24, _deviceWidth, false, healthIcon)
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: _deviceWidth * 0.03,
              ),
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

//This Widget shows the featured elements of the
//homepage that will hold important info for the user
  Widget _featuredHealthInfoWidget() {
    return SingleChildScrollView(
      child: Column(
        //height: _deviceHeight * 0.12,
        //width: _deviceWidth,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          SizedBox(height: _deviceHeight * 0.18, width: _deviceWidth),
          Text(
            featuredIcons[_selectedPage].title,
            maxLines: 2,
            style:
                TextStyle(color: Colors.white, fontSize: _deviceHeight * 0.040),
          ),
          SizedBox(height: _deviceHeight * 0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredIcons.map((healthIcon) {
              bool isActive =
                  healthIcon.title == featuredIcons[_selectedPage].title;
              double circleRadius = _deviceHeight * 0.008;
              return Container(
                margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                height: circleRadius / 2,
                width: circleRadius * 2,
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  // Widget AppImagePicker() {
  //   return Scaffold()
  // }
}
