import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../domain/manager/legal_documents_provider.dart';
import '../../domain/model/legal_document/legal_document.dart';
import '../../domain/model/legal_document/legal_document_paragraph.dart';

const List<LegalDocumentParagraph> _fakeParagraphs = <LegalDocumentParagraph>[
  LegalDocumentParagraph(
    title: 'AGREEMENT TO TERMS',
    body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel pellentesque quisque suspendisse risus sit ultrices sit. Habitant bibendum non tellus et id. Sed adipiscing sit ornare scelerisque vestibulum mi. In porttitor scelerisque tempus aliquet feugiat. Ultrices eget venenatis sagittis mattis. Massa egestas at varius interdum a vel vestibulum, leo, a. Phasellus elit, consectetur quis est congue purus. Amet vel nulla viverra gravida rhoncus. Velit, at venenatis, ipsum, eu. Libero congue odio mi, consectetur tellus. Bibendum egestas aliquam mauris aenean. Mi sed sollicitudin magna dignissim eros feugiat. Leo, iaculis massa scelerisque turpis purus posuere sollicitudin ornare mattis. Neque eget imperdiet pulvinar lobortis tincidunt. turpis purus posuere sollicitudin ornare mattis. Neque eget imperdiet.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vel pellentesque quisque suspendisse risus sit ultrices sit. Habitant bibendum non tellus et id. Sed adipiscing sit ornare scelerisque vestibulum mi. In porttitor scelerisque tempus aliquet feugiat. Ultrices\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vel pellentesque quisque suspendisse risus sit ultrices sit. Habitant bibendum non tellus et id. Sed adipiscing sit ornare scelerisque vestibulum mi. In porttitor scelerisque tempus aliquet feugiat. Ultrices eget venenatis sagittis mattis. Massa egestas at varius interdum a vel vestibulum, leo, a. Phasellus elit, consectetur quis est congue purus. Amet vel nulla viverra gravida rhoncus. Velit, at venenatis, ipsum, eu. Libero congue odio mi, consectetur tellus. Bibendum egestas aliquam mauris aenean. Mi sed sollicitudin magna dignissim eros feugiat. Leo, iaculis massa scelerisque turpis purus posuere sollicitudin ornare mattis. Neque eget imperdiet pulvinar lobortis tincidunt. turpis purus posuere sollicitudin ornare mattis. Neque eget imperdiet.',
  ),
];

@LazySingleton(as: LegalDocumentsProvider)
class LegalDocumentsProviderImpl implements LegalDocumentsProvider {
  @override
  Future<Either<FetchFailure, LegalDocument>> getPrivacyPolicy() async {
    return Future<Either<FetchFailure, LegalDocument>>.delayed(
      const Duration(milliseconds: 500),
      () => right(LegalDocument(
        paragraphs: _fakeParagraphs,
        updatedAt: DateTime.now().subtract(const Duration(days: 53)),
      )),
    );
  }

  @override
  Future<Either<FetchFailure, LegalDocument>> getTermsOfService() async {
    return Future<Either<FetchFailure, LegalDocument>>.delayed(
      const Duration(milliseconds: 500),
      () => right(LegalDocument(
        paragraphs: _fakeParagraphs,
        updatedAt: DateTime.now().subtract(const Duration(days: 20)),
      )),
    );
  }
}
