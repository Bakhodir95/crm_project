import 'package:bloc/bloc.dart';
import 'package:crm/controllers/auth_controller.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthController authController;

  AuthBloc({required this.authController}) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
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
      emit(AuthAuthenticated());
    } else {
      emit(AuthError(message: response?.data['message'] ?? 'Unknown error'));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await authController.login(event.password, event.phone);

    if (response != null && response.statusCode == 200) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthError(message: response?.data['message'] ?? 'Unknown error'));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await authController.logout();

    if (response != null && response.statusCode == 200) {
      emit(AuthLoggedOut());
    } else {
      emit(AuthError(message: response?.data['message'] ?? 'Unknown error'));
    }
  }

  read() {}
}
