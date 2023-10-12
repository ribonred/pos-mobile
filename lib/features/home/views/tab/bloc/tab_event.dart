part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
  @override
  List<Object> get props => [];

}

class OnChangedTab extends TabEvent {
  final TabPage tabPage;
  const OnChangedTab(this.tabPage);

  @override
  List<Object> get props => [tabPage];
}

class BackToMainMenu extends TabEvent {}
