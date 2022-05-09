import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_confirm_page_args.freezed.dart';

@freezed
class RecoverPasswordConfirmPageArgs with _$RecoverPasswordConfirmPageArgs {
  const factory RecoverPasswordConfirmPageArgs({
    required String email,
  }) = _RecoverPasswordConfirmPageArgs;
}
