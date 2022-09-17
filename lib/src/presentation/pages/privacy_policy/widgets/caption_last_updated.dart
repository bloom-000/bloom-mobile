import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/legal_document/legal_document.dart';
import '../../../widgets/shared/caption_last_updated.dart' as shared_widget;
import '../state/privacy_policy_page_cubit.dart';

class CaptionLastUpdated extends StatelessWidget {
  const CaptionLastUpdated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyPolicyPageCubit, PrivacyPolicyPageState>(
      buildWhen: (PrivacyPolicyPageState previous, PrivacyPolicyPageState current) =>
          previous.document != current.document,
      builder: (_, PrivacyPolicyPageState state) {
        return state.document.maybeWhen(
          success: (LegalDocument data) => data.updatedAt != null
              ? shared_widget.CaptionLastUpdated(lastUpdatedAt: data.updatedAt!)
              : const SizedBox.shrink(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
