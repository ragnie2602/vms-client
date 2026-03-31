import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';

/// Phần `data` của API `POST /api/licenses/preview`.
///
/// Luồng dùng phổ biến:
/// 1. user nhập key
/// 2. gọi preview
/// 3. kiểm tra `valid`, `canActivate`
/// 4. nếu cần thì hiển thị `warnings` và thông tin quota/license
class LicensePreviewData {
  final bool valid;
  final bool canActivate;
  final bool hardwareMatched;

  /// `true` khi key preview chính là license đang active trên máy hiện tại.
  final bool usingCurrentLicense;

  /// Trạng thái suy ra từ license sau khi backend parse/verify.
  final LicenseStatus? previewStatus;

  /// Mã lỗi nghiệp vụ, ví dụ `LICENSE_ALREADY_IN_USE`.
  final String? errorCode;
  final LicensePayload? license;
  final LicenseUsageSummary? usageSummary;
  final List<String> warnings;

  const LicensePreviewData({
    required this.valid,
    required this.canActivate,
    required this.hardwareMatched,
    required this.usingCurrentLicense,
    this.previewStatus,
    this.errorCode,
    this.license,
    this.usageSummary,
    this.warnings = const [],
  });

  factory LicensePreviewData.fromJson(JsonMap json) {
    final previewStatusValue = _asString(json['previewStatus']);

    return LicensePreviewData(
      valid: _asBool(json['valid']),
      canActivate: _asBool(json['canActivate']),
      hardwareMatched: _asBool(json['hardwareMatched']),
      usingCurrentLicense: _asBool(json['usingCurrentLicense']),
      previewStatus: previewStatusValue == null
          ? null
          : LicenseStatus.fromValue(previewStatusValue),
      errorCode: _asString(json['errorCode']),
      license: json['license'] == null
          ? null
          : LicensePayload.fromJson(_asMap(json['license'])),
      usageSummary: json['usageSummary'] == null
          ? null
          : LicenseUsageSummary.fromJson(_asMap(json['usageSummary'])),
      warnings: _asStringList(json['warnings']),
    );
  }

  JsonMap toJson() {
    return {
      'valid': valid,
      'canActivate': canActivate,
      'hardwareMatched': hardwareMatched,
      'usingCurrentLicense': usingCurrentLicense,
      'previewStatus': previewStatus?.value,
      'errorCode': errorCode,
      'license': license?.toJson(),
      'usageSummary': usageSummary?.toJson(),
      'warnings': warnings,
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
