abstract class TkCommon {
  static const String signIn = 'TkCommon.signIn';
  static const String signUp = 'TkCommon.signUp';
}

abstract class TkFieldHint {
  static const String emailAddress = 'TkFieldHint.emailAddress';
  static const String password = 'TkFieldHint.password';
  static const String repeatPassword = 'TkFieldHint.repeatPassword';
  static const String fullName = 'TkFieldHint.fullName';
  static const String birthDate = 'TkFieldHint.birthDate';
  static const String gender = 'TkFieldHint.gender';
}

abstract class TkValidationError {
  static const String fieldIsRequired = 'TkValidationError.fieldIsRequired';
  static const String invalidEmail = 'TkValidationError.invalidEmail';
  static const String passwordIsTooShort = 'TkValidationError.passwordIsTooShort';
}

abstract class TkWelcome {
  static const String captionPage1 = 'TkWelcome.captionPage1';
  static const String captionPage2 = 'TkWelcome.captionPage2';
  static const String captionPage3 = 'TkWelcome.captionPage3';
  static const String captionPage4 = 'TkWelcome.captionPage4';
  static const String bottomCaption = 'TkWelcome.bottomCaption';
  static const String buttonCreateAccount = 'TkWelcome.buttonCreateAccount';
}

abstract class TkSignIn {
  static const String header = 'TkSignIn.header';
  static const String subHeader = 'TkSignIn.subHeader';
  static const String buttonForgotPassword = 'TkSignIn.buttonForgotPassword';
  static const String captionContinueWith = 'TkSignIn.captionContinueWith';
  static const String captionDontHaveAccount = 'TkSignIn.captionDontHaveAccount';
}