import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/navigation/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_error_state.dart';
import '../presentation.dart';
import 'bloc/bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selected = 0;
  List<Widget> _page = [AboutScreen(), BlogScreen(), ProjectsScreen()];

  bool hasAuth;
  String username;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String routeName = ModalRoute.of(context).settings.name;
      username = routeName.substring(routeName.indexOf('@'));
      hasAuth = BlocProvider.of<NavigationBloc>(context).state
          is NavigationAuthenticated;
      BlocProvider.of<ProfileBloc>(context)
          .add(LoadProfile(hasAuth: hasAuth, username: username));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading)
        return Center(
          child: WidgetCircleProgress(),
        );
      else if (state is ProfileLoaded) {
        return _buildContent(
            isEditing: state.isEditing, isCanEdit: state.isCanEdit);
      } else {
        return WidgetErrorState(
          refresh: () async {
            BlocProvider.of<ProfileBloc>(context)
                .add(LoadProfile(hasAuth: hasAuth, username: username));
          },
          message: "Unknow state",
        );
      }
    });
  }

  Widget _buildContent({bool isEditing, bool isCanEdit}) => Scaffold(
        appBar: _buildAppBar(isEditing: isEditing, isCanEdit: isCanEdit),
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

  Widget _buildAppBar({bool isEditing = false, bool isCanEdit = false}) {
    return AppBar(
      actions: [
        isCanEdit
            ? IconButton(
                icon: Icon(isEditing
                    ? MaterialCommunityIcons.eye_outline
                    : Icons.edit),
                onPressed: () => BlocProvider.of<ProfileBloc>(context)
                    .add(SwitchControlProfile(editing: !isEditing)))
            : SizedBox(),
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
