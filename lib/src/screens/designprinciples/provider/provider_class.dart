import 'package:flutter/material.dart';
import 'provider_model.dart';

class ExpensesProvider with ChangeNotifier {
  List<Expense> _expensesList = [];

List<Expense> get recentExpenses => _expensesList;
  Future<void> fetchRecentExpenses() async {
    _expensesList = await ExpenseRepository.getRecentExpenses();
    notifyListeners();
  }
  void addExpense(Expense expense) {
    _expensesList.add(expense);
    notifyListeners();
  }
}

class ExpenseRepository {
  static Future<List<Expense>> getRecentExpenses() async {
    // Simulate fetching from a database
    await Future.delayed(Duration(seconds: 10)); // Simulate network delay
    return [
      Expense(id: 1, name: 'Coffee', amount: 3.5, date: DateTime.now().subtract(Duration(days: 1))),
      Expense(id: 2, name: 'Books', amount: 15.0, date: DateTime.now().subtract(Duration(days: 2))),
      Expense(id: 3, name: 'Groceries', amount: 45.0, date: DateTime.now().subtract(Duration(days: 3))),
      Expense(id: 4, name: 'Laptop', amount: 25.0, date: DateTime.now().subtract(Duration(days: 4))),
      Expense(id: 5, name: 'TIA', amount: 435.0, date: DateTime.now().subtract(Duration(days: 5))),
    ];
  }
}