part of 'dashboard_bloc.dart';

sealed class DashboardEvent {
  const DashboardEvent();
}

class FetchDoctorsEvent extends DashboardEvent {
  const FetchDoctorsEvent();
}

class SearchDoctorsEvent extends DashboardEvent {
  final String query;
  const SearchDoctorsEvent(this.query);
}

class SelectCategoryEvent extends DashboardEvent {
  final String category;
  const SelectCategoryEvent(this.category);
}
