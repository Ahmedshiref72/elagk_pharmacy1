import 'package:equatable/equatable.dart';

class AboutUsFirst extends Equatable {
  final String whoAreWe;

  const AboutUsFirst({required this.whoAreWe});

  @override
  List<Object> get props => [whoAreWe];
}

class AboutUsSecond extends Equatable {
  final String vision;

  const AboutUsSecond({required this.vision});

  @override
  List<Object> get props => [vision];
}