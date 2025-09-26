part of 'expenses_bloc.dart';

final class ExpensesState extends BaseState {
  const ExpensesState({
    super.status = Status.initial,
    super.failure,
    this.expenses = const [],
    this.isListExpanded = false,
    this.filter = ExpenseFilter.monthly,
  });

  final List<ExpenseModel> expenses;
  final bool isListExpanded;
  final ExpenseFilter filter;

  bool get shouldShowLoadMore =>
      status == Status.success &&
      expenses.length % kPerPage == 0 &&
      isListExpanded;

  ExpensesState copyWith({
    Status? status,
    AppException? failure,
    List<ExpenseModel>? expenses,
    bool? isListExpanded,
    ExpenseFilter? filter,
  }) {
    return ExpensesState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      expenses: expenses ?? this.expenses,
      isListExpanded: isListExpanded ?? this.isListExpanded,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props =>
      super.props..addAll([expenses, isListExpanded, filter]);
}
