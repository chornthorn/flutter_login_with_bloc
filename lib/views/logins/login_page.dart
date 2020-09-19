import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos_bloc/blocs/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) {
          if (current is LoginFailure || current is LoginSuccess) {
            Navigator.pop(context);
          }
          return true;
        },
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                    child: new Row(
                      children: [
                        CircularProgressIndicator(),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Loading ..."),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state is LoginFailure) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Login error'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
          if (state is LoginSuccess) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Login success'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ));
          }
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: userNameController,
                decoration: InputDecoration(hintText: 'username'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'password'),
              ),
              Container(height: 20),
              FlatButton(
                onPressed: () {
                  UserReqModel data = UserReqModel();
                  data.email = userNameController.text;
                  data.password = passwordController.text;
                  BlocProvider.of<LoginBloc>(context).add(
                    Login(data),
                  );
                  // BlocProvider.of<LoginBloc>(context).add(
                  //   GetUserEvent(),
                  // );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
