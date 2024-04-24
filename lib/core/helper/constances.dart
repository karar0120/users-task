import 'package:pets_finder/features/animals/domain/entity/filter_animals.dart';

class Constances {
  static const noRouteFound = "noRouteFound";

  static const noRecoredsFound = "No Records Found";
  static const clientCredentials = "client_credentials";
  static const accessToken = "accessToken";
  static const empty = '';
  static const int zero = 0;

  static List<FilterAnimals> tabBarFilter = [
    FilterAnimals(name: "All", value: ""),
    FilterAnimals(name: "Cat", value: "cat"),
    FilterAnimals(name: "Horse", value: "horse"),
    FilterAnimals(name: "Rabbit", value: "rabbit"),
    FilterAnimals(name: "Bird", value: "bird"),
  ];
}
