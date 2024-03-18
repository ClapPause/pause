import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../constants/constants_enum.dart';
import '../constants/constants_value.dart';
import '../utils/local_utils.dart';

class HttpService {
  static Future<void> sendEmail({
    required String email,
    required String certifyCode,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    const serviceId = 'service_zzhjl14';
    const templateId = 'template_3s8dwaz';
    const userId = 'XBq59pGwTsjdeoU9p';

    await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'email': email,
            'certifyCode': certifyCode,
          }
        },
      ),
    );
  }
}
