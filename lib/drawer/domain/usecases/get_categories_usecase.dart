import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/category_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<List<Category>, NoParameters>{
  final BaseDrawerRepository baseDrawerRepository;

  GetCategoriesUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParameters parameters) async {
    return await baseDrawerRepository.getCategories();
  }
}
