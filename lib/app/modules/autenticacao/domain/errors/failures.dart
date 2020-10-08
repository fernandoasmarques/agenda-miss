import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;
  @override
  List<Object> get props => [message];
}

class ErroAutenticacao extends Failure {
  final String message;
  ErroAutenticacao(this.message);
}

class ErrorGetLoggedUser extends Failure {
  final String message;
  ErrorGetLoggedUser({this.message});
}