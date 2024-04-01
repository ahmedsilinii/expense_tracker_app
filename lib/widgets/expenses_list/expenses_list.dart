import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Add some!'),
    );

    if (expenses.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          child: ExpenseItem(
            expense: expenses[index],
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
        ),
      );
    }

    return mainContent;
  }
}
