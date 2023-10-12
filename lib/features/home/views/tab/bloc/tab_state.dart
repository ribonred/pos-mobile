part of 'tab_bloc.dart';

enum TabPage {
  menu('Menu'),
  search('Search'),
  favorite('Favorite'),
  cart('Cart');

  final String name;
  const TabPage(this.name);
}

class TabState extends Equatable {
  final TabPage selectedTab;
  final int indexTab;
  const TabState({
    this.selectedTab = TabPage.menu,
    this.indexTab = 0,
  });

  @override
  List<Object> get props => [selectedTab, indexTab];

  TabState copyWith({
    TabPage? selectedTab,
    int? indexTab,
  }) {
    return TabState(
      selectedTab: selectedTab ?? this.selectedTab,
      indexTab: indexTab ?? this.indexTab,
    );
  }
}
