import 'package:coffe/models/coffee_name_models.dart';
import 'package:coffe/product/colors/product_colors.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      children: [
        const _TitleAndSearchBox(),
        const _CoffeTilesList(),
        Container(
          height: 100,
          width: 0,
          color: Colors.amber,
        ),
      ],
    );
  }
}

class _CoffeTilesList extends StatefulWidget {
  const _CoffeTilesList({Key? key}) : super(key: key);

  @override
  State<_CoffeTilesList> createState() => __CoffeTilesListState();
}

class __CoffeTilesListState extends State<_CoffeTilesList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: CoffeNames.coffeName.length,
          itemBuilder: ((context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              child: TextButton(
                  onPressed: (() {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
                  child: Text(CoffeNames.coffeName[index],
                      style: _selectedIndex == index
                          ? Theme.of(context).textTheme.subtitle2
                          : Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white))),
            );
          })),
    );
  }
}

class _TitleAndSearchBox extends StatelessWidget {
  const _TitleAndSearchBox({
    Key? key,
  }) : super(key: key);

  final String _title = 'Find the best coffee for you';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(_title, style: Theme.of(context).textTheme.headline3),
          ),
          const _MyTextField(),
        ],
      ),
    );
  }
}

class _MyTextField extends StatelessWidget {
  const _MyTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: MyColors.mapleLeaf,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: MyColors.mapleLeaf, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          filled: true,
          prefixIconColor: MyColors.orionGrey,
          fillColor: MyColors.river,
          prefixIcon: const Icon(Icons.search_outlined, color: MyColors.orionGrey),
          labelText: 'Find your coffe..',
          labelStyle: const TextStyle(color: MyColors.orionGrey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
