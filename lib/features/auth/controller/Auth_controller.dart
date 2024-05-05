import 'package:fpdart/fpdart.dart';
import 'package:mitco_task/features/auth/repository/Auth_repositorry.dart';
import 'package:mitco_task/features/model_class/order_model_class.dart';

import '../../../core/variables/failure.dart';

class AuthController{
  final AuthRepository _repository;
  AuthController({required AuthRepository repository}):
      _repository=repository;
  Future<Either<Failure ,OrderModel?>> signIn({required String email,required String password})async{
    return await  _repository.signIn(email: email, password: password);
  }
}