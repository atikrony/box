import 'package:flutter/material.dart';
import 'custom_card.dart';

class CustomizedCard extends StatefulWidget {
  const CustomizedCard({Key? key, required this.onCardTap}) : super(key: key);

  final VoidCallback onCardTap;

  @override
  _CustomizedCardState createState() => _CustomizedCardState();
}

class _CustomizedCardState extends State<CustomizedCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onCardTap,
            child: CustomCard(
              title: 'Dal',
              description: 'This is waste of time',
              imageAsset: 'assets/images/dal.png',
            ),
          ),
          GestureDetector(
            onTap: widget.onCardTap,
            child: CustomCard(
              title: 'Egg',
              description: 'You know better',
              imageAsset: 'assets/images/egg.png',
            ),
          ),
          CustomCard(
            title: 'Eggplant',
            description: 'I don\'t know what to do',
            imageAsset: 'assets/images/eggplant.png',
          ),
          CustomCard(
            title: 'Food',
            description: 'This is end',
            imageAsset: 'assets/images/food.png',
          ),
          CustomCard(
            title: 'Omelette',
            description: 'This is it',
            imageAsset: 'assets/images/omelette.png',
          ),
          CustomCard(
            title: 'Rice',
            description: 'This is it',
            imageAsset: 'assets/images/rice.png',
          ),
        ],
      ),
    );
  }
}
