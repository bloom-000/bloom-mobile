import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import 'app_locales.dart';
import 'translation_keys.dart';

@injectable
class AppTranslations extends Translations {
  @override
  Map<Locale, Map<String, String>> get keys => <Locale, Map<String, String>>{
        AppLocales.localeEn: _enUs,
      };

  final Map<String, String> _enUs = <String, String>{
    TkCommon.signIn: 'Sign in',
    TkCommon.signUp: 'Sign up',
    TkCommon.and: 'and',
    TkCommon.lastUpdatedAt: 'Last updated at',
    TkCommon.continue_: 'Continue',
    TkCommon.error: 'Error',

    TkError.unknown: 'Unknown error',
    TkError.network: 'Network error',
    TkError.invalidEmailOrPassword: 'Invalid email or password',
    TkError.emailAlreadyInUse: 'Email already in use',
    TkError.userNotFoundWithEmail: 'User not found with provided email',
    TkError.recoverPasswordRequestNotFound: 'Recovery request not found',
    TkError.recoverPasswordRequestTimedOut: 'Recovery request timed out, please redo the process',
    TkError.recoverPasswordInvalidCode: 'Invalid code',

    TkFieldHint.emailAddress: 'Email address',
    TkFieldHint.password: 'Password',
    TkFieldHint.newPassword: 'New password',
    TkFieldHint.repeatPassword: 'Repeat password',
    TkFieldHint.fullName: 'Full name',
    TkFieldHint.birthDate: 'Birth date',
    TkFieldHint.gender: 'Gender',

    TkValidationError.fieldIsRequired: 'Field is required',
    TkValidationError.invalidEmail: 'Invalid email',
    TkValidationError.passwordIsTooShort: 'Password is too short',
    TkValidationError.repeatedPasswordDoesNotMatch: 'Repeated password does not match',
    TkValidationError.nameIsTooShort: 'Name is too short',

    TkOptionSelectorHeader.gender: 'Select gender',

    TkEnum.gender.male: 'Male',
    TkEnum.gender.female: 'Female',
    TkEnum.gender.other: 'Other',

    TkWelcome.captionPage1: 'Esuada fames ac turpis egestas. Integer orci dui, vehicula in urna sed, sollicitudin tempus risus',
    TkWelcome.captionPage2: 'Phasellus semper, erat ut scelerisque pellentesque',
    TkWelcome.captionPage3: 'Amet libero. Sed vel sem sed dolor egestas fermentum in in urna. Sed volutpat, sem id',
    TkWelcome.captionPage4: 'Donec tincidunt tellus lacus. Ut vehicula',
    TkWelcome.bottomCaption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tincidunt, mauris',
    TkWelcome.buttonCreateAccount: 'Or create account',

    TkSignIn.header: 'Welcome\nBack!',
    TkSignIn.subHeader: 'Continue where you left off',
    TkSignIn.buttonForgotPassword: 'Forgot password?',
    TkSignIn.captionContinueWith: 'or continue with',
    TkSignIn.captionDontHaveAccount: 'Don\' have an account?',

    TkSignUp.header: 'Create\nAccount',
    TkSignUp.legalCaptionStart: 'I agree with provided ',
    TkSignUp.privacyPolicy: 'privacy policy',
    TkSignUp.termsOfService: 'terms of service',

    TkTermsOfService.header: 'Terms of service',

    TkPrivacyPolicy.header: 'Privacy policy',

    TkRecoverPasswordRequest.header: 'Forgot\nPassword?',
    TkRecoverPasswordRequest.helperCaption1: 'Enter your email to let us send you a verification code.',

    TkRecoverPasswordConfirm.header: 'Confirm\nYour Email',
    TkRecoverPasswordConfirm.helperCaption1: 'We have sent you a 5 digit verification code to ',
    TkRecoverPasswordConfirm.helperCaption2: 'If you have not received one, click resend code button bellow',
    TkRecoverPasswordConfirm.captionDidntGetCode: 'Didn\'t get a verification code? ',
    TkRecoverPasswordConfirm.buttonResend: 'Resend',

    TkRecoverPasswordChange.header: 'Change\nPassword',
    TkRecoverPasswordChange.buttonChangePassword: 'Change password',
  };
}
