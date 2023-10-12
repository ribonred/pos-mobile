import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_state.dart';
part 'tab_event.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(const TabState()) {
    on<OnChangedTab>(_onChangedTab);
  }

  _onChangedTab(OnChangedTab event, Emitter<TabState> emit) {
    emit(state.copyWith(selectedTab: event.tabPage));
  }
}
