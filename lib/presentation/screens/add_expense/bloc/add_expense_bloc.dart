import 'package:bloc/bloc.dart';
import 'package:expense_tracker_lite/core/custom_types/app_exception.dart';
import 'package:expense_tracker_lite/data/models/expense_model.dart';
import 'package:expense_tracker_lite/domain/use_cases/add_expense_use_case.dart';
import 'package:expense_tracker_lite/presentation/common/base_state.dart';
import 'package:expense_tracker_lite/presentation/common/status.dart';

part 'add_expense_event.dart';
part 'add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final AddExpenseUseCase addExpenseUseCase;

  AddExpenseBloc(this.addExpenseUseCase) : super(AddExpenseState()) {
    on<ExpenseSubmitted>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      final result = await addExpenseUseCase(
        ExpenseModel(
          amount: event.amount,
          categoryId: event.categoryId,
          receiptFilePath: event.receiptImagePath,
          date: event.date,
        ),
      );

      result.fold(
        (failure) =>
            emit(state.copyWith(status: Status.failure, failure: failure)),
        (_) => emit(state.copyWith(status: Status.success)),
      );
    });
  }
}
