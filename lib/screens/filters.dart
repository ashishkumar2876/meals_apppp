import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_apppp/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key});

  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters=ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),

      ),
      body:  Column(
          children: [
            SwitchListTile(
                value: activeFilters[Filter.glutenFree]!,
                onChanged: (isChecked){
                  ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree,isChecked);
                },
                title: Text('Gluten-Free', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              subtitle: Text('Only include gluten-free', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 24),
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree,isChecked);
              },
              title: Text('Lactose-Free', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              subtitle: Text('Only include lactose-free', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 24),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegeterian]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegeterian,isChecked);
              },
              title: Text('Vegeterian', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              subtitle: Text('Only include vegeterian', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 24),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan,isChecked);
              },
              title: Text('Vegan-Free', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              subtitle: Text('Only include vegan-free', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 24),
            ),
          ],
        ),
    );
  }
}