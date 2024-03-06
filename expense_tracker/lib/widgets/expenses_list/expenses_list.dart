import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // Nuk perdorim column kur nuk e dim length e colonave sepse ka performance
    // issue, Listview osht e mire se krijon nje list qe ka te nderturar ne vete
    // nje list scrollable kurse funksioni builder e qete ne view vetem ate
    // 'expense' qe osht me rende pra i bon render kur ka nevoj duke e
    // permisu performance
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: Theme.of(context).cardTheme.margin,
              ),
              onDismissed: (direction) => onRemoveExpense(expenses[index]),
              child: ExpenseItem(
                expense: expenses[index],
              ),
            ));
  }
}
