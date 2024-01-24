
import 'package:flutter/material.dart';
import 'package:meals_apppp/models/meal.dart';
import 'package:meals_apppp/screens/meal_details.dart';
import 'package:meals_apppp/widgets/meal_item.dart';
class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key,this.title,required this.meals});
  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealDetails(meal: meal)));
  }
  @override
  Widget build(BuildContext context) {
    Widget content=ListView.builder(
      itemCount: meals.length,
        itemBuilder: (ctx,index)=>MealItem(meal: meals[index] ,onSelectMeal: (meal){
          selectMeal(context, meal);
        },
            )
    );
    if(meals.isEmpty){
      content= Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Oh ho....nothing here!!',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),),
            SizedBox(height: 16,),
            Text('Try selecting a different Category!',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),)
          ],
        ),
      );
    }
    if(title==null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}