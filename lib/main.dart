import 'package:flutter/material.dart';
import 'package:hypergaragesale/screens/camera_screen.dart';
import 'package:hypergaragesale/screens/category_screen.dart';
import 'package:hypergaragesale/screens/item_list_screen.dart';
import 'package:hypergaragesale/screens/login_screen.dart';
import 'package:hypergaragesale/screens/picture_preview.dart';
import 'package:hypergaragesale/screens/post_screen.dart';
import 'package:hypergaragesale/screens/registration_screen.dart';
import 'package:hypergaragesale/screens/welcome_screen.dart';

void main() => runApp(HyperGS());

class HyperGS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PostScreen.id, //CategoryScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        CategoryScreen.id: (context) => CategoryScreen(),
        PostScreen.id: (context) => PostScreen(
              category: 'books',
            ),
        //delete after complete
        ItemListScreen.id: (context) => ItemListScreen(
              category: 'books',
            ),
        //delete after complete
        CameraScreen.id: (context) => CameraScreen(),
        PicturePreviewScreen.id: (context) => PicturePreviewScreen(),
      },
    );
  }
}
