import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;
  final IconData filledStar;
  final IconData halfStar;
  final IconData emptyStar;
  final Color borderColor;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 24,
    this.color = Colors.orange,
    this.filledStar = Icons.star,
    this.halfStar = Icons.star_half,
    this.emptyStar = Icons.star_border,
    this.borderColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double ratingValue = rating - index;
        if (ratingValue >= 1) {
          return Icon(filledStar, size: size, color: color);
        } else if (ratingValue > 0) {
          return Icon(halfStar, size: size, color: color);
        } else {
          return Icon(emptyStar, size: size, color: color);
        }
      }),
    );
  }
}