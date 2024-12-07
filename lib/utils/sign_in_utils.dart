import 'dart:math' as math;

String getNewCertificationNumber() {
  String newCertificationNumber = '';
  for (int i = 0; i < 6; i++) {
    newCertificationNumber += math.Random().nextInt(10).toString();
  }
  return newCertificationNumber;
}

String? getSocialImage(String social) {
  switch (social) {
    case 'kakao':
      return 'assets/logo/social/kakao.png';
    case 'apple':
      return 'assets/logo/social/apple.png';
    case 'naver':
      return 'assets/logo/social/naver.png';
    case 'google':
      return 'assets/logo/social/google.png';
    default:
      return null;
  }
}
