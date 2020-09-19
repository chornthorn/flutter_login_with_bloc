import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_repository/data_repository.dart';

import 'blocs/app_bloc_observer.dart';
import 'index.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  return runApp(
    RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(),
      child: MyApp(),
    ),
  );
}
