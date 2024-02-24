import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  // permes qeseja 3rd party library e shtojm nje uniq id dinamike,
  // mbasi qe te krijohet nje objekt me keto te dhena.

  final String id;
  final String title;
  final bool amount;
  final DateTime date;
}
