part of 'expenses_bloc.dart';

final class ExpensesState extends BaseState {
  const ExpensesState({
    super.status = Status.initial,
    super.failure,
    this.expenses = const [],
    this.isListExpanded = false,
  });

  final List<ExpenseModel> expenses;
  final bool isListExpanded;

  ExpensesState copyWith({
    Status? status,
    AppException? failure,
    List<ExpenseModel>? expenses,
    bool? isListExpanded,
  }) {
    return ExpensesState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      expenses: expenses ?? this.expenses,
      isListExpanded: isListExpanded ?? this.isListExpanded,
    );
  }

  @override
  List<Object?> get props => super.props..addAll([expenses, isListExpanded]);
}
