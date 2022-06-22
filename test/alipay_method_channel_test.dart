import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alipay/alipay_method_channel.dart';

void main() {
  MethodChannelAlipay platform = MethodChannelAlipay();
  const MethodChannel channel = MethodChannel('alipay');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('alipay', () async {
    expect(await platform.alipay('', 'cil'), '42');
  });
}
