import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_apppp/main.dart';
import 'package:meals_apppp/models/meal.dart';
import 'package:meals_apppp/providers/favourites_provider.dart';
import 'package:transparent_image/transparent_image.dart';


class MealDetails extends ConsumerWidget{
  const MealDetails({super.key,required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favouriteMeals=ref.watch(favouriteMealsProvider);
    final isFavourite=favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white,
          fontSize: 18,
        ),),
        actions: [
          IconButton(onPressed: (){
            final wasAdded=ref.read(favouriteMealsProvider.notifier).toggleMealFavouriteStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),content: Text(wasAdded ? 'Meal added as Favourite' : 'Meal removed')));
          }, icon: AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child,animation){
        return RotationTransition(turns: Tween<double>(begin: .5,end: 1).animate(animation),
          child: child,
        );
      },
        child: Icon(isFavourite ? Icons.star : Icons.star_border,key: ValueKey(isFavourite),),
    )

          ),
        ],
      ),
      body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14,),
              Text('Ingredients',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),
              ),
              for (final ingredients in meal.ingredients)
                Text(ingredients,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 12
                )
                ),
              const SizedBox(height: 16,),
              Text('Steps',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              ),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  child: Text(step,
                    textAlign: TextAlign.center,
                    style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white
                  ),
                  ),
                )
            ],
          ),
        ),
    );
  }

}