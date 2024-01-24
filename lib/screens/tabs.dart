import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_apppp/screens/categories.dart';
import 'package:meals_apppp/screens/meals.dart';
import 'package:meals_apppp/widgets/main_drawer.dart';
import 'package:meals_apppp/screens/filters.dart';
import 'package:meals_apppp/providers/meals_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:meals_apppp/providers/favourites_provider.dart';
import 'package:meals_apppp/providers/filters_provider.dart';

class  TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState(){
    return _TabsScreenState();
  }
}
class _TabsScreenState extends ConsumerState<TabsScreen>{
  int _selectedPageIndex=0;
  void selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if(identifier=='filters'){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> FiltersScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    final availableMeals=ref.watch(filteredMealsProvider);
    Widget activeScreen=CategoriesScreen(availableMeals: availableMeals,);
    var activePageTitle='Categories';
    if(_selectedPageIndex==1){
      final favouriteMeals=ref.watch(favouriteMealsProvider);
      activeScreen=MealsScreen(meals: favouriteMeals);
      activePageTitle='Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('dynamic....'),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favourites'),
        ],
      ),
    );
  }

}