import 'package:expense_tracker_lite/core/custom_types/app_exception.dart';
import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
import 'package:expense_tracker_lite/data/models/expense_model.dart';
import 'package:expense_tracker_lite/domain/use_cases/get_expenses_use_case.dart';
import 'package:expense_tracker_lite/presentation/common/base_state.dart';
import 'package:expense_tracker_lite/presentation/common/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final GetExpensesUseCase getExpensesUseCase;

  ExpensesBloc(this.getExpensesUseCase) : super(ExpensesState()) {
    on<ExpensesFetched>(_onExpensesFetched);
    on<ExpensesRefreshed>(_onExpensesRefreshed);
    on<ExpensesListToggled>(_toggleExpensesList);
  }

  int _page = 1;

  Future<void> _onExpensesFetched(
    ExpensesFetched event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    final result = await getExpensesUseCase(
      GetExpensesParams(page: _page, filter: event.filter),
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(status: Status.failure, failure: failure)),
      (expenses) {
        final List<ExpenseModel> all = List.from(state.expenses)
          ..addAll(expenses);
        emit(
          state.copyWith(
            status: expenses.isEmpty ? Status.empty : Status.success,
            expenses: all,
          ),
        );
        _page++;
      },
    );
  }

  void _onExpensesRefreshed(
    ExpensesRefreshed event,
    Emitter<ExpensesState> emit,
  ) {
    _page = 1;
    emit(ExpensesState());
    add(ExpensesFetched(filter: event.filter));
  }

  void _toggleExpensesList(
    ExpensesListToggled event,
    Emitter<ExpensesState> emit,
  ) {
    emit(state.copyWith(isListExpanded: !state.isListExpanded));
  }
}
