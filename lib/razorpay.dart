import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Razor extends StatefulWidget {
  @override
  _RazorState createState() => _RazorState();
}

class _RazorState extends State<Razor> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();
  FocusNode textFocusController = FocusNode();
  var msg;

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => textFocusController.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Razor Pay"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: TextField(
                  focusNode: textFocusController,
                  cursorRadius: Radius.zero,
                  textAlign: TextAlign.center,
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: "Amount",
                  ),
                  style: const TextStyle(fontSize: 35.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  // color: Colors.deepPurple,
                  child: Text(
                    "Pay",
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onPressed: () {
                    openCheckout();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_NWrYsDjM8UrCjy',
      'amount': 18 * 100,
      'name': 'Test Payment By Abhishek',
      'description': 'This is a Test Payment',
      //'timeout': '180',
      //'theme.color': '#03be03',
      'currency': 'INR',
      'prefill': {
        'contact': '2323232323',
        'email': 'testByabhishek@razorpay.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Pament success");
    msg = "SUCCESS: ";
    showToast(msg);
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    msg = "ERROR: " + response.code.toString() + " - " + showToast(msg);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    msg = "EXTERNAL_WALLET: ";
    showToast(msg);
  }

  showToast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.withOpacity(0.1),
      textColor: Colors.black54,
    );
  }
}
