import 'package:dio/dio.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'save_video_input.dart';
part 'save_video_output.dart';

class SaveVideoUseCase extends FutureUseCase<SaveVideoInput, SaveVideoOutput> {
  @override
  Future<SaveVideoOutput> buildUseCase(SaveVideoInput input) async {
    try {
      final dio = Dio();
      await dio.download(input.url, input.savePath);
      return SaveVideoOutput();
    } on DioException catch (e) {
      return SaveVideoOutput(errorMsg: 'Lỗi khi tải video: ${e.message}');
    } catch (e) {
      return SaveVideoOutput(errorMsg: 'Đã xảy ra lỗi khi tải video: $e');
    }
  }
}
