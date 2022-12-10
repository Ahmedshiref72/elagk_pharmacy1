import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class GetMedicineUseCase
    extends BaseUseCase<Medicine, GetMedicineParameters> {

  final BaseDrawerRepository baseDrawerRepository;
  GetMedicineUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, Medicine>> call(GetMedicineParameters parameters) async {
    return baseDrawerRepository.getMedicine(parameters);
  }
}

class GetMedicineParameters extends Equatable {
  final int id;

  const GetMedicineParameters({required this.id});

  @override
  List<Object> get props => [id];
}
