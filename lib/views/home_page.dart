// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/models/recipe.dart';
import 'package:e_commerce_app/services/data_service.dart';
import 'package:e_commerce_app/views/recipe_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mealTypeFilter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'E-Commerce App'), //Add const bcaz Text will not be changed.Its fixed.
        centerTitle: true,
      ),
      body: SafeArea(
        child: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _recepieTypeButtn(),
          _recipesList(),
        ],
      ),
    );
  }

  Widget _recepieTypeButtn() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter = "snack";
                });
              },
              child: Text(
                "🥕Snack",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter = "breakfast";
                });
              },
              child: Text(
                "🍳Breakfast",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter = "lunch";
                });
              },
              child: Text(
                "🍗Lunch",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _mealTypeFilter = "dinner";
                });
              },
              child: Text(
                "🍛Dinner",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recipesList() {
    return Expanded(
      child: FutureBuilder<Recipe>(
        future: DataService().getRecipes(_mealTypeFilter),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Unable to load data."));
          }

          if (!snapshot.hasData || snapshot.data!.recipes.isEmpty) {
            return Center(child: Text("No recipes found."));
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.recipes.length,
            itemBuilder: (context, recipeIndex) {
              RecipeElement recipeElement = snapshot.data!.recipes[recipeIndex];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RecipePage(
                          recipe: recipeElement,
                        );
                      },
                    ),
                  );
                },
                contentPadding: EdgeInsets.only(top: 20.0),
                isThreeLine: true,
                subtitle: Text(
                    "${recipeElement.cuisine}\nDifficulty: ${recipeElement.difficulty}"),
                leading: Image.network(recipeElement.image),
                title: Text(recipeElement.name),
                trailing: Text(
                  "${recipeElement.rating.toString()} ⭐",
                  style: TextStyle(fontSize: 15),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
