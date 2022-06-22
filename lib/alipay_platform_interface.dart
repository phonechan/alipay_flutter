import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'alipay_method_channel.dart';

abstract class AlipayPlatform extends PlatformInterface {
  /// Constructs a AlipayPlatform.
  AlipayPlatform() : super(token: _token);

  static final Object _token = Object();

  static AlipayPlatform _instance = MethodChannelAlipay();

  /// The default instance of [AlipayPlatform] to use.
  ///
  /// Defaults to [MethodChannelAlipay].
  static AlipayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AlipayPlatform] when
  /// they register themselves.
  static set instance(AlipayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map?> alipay(String? paymentString, String? urlScheme) {
    throw UnimplementedError(
        'alipay(String?, String?) has not been implemented.');
  }
}
