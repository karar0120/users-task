class AllAnimalsDetails {
  AnimalsDetails? animalsDetails;
  AllAnimalsDetails({required this.animalsDetails});
}

class AnimalsDetails {
  int id;
  String mediumphotos;
  String name;
  String size;
  String url;
  ContactDetails? contact;
  ColorsDetails? colors;
  AnimalsDetails(
      {required this.id,
      required this.name,
      required this.size,
      required this.url,
      required this.mediumphotos,
      required this.contact,
      required this.colors});
}

class PhotosDetails {
  String small;
  String medium;
  String large;
  String full;

  PhotosDetails(
      {required this.small,
      required this.medium,
      required this.large,
      required this.full});
}

class ContactDetails {
  AddressDetails? address;

  ContactDetails({required this.address});
}

class AddressDetails {
  String city;
  String state;
  String postcode;
  String country;

  AddressDetails(
      {required this.city,
      required this.state,
      required this.postcode,
      required this.country});
}

class ColorsDetails {
  String primary;

  ColorsDetails({required this.primary});
}
