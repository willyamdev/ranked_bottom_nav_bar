import 'package:flutter/material.dart';

class RankedBottomNavBar extends StatefulWidget {
  List<Icon> items;
  final ValueChanged<int> onItemTap;
  Color backgroundColor;
  Color iconColor;
  Color rankedColor;
  double height;
  double borderRadius;
  Duration animationDuration;

  // ******* MAX NAVBAR ITENS RECOMENDED 3 ********
  RankedBottomNavBar(
      {@required this.items,
      @required this.onItemTap,
      this.backgroundColor = Colors.black,
      this.iconColor = Colors.white,
      this.rankedColor = Colors.blue,
      this.height = 80,
      this.borderRadius = 32,
      this.animationDuration = const Duration(milliseconds: 150)});

  @override
  _RankedBottomNavBarState createState() => _RankedBottomNavBarState();
}

class _RankedBottomNavBarState extends State<RankedBottomNavBar> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.borderRadius),
              topRight: Radius.circular(widget.borderRadius))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.items.map((item) {
            var itemIndex = widget.items.indexOf(item);

            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = itemIndex;
                });
                widget.onItemTap(selected);
              },
              child: _navItem(item, selected == itemIndex),
            );
          }).toList()),
    );
  }

  Widget _navItem(Icon item, bool isSelected) {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        width: 55,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: IconTheme(
                  data: IconThemeData(size: 30, color: widget.iconColor),
                  child: item,
                ),
              ),
            ),
            AnimatedContainer(
              duration: widget.animationDuration,
              height: isSelected ? 30 : 10,
              width: 55,
              decoration: BoxDecoration(
                  color: widget.rankedColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            )
          ],
        ));
  }
}
