import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/blog/bloc/bloc.dart';
import 'package:portfolio_website/presentation/login/bloc/bloc.dart';
import 'package:portfolio_website/presentation/presentation.dart';
import 'package:portfolio_website/presentation/projects/bloc/bloc.dart';

import 'presentation/about/bloc/bloc.dart';
import 'presentation/navigation/bloc/bloc.dart';
import 'presentation/profile/bloc/bloc.dart';
import 'presentation/register/bloc/bloc.dart';
import 'resource/resource.dart';

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
    final ProfileDao profileDao = ProfileDao(database);
    final BlogRepository blogRepository = BlogRepository(dao: blogDao);
    final ProjectRepository projectRepository =
        ProjectRepository(dao: projectDao);
    final ProfileRepository profileRepository =
        ProfileRepository(dao: profileDao);
    final AuthRepository authRepository = AuthRepository(auth: _auth);

    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BlogRepository>(
            create: (context) => blogRepository,
          ),
          RepositoryProvider<ProjectRepository>(
            create: (context) => projectRepository,
          ),
          RepositoryProvider<ProfileRepository>(
            create: (context) => profileRepository,
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => authRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProfileBloc(),
            ),
            BlocProvider(
              create: (context) => BlogBloc(repository: blogRepository),
            ),
            BlocProvider(
              create: (context) => ProjectsBloc(repository: projectRepository),
            ),
            BlocProvider(
              create: (context) => AboutBloc(repository: profileRepository),
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
      supportedLocales: AppLanguage.getSupportLanguage().map((e) => e.locale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          debugPrint("*language locale is null!!!");
          return supportedLocales.first;
        }
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      locale: Locale('vi', 'VN'),
      home: NavigationScreen(),
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
