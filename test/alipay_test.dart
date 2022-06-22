import 'package:flutter_test/flutter_test.dart';
import 'package:alipay/alipay.dart';
import 'package:alipay/alipay_platform_interface.dart';
import 'package:alipay/alipay_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAlipayPlatform 
    with MockPlatformInterfaceMixin
    implements AlipayPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AlipayPlatform initialPlatform = AlipayPlatform.instance;

  test('$MethodChannelAlipay is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAlipay>());
  });

  test('getPlatformVersion', () async {
    Alipay alipayPlugin = Alipay();
    MockAlipayPlatform fakePlatform = MockAlipayPlatform();
    AlipayPlatform.instance = fakePlatform;
  
    expect(await alipayPlugin.getPlatformVersion(), '42');
  });
}
