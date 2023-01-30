// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../const/constant.dart';

class MassegModel {
  final String massege;
  final String id;
  MassegModel({required this.massege, required this.id});

  factory MassegModel.getMassegeModel(data) {
    return MassegModel(massege: data[kMassege], id: data['id']);
  }
}
