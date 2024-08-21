import 'package:bloc/bloc.dart';
import 'package:crm/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthController authController;

  AuthBloc({required this.authController}) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<CheckUserTokenEvent>(_checkToken);
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await authController.signUp(
      event.name,
      event.phone,
      event.password,
      event.passwordConfirmation,
    );

    if (response != null && response.statusCode == 200) {
      emit(AuthAuthenticated(token: response.data['data']['token']));
    } else {
      emit(AuthError(message: response?.data['message'] ?? 'Unknown error'));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await authController.login(event.phone, event.password);

    if (response != null) {
      emit(AuthAuthenticated(token: response.data['data']['token']));
    } else {
      emit(AuthError(message: response?.data['message'] ?? 'Unknown error'));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await authController.logout();

    if (response != null) {
      emit(AuthLoggedOut());
    } else {
      emit(AuthError(message: response?.data['message'] ?? 'Unknown error'));
    }
  }

  Future<String?> _checkToken(CheckUserTokenEvent event, emit) async {
    emit(AuthLoading());
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user_token');
    if (userToken != null) {
      emit(AuthAuthenticated(token: userToken));
    } else {
      emit(AuthLoggedOut());
    }
  }

  read() {}
}
