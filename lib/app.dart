import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podartkipak/services/internet_cubit.dart';
import 'package:podartkipak/services/internet_state.dart';

import 'navigation.dart';
import 'pages/no_internet_page.dart';

final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ПОДАРКИ ПАК',
      theme: ThemeData(
        fontFamily: "RubikMonoOne-Regular.ttf",
      ),
      navigatorKey: kNavigatorKey,
      builder: (context, child) {
        return BlocListener<InternetCubit, InternetState>(
          listener: (context, state) {
            late final Widget page;
            switch (state.type) {
              case InternetTypes.connected:
                page = const Navigation();
                break;
              case InternetTypes.offline:
                page = const NoInternetPage();
                break;
              default:
                page = const Navigation();
            }
            kNavigatorKey.currentState!.push(MaterialPageRoute(
              builder: (_) => page,
            ));
          },
          child: child,
        );
      },
      home: const Navigation(),
    );
  }
}
