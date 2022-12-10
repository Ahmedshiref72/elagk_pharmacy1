import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/contact_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';

class GetContactUsUseCase extends BaseUseCase<ContactUs, NoParameters>{
  final BaseDrawerRepository baseDrawerRepository;

  GetContactUsUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, ContactUs>> call(NoParameters parameters) async {
    return await baseDrawerRepository.getContactUs();
  }
}
