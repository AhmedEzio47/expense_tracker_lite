part of 'add_expense_bloc.dart';

final class AddExpenseState extends BaseState {
  const AddExpenseState({super.status = Status.initial, super.failure});

  AddExpenseState copyWith({Status? status, AppException? failure}) {
    return AddExpenseState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
