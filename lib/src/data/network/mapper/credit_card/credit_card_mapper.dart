import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/credit_card/credit_card.dart';
import '../../schema/credit_card/credit_card_schema.dart';

@lazySingleton
class CreditCardMapper extends BaseMapper<CreditCardSchema, CreditCard> {
  @override
  CreditCard mapToRight(CreditCardSchema l) {
    return CreditCard(
      id: l.id ?? '',
      createdAt: l.createdAt != null ? DateTime.tryParse(l.createdAt!) : null,
      updatedAt: l.updatedAt != null ? DateTime.tryParse(l.updatedAt!) : null,
      userId: l.userId ?? '',
      number: l.number ?? '',
      holderName: l.holderName ?? '',
      cvv: l.cvv ?? '',
      expiryDate: l.expiryDate != null ? DateTime.tryParse(l.expiryDate!) : null,
      isDefault: l.isDefault ?? false,
    );
  }
}
