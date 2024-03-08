import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
  clothes,
  gas,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.clothes: Icons.shopify,
  Category.gas: Icons.local_gas_station,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  // permes qeseja 3rd party library uuid e shtojm nje unique id dinamike,
  // mbasi qe te krijohet nje objekt me keto te dhena.

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // permes qeseja 3rd party library intl e formatojm date ne formatin
  // qe na deshirojm
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expense,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expense = allExpenses
            .where((specificExpense) => specificExpense.category == category)
            .toList();

  final Category category;
  final List<Expense> expense;

  double get totalExpense {
    double sum = 0;

    for (final expens in expense) {
      sum += expens.amount; // sum = sum + expnse.amount;
    }

    return sum;
  }
}
