import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/manager/legal_documents_provider.dart';
import '../../../../domain/model/legal_document/legal_document.dart';

part 'privacy_policy_page_cubit.freezed.dart';

@freezed
class PrivacyPolicyPageState with _$PrivacyPolicyPageState {
  const factory PrivacyPolicyPageState({
    required DataState<FetchFailure, LegalDocument> document,
  }) = _PrivacyPolicyPageState;

  factory PrivacyPolicyPageState.initial() => PrivacyPolicyPageState(
        document: DataState<FetchFailure, LegalDocument>.idle(),
      );
}

@injectable
class PrivacyPolicyPageCubit extends Cubit<PrivacyPolicyPageState> {
  PrivacyPolicyPageCubit(
    this._legalDocumentsProvider,
  ) : super(PrivacyPolicyPageState.initial());

  final LegalDocumentsProvider _legalDocumentsProvider;

  Future<void> init() async {
    emit(state.copyWith(document: DataState<FetchFailure, LegalDocument>.loading()));
    final Either<FetchFailure, LegalDocument> document =
        await _legalDocumentsProvider.getPrivacyPolicy();
    emit(state.copyWith(document: DataState<FetchFailure, LegalDocument>.fromEither(document)));
  }
}
