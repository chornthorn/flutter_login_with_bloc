import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos_bloc/blocs/login/login_bloc.dart';
import 'package:flutter_todos_bloc/views/logins/login_page.dart';
import 'package:data_repository/data_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(new AuthRepositoryImpl()),
        child: LoginPage(),
      ),
    );
  }
}
