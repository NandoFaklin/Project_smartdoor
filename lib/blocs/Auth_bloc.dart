import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prata2/model/data_model.dart';
import 'package:prata2/repository/auth_repository.dart';
import 'package:prata2/state/auth_state.dart';
import 'package:prata2/event/auth_even.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : assert(authRepository != null);

  @override
  AuthState get initialState => AuthInit();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthCheck) {
      yield AuthLoading();

      final hashToken = await authRepository.hashToken();
      if (hashToken != null) {
        yield AuthHashToken(token: hashToken);
      } else {
        yield AuthFailed();
      }
    }

    if (event is GetDataWithToken) {
      yield AuthLoading();

      final user = await authRepository.getData(event.token);
      yield AuthData(email: user.email, name: user.name);
    }

    if (event is LoginProcess) {
      yield AuthLoading();
      try {
        final login = await authRepository.loginUser(
            event.email, event.password, "Mobile Sanctum");
        if (login.message != "failed") {
          yield LoginSuccess();
          await authRepository.setLocalToken(login.data.token);
          yield AuthHashToken(token: login.data.token);
        }
      } catch (e) {
        yield LoginFailed("login gagal");
      }
    }

    if (event is LoggedOut) {
      final String token = await authRepository.hashToken();
      try {
        final Logout logout = await authRepository.userLogout(token);
        if (logout.message == "success") {
          await authRepository.unsetLocalToken();
          yield AuthFailed();
        }
      } catch (e) {}
    }
  }
}
