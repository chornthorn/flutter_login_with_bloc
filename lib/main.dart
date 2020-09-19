import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_repository/data_repository.dart';

import 'index.dart';

void main() {
  return runApp(
    RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(),
      child: MyApp(),
    ),
  );
}
