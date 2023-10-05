part of 'navigation_todo_cubit.dart';


class NavigationToDoCubitState extends Equatable {
  final String? selectedType;
  final bool? isSecondBodyDisplayed;

  const NavigationToDoCubitState({
    this.selectedType,
    this.isSecondBodyDisplayed
  });

  @override
  List<Object?> get props => [
      isSecondBodyDisplayed,
      selectedType
  ];
}

