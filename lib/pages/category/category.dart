import 'package:dofd_user_panel/models/category_product.dart';
import 'package:flutter/material.dart';

import 'components/menu_card.dart';
import 'components/restaruant_categories.dart';
import 'components/restaurant_app_bar.dart';
import 'components/restaurant_info.dart';


class CategoryPage extends StatefulWidget {
  final int index;
  final List<dynamic> category;
  const CategoryPage({Key? key, required this.index, required this.category}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState(this.index, this.category);
}

class _CategoryPageState extends State<CategoryPage> {
  final int index;
  final List<dynamic> category;
  _CategoryPageState(this.index, this.category);
  final scrollController = ScrollController();
  int selectedCategoryIndex = 0;
  double restaurantInfoHeight = 200 //appBar expandedHeight
      +
      170 // RestaurantInfo Height
      -
      kToolbarHeight;

  @override
  void initState() {
    createBreakPoints();
    scrollController.addListener(() {
      updateCategoryIndexOnScroll(scrollController.offset);
    });
    super.initState();
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;

      for (var i = 0; i < index; i++) {
        int length =  category[i].length;
        totalItems += length;
      }

      scrollController.animateTo(
          restaurantInfoHeight + (116 * totalItems) + (50 * index),
          duration: Duration(microseconds: 500),
          curve: Curves.ease);

      setState(() {
        selectedCategoryIndex = index;

      });
    }
  }

  List<double> breakPoints = [];

  void createBreakPoints (){
    double firstBreakPoint = restaurantInfoHeight + 50 + (116 * category[0].length);
    breakPoints.add(firstBreakPoint);

    for(var i =1; i<category.length; i++){
      double breakPoint = breakPoints.last + 50 + (116 * category[i].length);
      breakPoints.add(breakPoint);
    }
  }

  void updateCategoryIndexOnScroll(double offset){
    for(var i = 0; i<category.length; i++){
      if( i == 0) {
        if ((offset < breakPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      }else{
        if ((breakPoints[i - 1] <= offset) & (offset < breakPoints[i])) {
          if(selectedCategoryIndex != i){
            setState(() {
              selectedCategoryIndex = i;
            });
          }

        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          RestaurantAppBar(),
          SliverToBoxAdapter(
            child: RestaurantInfo(),
          ),
          SliverPersistentHeader(
            delegate: RestaurantCategories(
                onChanged: scrollToCategory,
                selectedIndex: selectedCategoryIndex, category: category),
            pinned: true,
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, categoryIndex) {
                    List<dynamic> items = category[categoryIndex]['products'];
                    return MenuCategoryItem(
                        title: category[categoryIndex]['title'],
                        items: List.generate(
                            category[categoryIndex].length,
                                (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: MenuCard(
                                    image: items[index]['img'],
                                    title: items[index]['name'],
                                    price: items[index]['price']))));
                  },
                  childCount: category.length,
                ),
              ))
        ],
      ),
    );
  }
}
