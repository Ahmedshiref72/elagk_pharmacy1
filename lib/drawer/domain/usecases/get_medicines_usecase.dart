import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class GetMedicinesUseCase
    extends BaseUseCase<List<Medicine>, GetMedicinesParameters> {
  final BaseDrawerRepository baseDrawerRepository;

  GetMedicinesUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, List<Medicine>>> call(
      GetMedicinesParameters parameters) async {
    return baseDrawerRepository.getMedicines(parameters);
  }
}

class GetMedicinesParameters extends Equatable {
  final int pharmacyId;
  final String categoryName;

  const GetMedicinesParameters({
    required this.pharmacyId,
    required this.categoryName,
  });

  @override
  List<Object> get props => [pharmacyId, categoryName];
}
