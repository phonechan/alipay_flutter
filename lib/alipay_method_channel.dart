import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'alipay_platform_interface.dart';

/// An implementation of [AlipayPlatform] that uses method channels.
class MethodChannelAlipay extends AlipayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('alipay');

  @override
  Future<Map?> alipay(String? paymentString) async {
    final result = await methodChannel
        .invokeMethod<Map?>('alipay', {"paymentString": paymentString});
    return result;
  }
}
