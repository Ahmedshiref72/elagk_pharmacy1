import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/pharmacy_user_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class GetPharmacyUserProfileUseCase extends BaseUseCase<PharmacyUser, GetPharmacyUserParameters> {
  final BaseDrawerRepository baseDrawerRepository;

  GetPharmacyUserProfileUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, PharmacyUser>> call(
      GetPharmacyUserParameters parameters) async {
    return baseDrawerRepository.getPharmacyUserProfile(parameters);
  }
}

class GetPharmacyUserParameters extends Equatable {
  final String userId;

  const GetPharmacyUserParameters({required this.userId});

  @override
  List<Object> get props => [userId];
}
