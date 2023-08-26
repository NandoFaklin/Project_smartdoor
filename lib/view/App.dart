import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prata2/blocs/Auth_bloc.dart';
import 'package:prata2/event/auth_even.dart';
import 'package:prata2/repository/auth_repository.dart';
import 'package:prata2/state/auth_state.dart';
import 'package:prata2/view/Dashboardd.dart';
import 'package:prata2/view/LoginPage.dart';


void main() {
  final AuthRepository authRepository = AuthRepository();
  runApp(BlocProvider(
    create: (context) {
      return AuthBloc(authRepository: authRepository);
    },
    child: App(
      authRepository: authRepository,
      authBloc: AuthBloc(authRepository: authRepository),
    ),
  ));
}



class App extends StatelessWidget {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  const App({Key? key, required this.authRepository, required this.authBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(

          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocBuilder(
        bloc: authBloc,
        builder: (context, AuthState state) {
          if (state is AuthInit) {
            authBloc.add(AuthCheck());
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is AuthHashToken || state is AuthData)
            return Dashboard(
              authBloc: authBloc, key: null,
            );
          if (state is AuthFailed || state is LoginFailed)
            return LoginPage(authBloc: authBloc, key: null,);
          if (state is AuthLoading)
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          return Container();
        },
      ),
    );
  }
}

