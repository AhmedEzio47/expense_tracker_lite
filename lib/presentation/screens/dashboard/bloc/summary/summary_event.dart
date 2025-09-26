part of 'summary_bloc.dart';

sealed class SummaryEvent {
  const SummaryEvent();
}

final class SummaryFetched extends SummaryEvent {
  const SummaryFetched();
}
