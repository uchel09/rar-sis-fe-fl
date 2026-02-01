class CreateStaffPositionRequest {
  final String schoolId;
  final String name;
  final String description;
  final bool isActive;

  CreateStaffPositionRequest({
    required this.schoolId,
    required this.name,
    required this.description,
    this.isActive = true,
  });

  Map<String, dynamic> toJson() => {
    "schoolId": schoolId,
    "name": name,
    "description": description,
    "isActive": isActive,
  };
}

class UpdateStaffPositionRequest {
  final String? name;
  final String? description;
  final bool? isActive;

  UpdateStaffPositionRequest({this.name, this.description, this.isActive});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data["name"] = name;
    if (description != null) data["description"] = description;
    if (isActive != null) data["isActive"] = isActive;
    return data;
  }
}

class StaffPositionResponse {
  final String id;
  final String schoolId;
  final String name;
  final String description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  StaffPositionResponse({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  // Dari JSON ke Object
  factory StaffPositionResponse.fromJson(Map<String, dynamic> json) =>
      StaffPositionResponse(
        id: json["id"],
        schoolId: json["schoolId"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Dari Object ke JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "schoolId": schoolId,
    "name": name,
    "description": description,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
