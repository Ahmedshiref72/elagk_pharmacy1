import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/about_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class GetAboutUsSecondUseCase extends BaseUseCase<AboutUsSecond, GetAboutUsSecondParameters> {
  final BaseDrawerRepository baseDrawerRepository;

  GetAboutUsSecondUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, AboutUsSecond>> call(GetAboutUsSecondParameters parameters) async {
    return await baseDrawerRepository.getAboutUsSecond(parameters);
  }
}

class GetAboutUsSecondParameters extends Equatable {
  final String vision;

  const GetAboutUsSecondParameters({required this.vision});

  @override
  List<Object> get props => [vision];
}
