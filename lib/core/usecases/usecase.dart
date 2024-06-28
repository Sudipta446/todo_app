import 'package:fpdart/fpdart.dart';
import 'package:todo_app/core/error/error.dart';

abstract interface class UseCase<SuccessType, Params>{
  Future<Either<Failure, SuccessType>> call(Params params);
}