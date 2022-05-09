import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/authentication/authentication_payload.dart';
import '../../schema/authentication/authentication_payload_schema.dart';

@injectable
class AuthenticationPayloadMapper
    extends BaseMapper<AuthenticationPayloadSchema, AuthenticationPayload> {
  @override
  AuthenticationPayload mapToRight(AuthenticationPayloadSchema l) {
    return AuthenticationPayload(
      accessToken: l.accessToken,
      refreshToken: l.refreshToken,
    );
  }
}
