import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:alipay/alipay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _paymentResult = {'resultStatus': -1};
  final _alipayPlugin = Alipay();

  @override
  void initState() {
    super.initState();
  }

  Future<void> startPay() async {
    String platformVersion;
    try {
      var paymentString =
          "_input_charset=UTF-8&appenv=%5E&currency=HKD&forex_biz=FP&notify_url=https%3A%2F%2Fonline-test.everonet.com%2FpspNotify%2FALP%2F1.0%2Fpayment%2F2088021966388155%2F5136f15d4d6948ceb3a0d0d7c560468f&out_trade_no=1cab453775854183a6ee85cc50480432&partner=2088021966388155&payment_inst=ALIPAYCN&payment_type=1&product_code=NEW_WAP_OVERSEAS_SELLER&refer_url=https%3A%2F%2Fwww.baidu.com&secondary_merchant_id=110301&secondary_merchant_industry=0742&secondary_merchant_name=ALP+APP+WXP&seller_id=2088021966388155&service=mobile.securitypay.pay&sign=e8ec721ad43a1b8a2a072d82482fdff6&sign_type=MD5&subject=%E6%94%AF%E4%BB%98%E5%AE%9D%E8%87%AA%E5%8A%A8%E5%85%A5%E7%BD%91&total_fee=10.00&trade_information=%7B%22business_type%22%3A%22Saleofgoods%22%2C%22other_business_type%22%3A%22Veterinary+services%22%7D";
      _paymentResult =
          await _alipayPlugin.alipay(paymentString) ?? {'resultStatus': -1};
    } on PlatformException {
      platformVersion = 'Failed to pay with alipay.';
    }

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('aliwxpay plugin example app'),
        ),
        body: Center(
          child: Text('Payment result: ${_paymentResult['resultStatus']}\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: startPay,
          child: const Icon(Icons.share_outlined),
        ),
      ),
    );
  }
}
