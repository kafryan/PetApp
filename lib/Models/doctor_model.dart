import 'package:flutterchallenge/Models/service_model.dart';

class DoctorModel {
  String name;
  String image;
  List<String> service;
  int distance;

  DoctorModel(
      {required this.name,
      required this.image,
      required this.service,
      required this.distance});
}

var doctors = [
  DoctorModel(
      name: "Dr. Angela Ruth",
      image: "Dr. Angela.jpg",
      service: [Service.vaccine, Service.spaAndTreatment],
      distance: 15),
  DoctorModel(
      name: "Dr. Scott Shire",
      image: "Dr. Wiliam.jpg",
      service: [Service.vaccine, Service.surgery],
      distance: 10),
  DoctorModel(
      name: "Dr. Katie French",
      image: "Dr. Katie.jpg",
      service: [Service.consultation, Service.surgery],
      distance: 5),
  DoctorModel(
      name: "Dr. Michael Bouman",
      image: "Dr. Michael.jpg",
      service: [Service.consultation, Service.surgery],
      distance: 1),
];
