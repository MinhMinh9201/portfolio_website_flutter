import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/blog/bloc/bloc.dart';
import 'package:portfolio_website/presentation/login/bloc/bloc.dart';
import 'package:portfolio_website/presentation/navigation/sc_navigation.dart';
import 'package:portfolio_website/presentation/presentation.dart';
import 'package:portfolio_website/presentation/projects/bloc/bloc.dart';
import 'package:portfolio_website/presentation/theme_switcher.dart';
import 'package:portfolio_website/resource/database/app_database.dart';
import 'package:portfolio_website/resource/database/dao/blog_dao.dart';
import 'package:portfolio_website/resource/database/dao/dao.dart';
import 'package:portfolio_website/resource/repo/auth_repository.dart';
import 'package:portfolio_website/resource/repo/blog_repository.dart';
import 'package:portfolio_website/resource/repo/project_repository.dart';

import 'presentation/navigation/bloc/bloc.dart';
import 'presentation/register/bloc/bloc.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initialLightMode: true,
      child: PortfolioWebsite.runWidget(),
    );
  }
}

class PortfolioWebsite extends StatefulWidget {
  @override
  _PortfolioWebsiteState createState() => _PortfolioWebsiteState();

  static Widget runWidget() {
    final AppDatabase database = AppDatabase();
    final BlogDao blogDao = BlogDao(database);
    final ProjectDao projectDao = ProjectDao(database);
    final BlogRepository blogRepository = BlogRepository(dao: blogDao);
    final ProjectRepository projectRepository =
        ProjectRepository(dao: projectDao);
    final AuthRepository authRepository = AuthRepository(auth: _auth);

    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BlogRepository>(
            create: (context) => blogRepository,
          ),
          RepositoryProvider<ProjectRepository>(
            create: (context) => projectRepository,
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => authRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BlogBloc(repository: blogRepository),
            ),
            BlocProvider(
              create: (context) => ProjectsBloc(repository: projectRepository),
            ),
            BlocProvider(
              create: (context) => NavigationBloc(),
            ),
            BlocProvider(
              create: (context) => LoginBloc(repository: authRepository),
            ),
            BlocProvider(
              create: (context) => RegisterBloc(repository: authRepository),
            ),
          ],
          child: PortfolioWebsite(),
        ));
  }
}

class _PortfolioWebsiteState extends State<PortfolioWebsite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PortfoliWebsite',
      theme: ThemeSwitcher.of(context).isLightMode
          ? lightTheme(context)
          : darkTheme(context),
      home: NavigationScreen(),
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
