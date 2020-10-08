import 'package:equatable/equatable.dart';

class Usuario extends Equatable {
  final String uid;
  final String email;

  const Usuario({this.uid, this.email});

  @override
  List<Object> get props => [uid, email];
}
