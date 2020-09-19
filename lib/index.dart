import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos_bloc/blocs/login/login_bloc.dart';
import 'package:flutter_todos_bloc/views/logins/login_page.dart';
import 'package:flutter_todos_bloc/views/logins/login_page_consume.dart';

import 'blocs/authentication/authentication_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthRepository>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authService, authBloc),
        child: CheckAuth(),
      ),
    );
  }
}

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return HomePage();
        }
        return LoginPage();
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Container(
        child: Text('Logged in'),
      ),
    );
  }
}
