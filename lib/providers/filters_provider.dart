import 'package:meals_apppp/providers/meals_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:meals_apppp/models/meal.dart';
enum Filter{
  glutenFree,
  lactoseFree,
  vegeterian,
  vegan
}
class filtersNotifier extends StateNotifier<Map<Filter,bool>>{
  filtersNotifier()
  : super({Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegeterian: false
  });

  void setFilter(Filter filter,bool isActive){
    state={
      ...state,
      filter : isActive
    };
  }
}
final filtersProvider=StateNotifierProvider<filtersNotifier,Map<Filter,bool>>((ref) =>
    filtersNotifier()
);
final filteredMealsProvider=Provider((ref)  {
  final meals=ref.watch(mealsProvider);
  final activeFilters=ref.watch(filtersProvider);
  return meals.where((meal){
if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree ){
return false;
}
if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
return false;
}
if(activeFilters[Filter.vegan]! && !meal.isVegan){
return false;
}
if(activeFilters[Filter.vegeterian]! && !meal.isVegetarian){
return false;
}
return true;
}).toList();
});