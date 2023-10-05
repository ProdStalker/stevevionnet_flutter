import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'navigation_todo_cubit_state.dart';

class NavigationToDoCubit extends Cubit<NavigationToDoCubitState> {
  NavigationToDoCubit() : super(const NavigationToDoCubitState());

  void selectedToDoCollectionChanged(String selectedType) {
    emit(NavigationToDoCubitState(selectedType: selectedType));
  }

  void secondBodyHasChanged({required bool isSecondBodyDisplayed}) {
    if (isSecondBodyDisplayed != state.isSecondBodyDisplayed) {
      emit(NavigationToDoCubitState(
          isSecondBodyDisplayed: isSecondBodyDisplayed,
          selectedType: state.selectedType
      )
      );
    }
  }
}
