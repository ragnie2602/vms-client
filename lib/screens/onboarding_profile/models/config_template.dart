import 'package:flutter/material.dart';

class ConfigTemplate {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const ConfigTemplate({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  static const List<ConfigTemplate> defaultTemplates = [
    ConfigTemplate(
      id: 'blank',
      title: 'Tự thiết lập (Blank)',
      description:
          'Tự do thiết lập các loại đối tượng và cấu hình cảnh báo AI linh hoạt theo nhu cầu quản trị đặc thù của đơn vị.',
      icon: Icons.settings,
      iconColor: Color(0xFF10B981),
      iconBgColor: Color(0xFFD1FAE5),
    ),
    ConfigTemplate(
      id: 'school',
      title: 'An ninh Trường học',
      description:
          'Giải pháp thông minh giúp tối ưu công tác giám sát an toàn, hỗ trợ duy trì kỷ luật trong môi trường giáo dục. hỗ trợ duy trì kỷ luật trong môi trường giáo dục',
      icon: Icons.school,
      iconColor: Color(0xFF8B5CF6),
      iconBgColor: Color(0xFFEDE9FE),
    ),
    ConfigTemplate(
      id: 'public',
      title: 'An ninh công cộng',
      description:
          'Giải pháp giám sát an ninh diện rộng, quản lý lưu lượng và hỗ trợ truy vết sự cố nhanh.',
      icon: Icons.security,
      iconColor: Color(0xFFEF4444),
      iconBgColor: Color(0xFFFEE2E2),
    ),
    ConfigTemplate(
      id: 'retail',
      title: 'An ninh chuỗi cửa hàng bán lẻ',
      description:
          'Giải pháp kiểm soát thất thoát hàng hóa, phân tích hành vi khách hàng và nâng cao hiệu quả vận hành.',
      icon: Icons.shopping_cart,
      iconColor: Color(0xFFF59E0B),
      iconBgColor: Color(0xFFFEF3C7),
    ),
    ConfigTemplate(
      id: 'building',
      title: 'An ninh tòa nhà',
      description:
          'Tối ưu hóa công tác kiểm soát ra vào, quản lý hạ tầng và đảm bảo an toàn tuyệt đối cho cư dân.',
      icon: Icons.domain,
      iconColor: Color(0xFFF97316),
      iconBgColor: Color(0xFFFFEDD5),
    ),
    ConfigTemplate(
      id: 'gas_station',
      title: 'An ninh trạm xăng',
      description:
          'Hệ thống giám sát an toàn chuyên biệt, hỗ trợ phòng chống cháy nổ hiệu quả trong vận hành trạm.',
      icon: Icons.local_gas_station,
      iconColor: Color(0xFFEF4444),
      iconBgColor: Color(0xFFFEE2E2),
    ),
  ];
}
