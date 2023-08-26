import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prata2/Dashboard.dart';
import 'package:prata2/blocs/Auth_bloc.dart';
import 'package:prata2/event/auth_even.dart';
import 'package:prata2/state/auth_state.dart';

class LoginPage extends StatefulWidget {
  final AuthBloc authBloc;
  const LoginPage({required Key? key, required this.authBloc}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = widget.authBloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>.value(
      value: _authBloc,
      child: LoginForm(authBloc: _authBloc),
    );
  }
}

class LoginForm extends StatelessWidget {
  final AuthBloc authBloc;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginForm({required this.authBloc})
      : emailController = TextEditingController(),
        passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/imagesatu.png',
                      height: 333,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 40,),
                    Text(
                      "Welcome",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "Smart lock bisa membantu anda meningkatkan keamanan rumah anda dengan sangat baik dan mudah",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (state is LoginFailed)
                      Text(state.error)
                    else
                      Text(""),
                    SizedBox(height: 15,),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 2 * -2,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(


                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightBlueAccent,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: TextField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 3,
                                              style: BorderStyle.none,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          labelText: "User Name",
                                          suffixIcon: Align(
                                            widthFactor: 1.0,
                                            heightFactor: 1.0,
                                            child: Icon(
                                              Icons.account_circle,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: TextField(
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 3,
                                              style: BorderStyle.none,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          labelText: "Password",
                                          suffixIcon: Align(
                                            widthFactor: 1.0,
                                            heightFactor: 1.0,
                                            child: Icon(
                                              Icons.ac_unit_sharp,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal: 20),
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                            ),
                                            SizedBox(width: 0,),
                                            Text(
                                              "Remember me",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Forgot Password ?",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        ElevatedButton(
                                          onPressed: () => _login(),
                                          child: (state is AuthLoading)
                                              ? Text("Please wait")
                                              : Text("Login"),
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                        if (state is LoginFailed)
                                          Text(state.error)
                                        else
                                          Text(""),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Not have an account ?",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text("register"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Login'),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _login() {
    authBloc.add(
      LoginProcess(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}
