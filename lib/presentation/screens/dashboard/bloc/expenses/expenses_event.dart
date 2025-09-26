part of 'expenses_bloc.dart';

sealed class ExpensesEvent {
  const ExpensesEvent();
}

class ExpensesFetched extends ExpensesEvent {
  const ExpensesFetched({this.filter});

  final ExpenseFilter? filter;
}

class ExpensesRefreshed extends ExpensesEvent {
  const ExpensesRefreshed({required this.filter});

  final ExpenseFilter filter;
}

class ExpensesListToggled extends ExpensesEvent {
  const ExpensesListToggled();
}
