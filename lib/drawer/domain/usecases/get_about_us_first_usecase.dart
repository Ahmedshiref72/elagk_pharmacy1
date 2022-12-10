import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/about_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class GetAboutUsFirstUseCase extends BaseUseCase<AboutUsFirst, GetAboutUsFirstParameters> {
  final BaseDrawerRepository baseDrawerRepository;

  GetAboutUsFirstUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, AboutUsFirst>> call(GetAboutUsFirstParameters parameters) async {
    return await baseDrawerRepository.getAboutUsFirst(parameters);
  }
}

class GetAboutUsFirstParameters extends Equatable {
  final String whoAreWe;

  const GetAboutUsFirstParameters({required this.whoAreWe});

  @override
  List<Object> get props => [whoAreWe];
}
