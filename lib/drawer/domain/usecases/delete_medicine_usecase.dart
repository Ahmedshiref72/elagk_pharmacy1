import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class DeleteMedicineUseCase
    extends BaseUseCase<void, DeleteMedicineParameters> {
  final BaseDrawerRepository baseDrawerRepository;

  DeleteMedicineUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, void>> call(
      DeleteMedicineParameters parameters) async {
    return baseDrawerRepository.deleteMedicine(parameters);
  }
}

class DeleteMedicineParameters extends Equatable {
  final int id;

  const DeleteMedicineParameters({required this.id});

  @override
  List<Object> get props => [id];
}
