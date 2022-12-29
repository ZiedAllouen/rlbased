import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:roleb/favorite.dart';
import 'package:roleb/favorite_provider.dart';
import 'package:roleb/login.dart';
import 'package:roleb/viewforclient.dart';
import 'Auth_Service.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'AddDish.dart';
import 'DishCard.dart';

import 'View_data.dart';

class HomefavPage extends StatefulWidget {
  HomefavPage({Key?key}) : super(key: key);

  @override
  _HomefavPageState createState() => _HomefavPageState();
}

class _HomefavPageState extends State<HomefavPage> {
  AuthClass authClass = AuthClass();
  final Stream <QuerySnapshot> _stream=FirebaseFirestore.instance.collection("dishes").snapshots();
  @override
  Widget build(BuildContext context) {
        final provider =Provider.of<FavoriteProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Dishes List",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.white)
        ,),
      ),
bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Colors.black87,
  items: [
  BottomNavigationBarItem(icon: Icon
  (Icons.home,size: 32,color:  Colors.white,
  ),
label: 'Home',
  ),
    BottomNavigationBarItem(
      icon:InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>FavoritePage()));
        },
        child:Container(height: 52,
    width: 52,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(colors: [Colors.indigoAccent
      ,Colors.purple])
    ), child: Icon(Icons.favorite,
  size: 32,color: Colors.white,
  ),)
      ),
label: 'Fav',
  ),
  
    BottomNavigationBarItem(
      icon:InkWell(
        onTap: () {
                logout(context);
              },
        child:Container(height: 52,
    width: 52,
     child: Icon(Icons.logout,
  size: 32,color: Colors.white,
  ),)
      ),
label: 'Logout',
  ),

]),

body:StreamBuilder<dynamic>(
  stream:_stream,
  builder:(context, snapshot) {
    if (!snapshot.hasData){
      return Center(child: CircularProgressIndicator());
    }
     return ListView.builder(
      itemCount: snapshot.data.docs.length,
      itemBuilder: (context, index) {
        late IconData iconData;
        late Color iconColor;
        late Icon icon;
        Map<String,dynamic>document=
        snapshot.data.docs[index].data() as Map<String,dynamic>;
        switch(document["time"]){
          case "Breakfast": iconData=Icons.sunny;
          iconColor=Colors.yellow;
          break;
          case "Lunch": iconData=Icons.food_bank;
          iconColor=Colors.lightBlue;
          break;
          case "Dinner": iconData=Icons.mode_night;
          iconColor=Colors.black;
          break;
          default:iconData=Icons.food_bank;
          iconColor=Colors.lightBlue;
        }
         final word = document["title"].toString();
       return ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute
          (builder: (builder)=>ViewPage(document: document,
          id:snapshot.data.docs[index].id,),
          ));
        },
        title:DishCard(
        title: document['title'] ==null ? "hey":document["title"], 
       iconData: iconData, 
       iconColor: iconColor, 
       time: document['time'] ==null ? "anytime":document["time"], 
       iconBgColor: Colors.white
       ),


       trailing: IconButton(
              onPressed: () {
           provider.toggleFavorite(word);
              },
              icon: provider.isExist(word)
                  ? const Icon(Icons.favorite, color: Colors.red,size: 30)
                  : const Icon(Icons.favorite_border,size: 30,color: Colors.white),
            ),
       ) ;

     }
     
     );
  })
    );
  }
  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}