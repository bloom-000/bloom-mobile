import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/authentication/recover_password_confirm_code_response.dart';
import '../../schema/authentication/recover_password_confirm_code_response_schema.dart';

@injectable
class RecoverPasswordConfirmCodeResponseMapper extends BaseMapper<
    RecoverPasswordConfirmCodeResponseSchema, RecoverPasswordConfirmCodeResponse> {
  @override
  RecoverPasswordConfirmCodeResponse mapToRight(RecoverPasswordConfirmCodeResponseSchema l) {
    return RecoverPasswordConfirmCodeResponse(
      uuid: l.uuid,
    );
  }
}
