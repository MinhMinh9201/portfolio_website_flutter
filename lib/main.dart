import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/blog/bloc/bloc.dart';
import 'package:portfolio_website/presentation/presentation.dart';
import 'package:portfolio_website/presentation/theme_switcher.dart';
import 'package:portfolio_website/resource/api/dio_provider.dart';
import 'package:portfolio_website/resource/repo/blog_repository.dart';

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
    Dio dio = DioProvider.instance();

    final BlogRepository blogRepository = BlogRepository(dio: dio);

    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BlogRepository>(
            create: (context) => blogRepository,
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BlogBloc(repository: blogRepository),
            )
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
      home: HomeScreen(),
    );
  }
}
