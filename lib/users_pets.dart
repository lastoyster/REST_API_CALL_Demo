import 'dart:convert';

UsersPets usersPetsFromJson(String str) {
  try {
    return UsersPets.fromJson(json.decode(str));
  } catch (e) {
    print("Error parsing UsersPets JSON: $e");
    throw Exception("Failed to parse UsersPets JSON");
  }
}

String usersPetsToJson(UsersPets data) {
  try {
    return json.encode(data.toJson());
  } catch (e) {
    print("Error encoding UsersPets to JSON: $e");
    throw Exception("Failed to encode UsersPets to JSON");
  }
}

class UsersPets {
  UsersPets({
    required this.data,
  });

  final List<Datum> data;

  factory UsersPets.fromJson(Map<String, dynamic> json) {
    try {
      return UsersPets(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
    } catch (e) {
      print("Error creating UsersPets instance from JSON: $e");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userName,
    required this.petName,
    required this.petImage,
    required this.isFriendly,
  });

  final int id;
  final String userName;
  final String petName;
  final String petImage;
  final bool isFriendly;

  factory Datum.fromJson(Map<String, dynamic> json) {
    try {
      return Datum(
        id: json["id"],
        userName: json["userName"],
        petName: json["petName"],
        petImage: json["petImage"],
        isFriendly: json["isFriendly"],
      );
    } catch (e) {
      print("Error creating Datum instance from JSON: $e");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "petName": petName,
        "petImage": petImage,
        "isFriendly": isFriendly,
      };
}
