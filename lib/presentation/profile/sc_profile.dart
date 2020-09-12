import 'package:flutter/material.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/widgets/widget_error_state.dart';
import '../presentation.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selected = 0;
  List<Widget> _page = [AboutScreen(), BlogScreen(), ProjectsScreen()];
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    // BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
    // });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
  //     if (state is ProfileLoading)
  //       return Center(
  //         child: WidgetCircleProgress(),
  //       );
  //     else if (state is ProfileLoaded)
  //       return _buildContent();
  //     else {
  //       return WidgetErrorState(
  //         refresh: () async {
  //           BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
  //         },
  //         message: "Unknow state",
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() => Scaffold(
        appBar: _buildAppBar(),
        body: _currentPage(),
        bottomNavigationBar: _buildNavigationBar(),
      );

  Widget _currentPage() {
    return _page?.elementAt(_selected) ?? WidgetErrorState();
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
          ),
        ]);
  }

  Widget _buildAppBar() => AppBar(
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
