import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                });
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Gluten-free', 'Only include gluten-free meal', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile('Lactose-free',
                    'Only include lactose-free meal', _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile('Vegan', 'Only include vegan meal', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegetarian meal', _vegetarian,
                    (newValue) {
                  print(newValue);
                  setState(() {
                    _vegetarian = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
