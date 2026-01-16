part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {
  const DashboardEvent();
}

class FetchDoctorsEvent extends DashboardEvent {
  const FetchDoctorsEvent();
}
