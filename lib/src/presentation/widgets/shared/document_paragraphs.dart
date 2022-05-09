import 'package:flutter/material.dart';

import '../../../domain/model/legal_document/legal_document.dart';
import '../../../domain/model/legal_document/legal_document_paragraph.dart';

class DocumentParagraphs extends StatelessWidget {
  const DocumentParagraphs({
    Key? key,
    required this.document,
  }) : super(key: key);

  final LegalDocument document;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          final LegalDocumentParagraph paragraph = document.paragraphs[index];

          return Text.rich(
            TextSpan(
              text: paragraph.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                const TextSpan(text: '\n\n'),
                TextSpan(
                  text: paragraph.body,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          );
        },
        childCount: document.paragraphs.length,
      ),
    );
  }
}
