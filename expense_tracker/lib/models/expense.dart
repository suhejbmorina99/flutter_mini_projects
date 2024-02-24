import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
  clothes,
  gas,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  // permes qeseja 3rd party library e shtojm nje uniq id dinamike,
  // mbasi qe te krijohet nje objekt me keto te dhena.

  final String id;
  final String title;
  final bool amount;
  final DateTime date;
  final Category category;
}
