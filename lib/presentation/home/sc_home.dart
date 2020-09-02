import 'package:flutter/material.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/about/sc_about.dart';
import 'package:portfolio_website/presentation/blog/sc_blog.dart';
import 'package:portfolio_website/presentation/projects/sc_projects.dart';
import '../theme_switcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
  List<Widget> _page = [AboutScreen(), BlogScreen(), ProjectsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _currentPage(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _currentPage() {
    return _page.elementAt(_selected);
  }

  Widget _buildNavigationBar() {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selected = index;
          });
        },
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selected,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('About'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            title: Text('Blog'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_screen_share),
            title: Text('Projects'),
          )
        ]);
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            icon: ThemeSwitcher.of(context).isLightMode
                ? Image.asset(
                    AppImages.icMoon,
                    height: 20,
                    width: 20,
                  )
                : Icon(Icons.wb_sunny),
            onPressed: () => ThemeSwitcher.of(context).switchMode())
      ],
    );
  }
}
