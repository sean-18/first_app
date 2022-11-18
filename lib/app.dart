import 'package:first_app/redux/reducer.dart';
import 'package:first_app/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:first_app/input/input.dart';
import 'package:first_app/landing/landing.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';



class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late BuildContext appStateContext;
  final Store<AppState> _store = Store(reducers, initialState: AppState.initial());
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: StoreConnector<AppState,AppState>(
        converter:(store) => store.state ,
        builder: (context,state){
          appStateContext = context;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              Landing.routeName: (context) => Landing(),
              Input.routeName: (context) => Input(),
            },
          );
        },
      ),
    );
  }
}