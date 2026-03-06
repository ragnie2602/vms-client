part of 'get_event_display_config_usecase.dart';

class GetEventDisplayConfigOutput extends BaseOutput {
  final EventDisplayConfig config;
  final String? errMsg;

  GetEventDisplayConfigOutput(this.config, {this.errMsg});
}
