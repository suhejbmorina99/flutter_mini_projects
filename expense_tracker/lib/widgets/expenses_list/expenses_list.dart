import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // Nuk perdorim column kur nuk e dim length e colonave sepse ka performance
    // issue, Listview osht e mire se krijon nje list qe ka te nderturar ne vete
    // nje list scrollable kurse funksioni builder e qete ne view vetem ate
    // 'expense' qe osht me rende pra i bon render kur ka nevoj duke e
    // permisu performance
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(
        expense: expenses[index],
      ),
    );
  }
}
