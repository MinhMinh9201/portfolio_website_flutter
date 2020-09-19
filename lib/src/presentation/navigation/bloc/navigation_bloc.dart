import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitialize());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is AuthenticatedNavigation) {
      yield NavigationAuthenticated(user: event.user);
    } else if (event is NotAuthenticatedNavigation) {
      yield NavigationNotAuthenticated();
    } else {}
  }
}
