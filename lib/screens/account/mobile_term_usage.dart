import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class MobileTermUsageScreen extends StatelessWidget {
  const MobileTermUsageScreen({super.key});
  final String longParagraph = """
Điều 1: Phạm vi áp dụng
- App/Website cung cấp sản phẩm/dịch vụ VNPT SECURE VISION do Công ty TNHH Cung cấp giải pháp dịch vụ giá trị gia tăng (viết tắt là VIVAS) thực hiện hoạt động vận hành.
- Người Sử Dụng/Người Dùng: là chủ tài khoản VNPT SECURE VISION.
Điều 2: Chấp nhận điều khoản và sửa đổi
- Tạo tài khoản VNPT SECURE VISION để truy cập vào ứng dụng, Người Sử Dụng phải đồng ý và tuân theo các điều khoản được quy định tại Thỏa thuận này và quy định, quy chế khác mà VIVAS ban hành.
- Để đáp ứng nhu cầu của Người Sử Dụng, VIVAS không ngừng hoàn thiện và phát triển sản phẩm vì vậy các điều khoản Thỏa Thuận này có thể được cập nhật, chỉnh sửa bất cứ lúc nào mà không cần phải thông báo trước tới Người Sử Dụng. VIVAS sẽ công bố rõ trên App/Website, diễn đàn về những thay đổi, bổ sung đó.
Điều 3: Nội dung cấm của người dùng khi sử dụng VNPT SECURE VISION
- Cấm Người dùng lợi dụng việc sử dụng tài khoản VNPT SECURE VISION nhằm mục đích:
- Chống lại Nhà nước Cộng hoà xã hội chủ nghĩa Việt Nam; gây phương hại đến an ninh quốc gia, trật tự, an toàn xã hội; phá hoại khối đại đoàn kết toàn dân; tuyên truyền chiến tranh xâm lược, khủng bố; gây hận thù, mâu thuẫn giữa các dân tộc, sắc tộc, tôn giáo;
- Tuyên truyền, kích động bạo lực, dâm ô, đồi trụy, tội ác, tệ nạn xã hội, mê tín dị đoan, phá hoại thuần phong, mỹ tục của dân tộc.
- Tuyệt đối không bàn luận về các vấn đề chính trị.
- Tiết lộ bí mật nhà nước, bí mật quân sự, an ninh, kinh tế, đối ngoại và những bí mật khác do pháp luật quy định
- Đưa thông tin xuyên tạc, vu khống, xúc phạm uy tín của tổ chức, danh dự và nhân phẩm của cá nhân.
- Cản trở trái pháp luật, gây rối, phá hoại hệ thống máy chủ tên miền quốc gia, hệ thống thiết bị cung cấp dịch vụ Internet và thông tin trên mạng; cản trở việc truy cập thông tin và sử dụng các dịch vụ hợp pháp trên Interrnet của tổ chức, cá nhân.
- Sử dụng trái phép mật khẩu, khoá mật mã của các tổ chức, cá nhân, thông tin riêng, thông tin cá nhân và tài nguyên Internet.
- Giả mạo tổ chức, cá nhân và phát tán thông tin giả mạo, thông tin sai sự thật trên mạng xâm hại đến quyền và lợi ích hợp pháp của tổ chức, cá nhân.
- Tạo đường dẫn trái phép đối với tên miền của tổ chức, cá nhân. Tạo, cài đặt, phát tán các phần mềm độc hại, vi rút máy tính; xâm nhập trái phép, chiếm quyền điều khiển hệ thống thông tin, tạo lập công cụ tấn công trên Internet.
- Phát tán, truyền bá hay cổ vũ cho bất kỳ hoạt động nào nhằm can thiệp, phá hoại hay xâm nhập vào dữ liệu của sản phẩm cung cấp hoặc hệ thống máy chủ.
- Đăng nhập trái phép hoặc tìm cách đăng nhập trái phép hoặc gây thiệt hại cho hệ thống máy chủ.
- Tổ chức các hình thức cá cược, cờ bạc hoặc các thỏa thuận liên quan đến tiền, hiện kim, hiện vật.
- Từ chối hợp tác điều tra, hoặc không cung cấp thông tin theo yêu cầu của VIVAS.
Điều 4: Giới hạn trách nhiệm và từ chối đảm bảo
- VIVAS sẽ không chịu trách nhiệm đối với bất cứ vấn đề gì khi xảy ra lỗi hệ thống, lỗi đường truyền trong quá trình Người dùng sử dụng dịch vụ.
- Trong trường hợp bất khả kháng bao gồm nhưng không giới hạn như nền tảng ứng dụng có sự cố về kỹ thuật; sự cố máy chủ; sự cố đường truyền hoặc do thiên tai ... bạn phải chấp nhận những rủi ro, thiệt hại nếu có. VIVAS cam kết sẽ nỗ lực giảm thiểu những rủi ro, thiệt hại phát sinh tuy nhiên VIVAS sẽ không chịu bất cứ trách nhiệm nào phát sinh trong các trường hợp này.
Điều 5: Nội dung dịch vụ trên VNPT SECURE VISION
- VIVAS đồng ý cung cấp dịch vụ và Người Dùng đồng ý sử dụng dịch vụ thông qua hệ thống website, trang tin điện tử do VIVAS phát triển và có toàn quyền khai thác, sử dụng hoặc các website của bên thứ ba nhưng VIVAS được cấp quyền khai thác.
Điều 6: Quyền và nghĩa vụ của người dùng
- Chịu trách nhiệm trước pháp luật về những thông tin kê khai, đăng ký tài khoản VNPT SECURE VISION, chỉ sử dụng tài khoản VNPT SECURE VISION cho các mục đích hợp pháp và phải chịu trách nhiệm về mọi hoạt động được thực hiện bằng tài khoản của mình.
- Chịu trách nhiệm giữ bí mật thông tin tài khoản, mật khẩu của mình, trường hợp mật khẩu bị mất hoặc bị đánh cắp hoặc phát hiện có người sử dụng trái phép tài khoản của mình, phải thông báo kịp thời cho Cơ quan quản lý và vận hành hệ thống.
- Chịu trách nhiệm đối với tất cả các nội dung do mình gửi, đăng ký, cung cấp khi sử dụng tài khoản để thực hiện dịch vụ công, các dịch vụ khác và phải có trách nhiệm đối với các bên có liên quan khác.
- Đồng ý chia sẻ thông tin đăng ký tài khoản VNPT SECURE VISION theo quy định của VIVAS.
Điều 7: Ngừng cung cấp dịch vụ
- VIVAS có quyền Tạm dừng, Khoá, Huỷ các tài khoản có các hành vi vi phạm pháp luật, gian lận hoặc không tuân thủ các điều khoản sử dụng đã nêu ở trên mà không cần thông báo cũng như bồi thường.
Điều 8: Thông tin và bảo mật
- VIVAS có thể sử dụng Thông Tin Cá Nhân của Người Sử Dụng cho mục đích khảo sát về các sản phẩm và dịch vụ của VIVAS đồng thời phát triển các dịch vụ mới và cải thiện các dịch vụ hiện có nhằm đáp ứng mong muốn và sở thích của Người Sử Dụng.
- VIVAS được toàn quyền sở hữu và có thể sử dụng dữ liệu để tùy biến và cải tiến nhằm phục vụ Người Sử Dụng tốt hơn. VIVAS không sử dụng thông tin của Người Sử Dụng vào mục đích bất hợp pháp. VIVAS được quyền cung cấp thông tin của Người Sử Dụng cho Bên Thứ Ba trong các trường hợp nhưng không giới hạn:
    - Được Người Sử Dụng chấp thuận.
    - Dịch vụ của VIVAS cung cấp yêu cầu sự tương tác với Bên Thứ Ba hoặc do Bên Thứ Ba cung cấp.
    - Theo các quy định của pháp luật.
- VIVAS luôn cố gắng đáp ứng những tiêu chuẩn về dữ liệu trong chính sách bảo vệ riêng tư, tuy nhiên VIVAS không bị buộc phải bảo đảm những tiêu chuẩn đó. Có thể có những nhân tố vượt ngoài tầm kiểm soát của VIVAS dẫn đến việc dữ liệu bị tiết lộ. Vì vậy, VIVAS không chịu trách nhiệm bảo đảm dữ liệu luôn được duy trì ở tình trạng hoàn hảo hoặc không bị tiết lộ.
    - Mọi Thông Tin Cá Nhân của Người Sử Dụng sẽ được VIVAS bảo mật, không tiết lộ ra ngoài. VIVAS không bán hay trao đổi những thông tin này với bất kỳ một Bên Thứ Ba nào khác, trừ trường hợp được quy định trong Thỏa Thuận này.
    - Trong quá trình sử dụng, Người Sử Dụng đồng ý nhận tất cả thông báo từ VIVAS liên quan tới sản phẩm và dịch vụ qua thư điện tử, thư bưu chính hoặc điện thoại của Người Sử Dụng. Trong trường hợp Người Sử Dụng đăng ký sử dụng sản phẩm, dịch vụ do Bên Thứ Ba cung cấp thì những thông tin của Người Sử Dụng sẽ được chia sẻ với Bên Thứ Ba. Người Sử Dụng cũng đồng ý nhận tất cả thông báo từ Bên Thứ Ba liên quan tới sản phẩm và dịch vụ qua thư điện tử, thư bưu chính hoặc điện thoại của Người Sử Dụng.
    - VIVAS có thể dùng thông tin tài khoản của bạn để thực hiện các hoạt động nghiên cứu.
  Điều 9: Dữ liệu thu thập từ người dùng
  - Khi người dùng sử dụng dịch vụ của chúng tôi, trong một số chức năng, ứng dụng có thực hiện gửi số điện thoại mà người dùng chọn lên 
  - Chúng tôi cam kết không sử dụng thông tin này cho bất kì mục đích nào khác và không chia sẻ thông tin này cho bất kỳ bên thứ 3. Đồng thời, quá trình truyền dữ liệu lên thực hiện với giao thức “https” đã được mã hóa và an toàn.
  - Thông tin về danh bạ được người dùng lựa chọn để sử dụng trong việc kiểm tra số điện thoại mà người dùng đã chọn và thực hiện các chức năng thanh toán, nạp tiền qua số điện thoại người dùng đã chọn hoặc đã cung cấp.
  - Thông tin về danh bạ lấy liên hệ kiểm tra thông tin người dùng sử dụng ứng dụng và liên kết tới bạn bè xung quanh
  - Thông tin về bộ sưu tập ảnh, camera được dùng để scan, chụp ảnh hoặc chọn ảnh để gửi xác minh danh tính, định danh người dùng.
Điều 10: Giải quyết tranh chấp
- Bất kỳ tranh chấp phát sinh trong quá trình sử dụng dịch vụ của VIVAS sẽ được giải quyết theo pháp luật hiện hành của nước Cộng hòa xã hội chủ nghĩa Việt Nam.
- Bất kỳ khiếu nại nào phát sinh trong quá sử dụng tài khoản phải được gửi đến VIVAS ngay sau khi xảy ra sự kiện phát sinh khiếu nại:
        Địa chỉ liên lạc: 115 Trần Duy Hưng, Phường Trung Hoà, Quận Cầu Giấy, Hà Nội
        Điện thoại: (+84) 24 3755 8989
        Email: contact@vivas.vn
        Nội dung khiếu nại: ...................
- VIVAS sẽ căn cứ từng trường hợp cụ thể để có phương án giải quyết cho phù hợp. Khi thực hiện quyền khiếu nại, người khiếu nại có nghĩa vụ cung cấp các giấy tờ, bằng chứng, căn cứ có liên quan đến việc khiếu nại và phải chịu trách nhiệm về nội dung khiếu nại, giấy tờ, bằng chứng, căn cứ do mình cung cấp theo quy định pháp luật.
- VIVAS chỉ hỗ trợ, giải quyết khiếu nại, tố cáo của Người Dùng trong trường hợp bạn đã ghi đầy đủ, trung thực và chính xác thông tin khi đăng ký tài khoản.
- Đối với tranh chấp giữa Người Dùng với nhau, hoặc tranh chấp với Bên Thứ Ba, có thể VIVAS sẽ gửi thông tin liên hệ cho các đối tượng tranh chấp để các bên tự giải quyết hoặc VIVAS sẽ căn cứ vào tình hình thực tế để giải quyết. Theo đó, VIVAS sẽ bảo vệ quyền lợi tối đa có thể cho Người Dùng hợp pháp và chính đáng.
- Người Dùng đồng ý bảo vệ, bồi hoàn và loại trừ VIVAS khỏi những nghĩa vụ pháp lý, tố tụng, tổn thất, chi phí bao gồm nhưng không giới hạn án phí, chi phí luật sư, chuyên gia tư vấn có liên quan đến việc giải quyết hoặc phát sinh từ sự vi phạm của Người Dùng trong quá trình sử dụng sản phẩm.
- Nếu tranh chấp không được giải quyết trong vòng sáu mươi (60) ngày kể từ ngày một Bên thông báo cho Bên còn lại bằng văn bản về việc phát sinh tranh chấp thì một trong các Bên có quyền đưa vụ việc ra giải quyết tại tòa án có thẩm quyền tại Hà Nội theo quy định của pháp luật, Bên thua kiện sẽ phải chịu toàn bộ các chi phí tố tụng tại tòa án
Điều 11: Các cam kết của người dùng
- Người Dùng cam kết rằng những thông tin mà Người Dùng cung cấp cho VIVAS là hợp pháp, chính xác, trung thực, không vi phạm bản quyền, sở hữu trí tuệ. Người Dùng sẽ hoàn toàn chịu trách nhiệm cho các thông tin của Người Dùng.
- Người Dùng cam kết rằng, Người Dùng chính là chủ tài khoản. Người Dùng không nhân danh, đại diện một ai khác thực hiện các giao dịch trên tài khoản này. Người Dùng cam kết mọi giao dịch trên tài khoản này đều do Người Dùng thực hiện, mà không phải một ai khác thực hiện và Người Dùng sẽ chịu trách nhiệm cho các giao dịch trên tài khoản của mình
Điều 12: Hiệu lực thỏa thuận hợp đồng
- Các điều khoản quy định tại Quy định sử dụng này có thể được cập nhật, chỉnh sửa bất cứ lúc nào mà không cần phải thông báo trước tới người sử dụng. VIVAS sẽ công bố rõ trên Website, diễn đàn về những thay đổi, bổ sung đó.
- Trong trường hợp một hoặc một số điều khoản Quy định sử dụng này xung đột với các quy định của luật pháp và bị Tòa án tuyên là vô hiệu, điều khoản đó sẽ được chỉnh sửa cho phù hợp với quy định pháp luật hiện hành, và phần còn lại của Quy định sử dụng vẫn giữ nguyên giá trị.
- Thỏa thuận này có giá trị như Hợp Đồng. Người Dùng hiểu rằng, đây là hợp đồng điện tử, Giá trị pháp lý của hợp đồng điện tử không thể bị phủ nhận chỉ vì hợp đồng đó được thể hiện dưới dạng thông điệp dữ liệu theo Luật Giao Dịch Điện Tử. Bằng cách nhấn vào nút “Đăng ký”, Người Dùng hoàn toàn đồng ý và đã hiểu các điều khoản, chính sách chia sẻ thông tin trong Hợp Đồng này và Hợp Đồng có hiệu lực kề từ thời điểm này.
  """;

  List<Widget> _buildFormattedContent() {
    final lines = longParagraph.split('\n');
    final List<Widget> widgets = [];

    for (var line in lines) {
      if (line.trim().isEmpty) {
        // Add spacing for empty lines
        widgets.add(const SizedBox(height: 8));
        continue;
      }

      // Check if line has leading spaces (indented content)
      final hasIndentation =
          line.startsWith('        ') || line.startsWith('\t');

      if (line.trim().startsWith('Điều')) {
        // Bold text for lines starting with "Điều"
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: Text(
              line.trim(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      } else if (line.trim().startsWith('-')) {
        // Bullet point for lines starting with "-"
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontSize: 16.0)),
                Expanded(
                  child: Text(
                    line.trim().substring(1).trim(),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (hasIndentation) {
        // Indented content (like contact information)
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 2, bottom: 2),
            child: Text(
              line.trim(),
              style: const TextStyle(fontSize: 15.0, height: 1.5),
            ),
          ),
        );
      } else {
        // Regular text
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Text(
              line.trim(),
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        );
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.chevron_left_rounded),
        ),
        title: Text(
          'Điều khoản sử dụng',
          style: AppTypography.style(15, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildFormattedContent(),
          ),
        ),
      ),
    );
  }
}
