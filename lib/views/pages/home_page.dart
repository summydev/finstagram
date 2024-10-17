import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:finstagram/model/services/service.dart';
import 'package:finstagram/views/pages/feed_page.dart';
import 'package:finstagram/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage =0 ;
  FirebaseService? _firebaseService;
  final List<Widget> _pages = [
   ProfilePage(),
    FeedPage()
  ];
  @override
  void initState() {

    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('F-instagram'),
        actions: [
          GestureDetector(
            child: Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: GestureDetector(
              onTap: ()async{
                await _firebaseService!.logout();
                Navigator.popAndPushNamed(context, 'login');
              },
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages[_currentPage],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (_index){
        setState(() {
          _currentPage=_index;
        });

      },
      items: const [
        BottomNavigationBarItem(
          label: 'Feed',
          icon: Icon(Icons.feed),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.account_box),
        ),
      ],
    );
  }
  void postImage()async {
    FilePickerResult? _result = await FilePicker.platform.pickFiles(type:FileType.image );
  File image= File(_result!.files.first.path!);
  await _firebaseService!.postImage(image);
  }
}
