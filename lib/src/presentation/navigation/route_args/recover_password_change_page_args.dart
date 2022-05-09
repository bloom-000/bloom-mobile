import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_password_change_page_args.freezed.dart';

@freezed
class RecoverPasswordChangePageArgs with _$RecoverPasswordChangePageArgs {
  const factory RecoverPasswordChangePageArgs({
    required String uuid,
  }) = _RecoverPasswordChangePageArgs;
}
