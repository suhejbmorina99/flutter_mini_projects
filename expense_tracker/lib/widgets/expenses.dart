import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.90,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Italy Trip',
      amount: 535,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _addExpensesOverlay() {
    showModalBottomSheet(
      useSafeArea: true, // sigurohet qe overlay nuk pengohet nga kamera apo statusbari
      // dmth overlay fillon aty ky mbaron hapsira e rezervume per ate pjes
      isScrollControlled: true, // qekjo e bon modalin sa view dmth e rrit
      context: context,
      builder: (ctx) => NewExpense(onAddExpanse: _addExpenses),
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); // Me kta i fshijm krejt
    // ose i clearim snackbar-at e meparshem
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sherben me kqyre sa width kemi aktulaisht ne paisje
    // final width = MediaQuery.of(context).size.width;

    Widget mainContet = const Center(
      child: Text('No expense found, add new one'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContet = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: _addExpensesOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: mainContet,
            ),
          ],
        )
        // NOTE: Qeshtu mundem me bo nese dojm me bo responsive
        //Dmth me punu edhe ne landscape mode

        // body: width < 600
        //     ? Column(
        //         children: [
        //           Chart(expenses: _registeredExpenses),
        //           Expanded(
        //             child: mainContet,
        //           ),
        //         ],
        //       )
        //     : Row(
        //         children: [
        //           Expanded(
        //             child: Chart(expenses: _registeredExpenses),
        //           ),
        //           Expanded(
        //             child: mainContet,
        //           ),
        //         ],
        //       ),
        );
  }
}
