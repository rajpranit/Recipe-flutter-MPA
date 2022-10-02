import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class FilterSetting extends StatefulWidget {
  Function setFilters;
  Map<String, bool> filters;
  FilterSetting(this.filters, this.setFilters);

  @override
  State<FilterSetting> createState() => _FilterSettingState();
}

class _FilterSettingState extends State<FilterSetting> {
  var _glutenfree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenfree = widget.filters['gluten-free'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
    _lactoseFree = widget.filters['lactose-free'];

    super.initState();
  }

  Widget _buildSwitchWidget(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: (() {
                widget.setFilters({
                  'gluten-free': _glutenfree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'lactose-free': _lactoseFree
                });
              }),
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Set your meal preferences here',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchWidget(
                      'Gluten-Free',
                      'Only includes gluten free meals',
                      _glutenfree, (newvalue) {
                    setState(() {
                      _glutenfree = newvalue;
                    });
                  }),
                  _buildSwitchWidget(
                      'Vegan', 'Only includes Vegan meals', _vegan, (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  }),
                  _buildSwitchWidget(
                      'Vegetarian',
                      'Only includes Vegetarian meals',
                      _vegetarian, (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  }),
                  _buildSwitchWidget(
                      'Lactose-Free',
                      'Only includes lactose free meals',
                      _lactoseFree, (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
