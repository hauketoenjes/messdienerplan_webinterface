import 'package:kiwi/kiwi.dart';
import 'package:messdienerplan_webinterface/api/messdienerplan_api.dart';

mixin ApiClient {
  final MessdienerplanApiClient apiClient =
      KiwiContainer().resolve<MessdienerplanApiClient>();
}
