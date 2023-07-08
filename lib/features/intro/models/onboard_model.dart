import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/assets.gen.dart';

class Onboard {
  final Image image;
  final String title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onboardData = [
  Onboard(
    image: Assets.images.cocktail.image(
      fit: BoxFit.contain,
      height: 45.h,
      width: 80.w,
    ),
    title: 'Explore Limitless Possibilities',
    description:
        'Step into a world of endless cocktail creativity! From timeless classics to bold and exotic blends, GinJuice opens the door to a universe of tantalizing flavors waiting to be discontained.',
  ),
  Onboard(
    image: Assets.images.fun.image(
      fit: BoxFit.contain,
      height: 45.h,
      width: 80.w,
    ),
    title: 'Master Mixology',
    description:
        'Unleash your inner mixologist and become a true cocktail connoisseur. With GinJuice, you\'ll have access to expertly curated recipes that will transform you into the life of the party. Get ready to shake, stir, and sip your way to mixology mastery!',
  ),
  Onboard(
    image: Assets.images.favorite.image(
      fit: BoxFit.contain,
      height: 45.h,
      width: 80.w,
    ),
    title: 'Personalize Your Favorites',
    description:
        'Love a particular cocktail? Mark it as a favorite and create your own curated list of go-to drinks. Whether you prefer a classic Martini or a trendy craft creation, GinJuice keeps your favorites just a tap away.',
  ),
  Onboard(
    image: Assets.images.camera.image(
      fit: BoxFit.contain,
      height: 45.h,
      width: 80.w,
    ),
    title: 'Share Your Signature Sips',
    description:
        'Ready to showcase your unique creations? Share your own cocktail masterpieces with the GinJuice community! Upload your custom mixtures and inspire others with your innovative concoctions.',
  ),
  Onboard(
    image: Assets.images.gift.image(
      fit: BoxFit.contain,
      height: 45.h,
      width: 80.w,
    ),
    title: 'Ingredient Made Easy',
    description:
        'No need to scour the grocery store for specific ingredients. GinJuice provides detailed ingredient listings, ensuring you have everything you need to craft your desired cocktails. Cheers to hassle-free shopping!',
  ),
];
