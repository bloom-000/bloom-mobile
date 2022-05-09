import 'package:common_models/common_models.dart';

import '../model/legal_document/legal_document.dart';

abstract class LegalDocumentsProvider {
  Future<Either<FetchFailure, LegalDocument>> getTermsOfService();

  Future<Either<FetchFailure, LegalDocument>> getPrivacyPolicy();
}
