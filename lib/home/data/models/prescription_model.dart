class PrescriptionModel {
  int? prescriptionId;
  String? prescriptionImage;
  Null? prescriptionImageFile;
  bool? isApproved;
  int? pharmacyId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  bool? isDeleted;

  PrescriptionModel(
      {this.prescriptionId,
        this.prescriptionImage,
        this.prescriptionImageFile,
        this.isApproved,
        this.pharmacyId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.isDeleted});

  PrescriptionModel.fromJson(Map<String, dynamic> json) {
    prescriptionId = json['prescriptionId'];
    prescriptionImage = json['prescriptionImage'];
    prescriptionImageFile = json['prescriptionImageFile'];
    isApproved = json['isApproved'];
    pharmacyId = json['pharmacyId'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prescriptionId'] = this.prescriptionId;
    data['prescriptionImage'] = this.prescriptionImage;
    data['prescriptionImageFile'] = this.prescriptionImageFile;
    data['isApproved'] = this.isApproved;
    data['pharmacyId'] = this.pharmacyId;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}
