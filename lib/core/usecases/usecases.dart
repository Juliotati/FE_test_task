import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fe_test_task/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class Params extends Equatable {
  const Params(this.id) : super();
  final int id;

  @override
  List<Object?> get props => <int>[id];
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => <dynamic>[];
}
