import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:podartkipak/services/internet_cubit.dart';

import 'app.dart';

void bootstrap() async {
  await Future.delayed(const Duration(seconds: 2))
      .then((value) => FlutterNativeSplash.remove());
  final Connectivity connectivity = Connectivity();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<InternetCubit>(
        create: (_) => InternetCubit(connectivity: connectivity),
      ),
    ],
    child: const App(),
  ));
}
