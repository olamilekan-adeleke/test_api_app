import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger.log(bloc);
    Logger.log(event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger.log(bloc);
    Logger.log(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger.log(bloc);
    Logger.log(change.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger.log(bloc);
    Logger.log(transition.toString());
  }
}

class Logger {
  static void log(Object? e, [Object? s = '']) {
    log(e.toString());
    log(s.toString());
  }
}
