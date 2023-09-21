import 'package:flutter/material.dart';


class RestaurantCategories extends SliverPersistentHeaderDelegate{
final ValueChanged<int> onChanged;
final List<dynamic> category;
final int selectedIndex;


RestaurantCategories({required this.onChanged, required this.selectedIndex, required this.category});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 52,
      color: Colors.white,
      child: Categories(onChanged: onChanged, selectedIndex: selectedIndex, category: category,),
    );
  }

  @override
  double get maxExtent => 52;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  
}
class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.onChanged,
    required this.selectedIndex,
    required this.category,
  }) : super(key: key);

  final ValueChanged<int> onChanged;
  final int selectedIndex;
  final List<dynamic> category;
  @override
  State<Categories> createState() => _CategoriesState(category);
}

class _CategoriesState extends State<Categories> {
  final List<dynamic> category;

  // int selectedIndex = 0;
  late ScrollController _controller;

  _CategoriesState(this.category);
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Categories oldWidget) {
    _controller.animateTo(
      80.0 * widget.selectedIndex,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          category.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextButton(
              onPressed: () {
                widget.onChanged(index);
                _controller.animateTo(
                  80.0 * index,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 200),
                );
              },
              style: TextButton.styleFrom(
                  primary: widget.selectedIndex == index
                      ? Colors.black
                      : Colors.black45),
              child: Text(
                category[index]['title'],
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
