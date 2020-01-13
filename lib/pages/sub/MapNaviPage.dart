import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';
import 'package:photo_view/photo_view.dart';

class MapNaviPage extends StatefulWidget {
  final CameraDescription camera;
  MapNaviPage({Key key, @required this.camera}) : super(key: key);
  MapNaviPageState createState() => new MapNaviPageState();
}

class MapNaviPageState extends State<MapNaviPage> {
  bool _ar = false;
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            width: Screen.width - 80,
            padding: EdgeInsets.fromLTRB(0, 10, 50, 10),
            child: TextField(
              onSubmitted: (value) {
                setState(() {});
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, top: 10),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: '输入您要前往的科室......',
              ),
            ),
          ),
        ],
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _ar
              ? FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, display the preview.
                      return Positioned(
                        child: Container(
                          width: 300,
                          height: 300,
                          child: CameraPreview(_cameraController),
                        ),
                      );
                    } else {
                      // Otherwise, display a loading indicator.
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : Container(),
          Positioned(
            top: _ar ? 300 : 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: Screen.height / 2,
              child: ClipRect(
                child: PhotoView(
                  tightMode: true,
                  initialScale: PhotoViewComputedScale.covered * 1.2,
                  minScale: PhotoViewComputedScale.covered,
                  maxScale: PhotoViewComputedScale.covered * 3,
                  imageProvider: AssetImage('static/images/map.png'),
                  backgroundDecoration:
                      BoxDecoration(color: GlobalConfig.backgroundColor),
                ),
              ),
            ),
          ),
          Positioned(
            left: 18,
            right: 18,
            top: 12,
            child: FlatButton(
              color: GlobalConfig.bottomBarColor,
              onPressed: () {
                setState(() {
                  _ar = !_ar;
                });
              },
              child: Text(
                _ar ? '切换到地图导航' : '切换到AR导航',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
