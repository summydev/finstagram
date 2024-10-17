import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finstagram/model/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseService? _firebaseService;
  double? _deviceHeight, _deviceWidth;

  @override
  void initState() {

    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }
  @override
  Widget build(BuildContext context) {
    _deviceWidth =MediaQuery.of(context).size.width;
    _deviceHeight =MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _deviceWidth! * 0.05,
        vertical: _deviceHeight! * 0.02
      ),

      color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _profileImage(),
        ],

      ),
    );
  }
  Widget _profileImage(){
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight! * 0.02),
      height: _deviceHeight! * 0.15,
      width: _deviceHeight! * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(_firebaseService!.currentUser!["image"]))
      ),
    );
  }
  Widget _postGridView(){
    return Expanded(child:
    StreamBuilder<QuerySnapshot>(stream: _firebaseService!.getPostForUser(), builder: (BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.hasData){
      List posts = snapshot.data!.docs.map((e)=> e.data()).toList();
      return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
          itemCount: posts.length,
          itemBuilder: (context, index){
        Map post = posts[index];
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage( fit: BoxFit.cover, image: NetworkImage(post["image"],),),
          ),
        );

          });
    }else{

      return Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }


    },)
    );

  }
}
