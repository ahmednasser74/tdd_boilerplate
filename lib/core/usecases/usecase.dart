import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Type call({required Params params});
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
