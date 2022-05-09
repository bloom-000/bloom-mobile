import 'package:freezed_annotation/freezed_annotation.dart';

import 'legal_document_paragraph.dart';

part 'legal_document.freezed.dart';

@freezed
class LegalDocument with _$LegalDocument {
  const factory LegalDocument({
    required List<LegalDocumentParagraph> paragraphs,
    required DateTime? updatedAt,
  }) = _LegalDocument;
}
