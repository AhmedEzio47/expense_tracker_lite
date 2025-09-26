part of 'add_expense_bloc.dart';

final class AddExpenseState extends BaseState {
  const AddExpenseState({
    super.status = Status.initial,
    super.failure,
    this.selectedCategory,
  });

  final Category? selectedCategory;

  AddExpenseState copyWith({
    Status? status,
    AppException? failure,
    Category? selectedCategory,
  }) {
    return AddExpenseState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => super.props..addAll([selectedCategory]);
}
