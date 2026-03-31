/// Trạng thái runtime mà backend hiện đang trả về cho license.
///
/// Lưu ý:
/// - `previewStatus` của API preview có thể null
/// - backend hiện trả chuỗi in hoa như `ACTIVE`, `EXPIRED`
/// - nếu backend phát sinh trạng thái mới, model sẽ map về `unknown`
enum LicenseStatus {
  notActivated('NOT_ACTIVATED'),
  invalidFile('INVALID_FILE'),
  active('ACTIVE'),
  expired('EXPIRED'),
  unknown('UNKNOWN');

  const LicenseStatus(this.value);

  final String value;

  static LicenseStatus fromValue(String? value) {
    return LicenseStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => LicenseStatus.unknown,
    );
  }
}
class CurrentLicenseData {
  final LicenseStatus? status;
  /// Mô tả ngắn trạng thái runtime, có thể null nếu backend không set.
  final String? statusMessage;
  final bool? activated;
  final bool? expired;
  final LicensePayload? license;
  final LicenseUsageSummary? usageSummary;

  const CurrentLicenseData({
    this.status,
    this.statusMessage,
    this.activated,
    this.expired,
    this.license,
    this.usageSummary,
  });

  factory CurrentLicenseData.fromJson(JsonMap json) {
    return CurrentLicenseData(
      status: json['status'] == null
          ? null
          : LicenseStatus.fromValue(_asString(json['status'])),
      statusMessage: _asString(json['statusMessage']),
      activated: json['activated'] == null ? null : _asBool(json['activated']),
      expired: json['expired'] == null ? null : _asBool(json['expired']),
      license: json['license'] == null
          ? null
          : LicensePayload.fromJson(_asMap(json['license'])),
      usageSummary: json['usageSummary'] == null
          ? null
          : LicenseUsageSummary.fromJson(_asMap(json['usageSummary'])),
    );
  }

  JsonMap toJson() {
    return {
      'status': status?.value,
      'statusMessage': statusMessage,
      'activated': activated,
      'expired': expired,
      'license': license?.toJson(),
      'usageSummary': usageSummary?.toJson(),
    };
  }
}

/// Tính năng hệ thống cơ bản được bật trong license.
///
/// Ví dụ: `liveview`, `camera-management`, `license`.
class LicenseSystemFeature {
  final String? featureId;
  final String? featureName;

  const LicenseSystemFeature({this.featureId, this.featureName});

  factory LicenseSystemFeature.fromJson(JsonMap json) {
    return LicenseSystemFeature(
      featureId: _asString(json['featureId']),
      featureName: _asString(json['featureName']),
    );
  }

  JsonMap toJson() {
    return {'featureId': featureId, 'featureName': featureName};
  }
}

/// Tính năng AI được cấp trong license.
///
/// `allowedCameras` là quota camera được phép bật cho feature AI đó.
class LicenseAiFeature {
  final String? featureId;
  final String? featureName;
  final int? allowedCameras;

  const LicenseAiFeature({
    this.featureId,
    this.featureName,
    this.allowedCameras,
  });

  factory LicenseAiFeature.fromJson(JsonMap json) {
    return LicenseAiFeature(
      featureId: _asString(json['featureId']),
      featureName: _asString(json['featureName']),
      allowedCameras: _asInt(json['allowedCameras']),
    );
  }

  JsonMap toJson() {
    return {
      'featureId': featureId,
      'featureName': featureName,
      'allowedCameras': allowedCameras,
    };
  }
}

class LicensePayload {
  final String? customerId;
  final String? customerName;
  final String? packageId;
  final String? packageName;
  final String? issueDate;
  final String? expiryDate;
  final List<String> hardwareIds;
  final int? maxCameras;
  final int? maxAiBoxes;
  final String? aiLimitType;
  final int? maxAiChannels;
  final List<LicenseSystemFeature> systemFeatures;
  final List<LicenseAiFeature> aiFeatures;
  final String? keyId;
  final String? keyVersion;

  const LicensePayload({
    this.customerId,
    this.customerName,
    this.packageId,
    this.packageName,
    this.issueDate,
    this.expiryDate,
    this.hardwareIds = const [],
    this.maxCameras,
    this.maxAiBoxes,
    this.aiLimitType,
    this.maxAiChannels,
    this.systemFeatures = const [],
    this.aiFeatures = const [],
    this.keyId,
    this.keyVersion,
  });

  factory LicensePayload.fromJson(JsonMap json) {
    return LicensePayload(
      customerId: _asString(json['customerId']),
      customerName: _asString(json['customerName']),
      packageId: _asString(json['packageId']),
      packageName: _asString(json['packageName']),
      issueDate: _asString(json['issueDate']),
      expiryDate: _asString(json['expiryDate']),
      hardwareIds: _asStringList(json['hardwareIds']),
      maxCameras: _asInt(json['maxCameras']),
      maxAiBoxes: _asInt(json['maxAiBoxes']),
      aiLimitType: _asString(json['aiLimitType']),
      maxAiChannels: _asInt(json['maxAiChannels']),
      systemFeatures: _asObjectList(
        json['systemFeatures'],
        LicenseSystemFeature.fromJson,
      ),
      aiFeatures: _asObjectList(json['aiFeatures'], LicenseAiFeature.fromJson),
      keyId: _asString(json['keyId']),
      keyVersion: _asString(json['keyVersion']),
    );
  }

  JsonMap toJson() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'packageId': packageId,
      'packageName': packageName,
      'issueDate': issueDate,
      'expiryDate': expiryDate,
      'hardwareIds': hardwareIds,
      'maxCameras': maxCameras,
      'maxAiBoxes': maxAiBoxes,
      'aiLimitType': aiLimitType,
      'maxAiChannels': maxAiChannels,
      'systemFeatures': systemFeatures.map((item) => item.toJson()).toList(),
      'aiFeatures': aiFeatures.map((item) => item.toJson()).toList(),
      'keyId': keyId,
      'keyVersion': keyVersion,
    };
  }
}

/// Thống kê mức sử dụng của một AI feature.
///
/// `featureId` sẽ map với feature trong `license.aiFeatures`.
class LicenseFeatureUsage {
  final String? featureId;
  final int? usedCameras;
  final int? allowedCameras;

  const LicenseFeatureUsage({
    this.featureId,
    this.usedCameras,
    this.allowedCameras,
  });

  factory LicenseFeatureUsage.fromJson(JsonMap json) {
    return LicenseFeatureUsage(
      featureId: _asString(json['featureId']),
      usedCameras: _asInt(json['usedCameras']),
      allowedCameras: _asInt(json['allowedCameras']),
    );
  }

  JsonMap toJson() {
    return {
      'featureId': featureId,
      'usedCameras': usedCameras,
      'allowedCameras': allowedCameras,
    };
  }
}

/// Thống kê tổng mức sử dụng license hiện tại trên hệ thống.
///
/// Thường dùng để hiển thị màn hình quota:
/// - số camera hiện có
/// - số AI Box hiện có
/// - số AI channel đang dùng
/// - usage theo từng AI feature
class LicenseUsageSummary {
  final int? currentCameraCount;
  final int? currentAiBoxCount;
  final int? currentAiChannelCount;
  final List<LicenseFeatureUsage> featureUsages;

  const LicenseUsageSummary({
    this.currentCameraCount,
    this.currentAiBoxCount,
    this.currentAiChannelCount,
    this.featureUsages = const [],
  });

  factory LicenseUsageSummary.fromJson(JsonMap json) {
    return LicenseUsageSummary(
      currentCameraCount: _asInt(json['currentCameraCount']),
      currentAiBoxCount: _asInt(json['currentAiBoxCount']),
      currentAiChannelCount: _asInt(json['currentAiChannelCount']),
      featureUsages: _asObjectList(
        json['featureUsages'],
        LicenseFeatureUsage.fromJson,
      ),
    );
  }

  JsonMap toJson() {
    return {
      'currentCameraCount': currentCameraCount,
      'currentAiBoxCount': currentAiBoxCount,
      'currentAiChannelCount': currentAiChannelCount,
      'featureUsages': featureUsages.map((item) => item.toJson()).toList(),
    };
  }
}


/// Convert dynamic value sang string nullable.
String? _asString(Object? value) {
  if (value == null) {
    return null;
  }
  return value.toString();
}

/// Convert dynamic value sang int nullable.
int? _asInt(Object? value) {
  if (value == null) {
    return null;
  }
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  return int.tryParse(value.toString());
}

/// Convert dynamic value sang bool.
///
/// Hỗ trợ:
/// - `true`/`false`
/// - `1`/`0`
/// - `"true"`/`"false"`
bool _asBool(Object? value) {
  if (value is bool) {
    return value;
  }
  if (value is num) {
    return value != 0;
  }
  if (value is String) {
    return value.toLowerCase() == 'true';
  }
  return false;
}

/// Convert danh sách bất kỳ sang `List<String>`.
List<String> _asStringList(Object? value) {
  if (value is! List) {
    return const [];
  }
  return value.map((item) => item.toString()).toList();
}

/// Convert list json sang list object bằng parser truyền vào.
List<T> _asObjectList<T>(Object? value, T Function(JsonMap json) parser) {
  if (value is! List) {
    return const [];
  }

  return value.map((item) => parser(_asMap(item))).toList();
}

/// Ép một object bất kỳ sang `Map<String, dynamic>`.
JsonMap _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  if (value is Map) {
    return value.map((key, item) => MapEntry(key.toString(), item));
  }
  return <String, dynamic>{};
}

typedef JsonMap = Map<String, dynamic>;
