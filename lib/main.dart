import 'package:flutter/material.dart';
import 'controller/album_controller.dart';
import 'api/post_service.dart';
import 'package:provider/provider.dart';
import 'photos_body.dart';
import 'topbar.dart';
import 'post_body.dart';
import 'user_body.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  final List<Widget> _post = [
    const PostsBody(),
    const UsersBody(),
    const PhotosBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AlbumDetailProvider(),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          body: _post.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: 'Posts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: 'Photos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Users',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 5.0,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
