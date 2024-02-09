enum OtpStatus { DEFAULT, SENT, FILLED, RECEIVED, FAILED }

enum LoginStatus { LOGGED_IN, DEFAULT, LOGGED_OUT }

enum TextFieldStatus { FILLED, EMPTY, ERROR }

enum NumberValidation { DEFAULT, WRONG, CORRECT }

enum ONDUTY { ON, OFF }

enum LANG {
  empty('Select Language', 'Select Language'),
  hindi('हिंदी', 'hi'),
  english('ENGLISH', 'en');

  const LANG(this.lng, this.identifier);

  final String lng;
  final String identifier;
}
