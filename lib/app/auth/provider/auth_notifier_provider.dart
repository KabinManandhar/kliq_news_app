import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_news_app/app/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:kliq_news_app/app/auth/provider/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._dataSource) : super(const AuthState.initial());

  final AuthRemoteDataSource _dataSource;

  Future<void> login({required String email, required String password}) async {
    state = const AuthState.loading();
    final response = await _dataSource.login(email: email, password: password);
    state = response.fold(
      (error) => AuthState.unauthenticated(message: error),
      (response) => AuthState.authenticated(user: response!),
    );
  }

  Future<void> signup({required String email, required String password}) async {
    state = const AuthState.loading();
    final response = await _dataSource.signup(email: email, password: password);
    state = response.fold(
      (error) => AuthState.unauthenticated(message: error),
      (response) => AuthState.authenticated(user: response),
    );
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(authRemoteDataSourceProvider)),
);
