import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  static final Razorpay _razorpay = Razorpay();

  static void initializeRazorpay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  static void openPaymentGateway(double amountInRupees, String orderId) {
    var options = {
      'key': 'rzp_test_5GEg6UQU0pZlu9',
      'amount': amountInRupees * 100,
      'name': 'Your Company Name',
      'description': 'Payment for Order #$orderId',
      'prefill': {
        'contact': '1234567890',
        'email': 'user@gmail.com',
      },
      'external': {
        'wallets': ['paytm'],
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: $e');
    }
  }

  static void handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Successful: ${response.paymentId}');
  }

  static void handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.code} - ${response.message}');
  }

  static void handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet Payment: ${response.walletName}');
  }
}
