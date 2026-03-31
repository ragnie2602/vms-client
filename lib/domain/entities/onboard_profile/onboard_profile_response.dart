import 'dart:convert';

OnboardProfileResponse onboardProfileResponseFromJson(String str) => OnboardProfileResponse.fromJson(json.decode(str));

String onboardProfileResponseToJson(OnboardProfileResponse data) => json.encode(data.toJson());

class OnboardProfileResponse {
    List<Profile>? profiles;
    bool? hasUsingProfile;

    OnboardProfileResponse({
        this.profiles,
        this.hasUsingProfile,
    });

    OnboardProfileResponse copyWith({
        List<Profile>? profiles,
        bool? hasUsingProfile,
    }) => 
        OnboardProfileResponse(
            profiles: profiles ?? this.profiles,
            hasUsingProfile: hasUsingProfile ?? this.hasUsingProfile,
        );

    factory OnboardProfileResponse.fromJson(Map<String, dynamic> json) => OnboardProfileResponse(
        profiles: json["profiles"] == null ? [] : List<Profile>.from(json["profiles"]!.map((x) => Profile.fromJson(x))),
        hasUsingProfile: json["hasUsingProfile"],
    );

    Map<String, dynamic> toJson() => {
        "profiles": profiles == null ? [] : List<dynamic>.from(profiles!.map((x) => x.toJson())),
        "hasUsingProfile": hasUsingProfile,
    };
}

class Profile {
    int? id;
    String? name;
    String? description;
    DateTime? createdAt;
    Detail? details;
    DateTime? updatedAt;
    bool? using;

    Profile({
        this.id,
        this.name,
        this.description,
        this.createdAt,
        this.details,
        this.updatedAt,
        this.using,
    });

    Profile copyWith({
        int? id,
        String? name,
        String? description,
        DateTime? createdAt,
        Detail? details,
        DateTime? updatedAt,
        bool? using,
    }) => 
        Profile(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            createdAt: createdAt ?? this.createdAt,
            details: details ?? this.details,
            updatedAt: updatedAt ?? this.updatedAt,
            using: using ?? this.using,
        );

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        details: json["details"] == null ? null : Detail.fromJson(json["details"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        using: json["using"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "details": details?.toJson(),
        "updatedAt": updatedAt?.toIso8601String(),
        "using": using,
    };
}

class Detail {
    String? title;
    String? icon;
    String? description;
    List<Detail>? detail;

    Detail({
        this.title,
        this.icon,
        this.description,
        this.detail,
    });

    Detail copyWith({
        String? title,
        String? icon,
        String? description,
        List<Detail>? detail,
    }) => 
        Detail(
            title: title ?? this.title,
            icon: icon ?? this.icon,
            description: description ?? this.description,
            detail: detail ?? this.detail,
        );

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        title: json["title"],
        icon: json["icon"],
        description: json["description"],
        detail: json["detail"] == null ? [] : List<Detail>.from(json["detail"]!.map((x) => Detail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "description": description,
        "detail": detail == null ? [] : List<dynamic>.from(detail!.map((x) => x.toJson())),
    };
}
