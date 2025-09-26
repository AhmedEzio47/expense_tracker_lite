import 'package:expense_tracker_lite/core/custom_types/app_exception.dart';
import 'package:expense_tracker_lite/domain/use_cases/get_summary_use_case.dart';
import 'package:expense_tracker_lite/domain/use_cases/use_case.dart';
import 'package:expense_tracker_lite/presentation/common/base_state.dart';
import 'package:expense_tracker_lite/presentation/common/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryBloc(this.getSummaryUseCase) : super(SummaryState()) {
    on<SummaryFetched>(_onSummaryFetched);
  }

  final GetSummaryUseCase getSummaryUseCase;

  Future<void> _onSummaryFetched(
    SummaryFetched event,
    Emitter<SummaryState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final summary = await getSummaryUseCase(NoParams());

    summary.fold(
      (failure) =>
          emit(state.copyWith(status: Status.failure, failure: failure)),
      (summary) => emit(
        state.copyWith(
          status: Status.success,
          totalExpenses: summary.$1,
          totalIncome: summary.$2,
        ),
      ),
    );
  }
}
