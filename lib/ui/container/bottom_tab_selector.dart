import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/model/tabs.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:redux/redux.dart';
import 'package:rapidinho/redux/common_actions.dart';
import 'package:rapidinho/data/data.dart';

class BottomTabSelector extends StatelessWidget {

  final Function(int) onTabChanged;

  BottomTabSelector({this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, viewModel){
        return BottomNavigationBar(
          items: navigationTabs.map((TabItem tab){
            return BottomNavigationBarItem(
              title: new Text(tab.name, style: RapidinhoTextStyle.bottomTextStyle),
              icon: new Icon(tab.icon, size: 24.0, color: Colors.grey),
              activeIcon: Icon(tab.icon, color: Colors.red)
            );
          }).toList(),
          onTap: (index){
            viewModel.onTabSelected(index);
            //TODO remove comment to see other tabs
            //onTabChanged(index);
          },
        );
      },
    );
  }
}

class _ViewModel {
  final NavigationTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({@required this.activeTab, @required this.onTabSelected});

  static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      activeTab: store.state.activeTab,
      onTabSelected: (index){
        store.dispatch(UpdateTabAction((NavigationTab.values[index])));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab &&
              onTabSelected == other.onTabSelected;

  @override
  int get hashCode =>
      activeTab.hashCode ^
      onTabSelected.hashCode;
}

