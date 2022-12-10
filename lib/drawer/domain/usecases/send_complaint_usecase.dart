import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class SendComplaintUseCase extends BaseUseCase<void, SendComplaintParameters> {
  final BaseDrawerRepository baseDrawerRepository;

  SendComplaintUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, void>> call(
      SendComplaintParameters parameters) async {
    return await baseDrawerRepository.sendComplaint(parameters);
  }
}

class SendComplaintParameters extends Equatable {
  final String userId;
  final int? issueId;
  final String issueType;
  final String issueDescription;
  final int? orderId;

  const SendComplaintParameters({
    required this.userId,
    this.issueId,
    required this.issueType,
    required this.issueDescription,
    this.orderId,
  });

  Map<String, dynamic> toJson() {
    return {
      "issueId": issueId,
      "UserId": userId,
      "issueType": issueType,
      "issueDescription": issueDescription,
      "orderId": orderId,
    };
  }

  @override
  List<Object?> get props => [
        userId,
        issueId,
        issueType,
        issueDescription,
        orderId,
      ];
}
