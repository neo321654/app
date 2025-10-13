import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/auth_enums.dart';
import '../../../../../core/resources/store.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Store store;

  AuthBloc(this.store) : super(const AuthState.unknown()) {
    on<AppStarted>((event, emit) async {
      try {
        if (store.isLoggedIn()) {
          emit(const AuthState.authenticated());
          if (store.isFirstEntry()) {
            Timer(
              const Duration(seconds: 5),
              () => store.setFirstEntry(),
            );
          }
        } else {
          emit((store.isFirstEntry())
              ? const AuthState.firstEntry()
              : const AuthState.guest());
          if (store.isFirstEntry()) {
            Timer(
              const Duration(seconds: 5),
              () => store.setFirstEntry(),
            );
          }
        }
      } on SocketException {
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        log(e.toString());
        emit(const AuthState.error());
      }
    });

    on<LoginRequested>(
      (event, emit) async {
        await store.setToken(event.token);
        await store.setLoggedIn(true);
        emit(const AuthState.authenticated());
      },
    );

    on<LogoutRequested>((event, emit) async {
      try {
        await store.signOut();
        emit(const AuthState.guest());
      } catch (_) {}
    });
  }
}
