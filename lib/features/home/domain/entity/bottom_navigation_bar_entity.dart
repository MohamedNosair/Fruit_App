import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/generated/l10n.dart';

class BottomNavigationBarEntity {
  final String activeImage , inActiveImage , name;

  BottomNavigationBarEntity({required this.activeImage, required this.inActiveImage, required this.name});

}
List<BottomNavigationBarEntity> bottomNavBarItems = [
  BottomNavigationBarEntity(
    activeImage: AppImages.homeBold,
    inActiveImage: AppImages.homeOutline,
    name: S.current.home,
  ),
  BottomNavigationBarEntity(
    activeImage: AppImages.productsBold,
    inActiveImage: AppImages.productsOutline,
    name: S.current.products,
  ),
  BottomNavigationBarEntity(
    activeImage: AppImages.cartBold,
    inActiveImage: AppImages.cartOutline,
    name: S.current.cart,
  ),
  BottomNavigationBarEntity(
    activeImage: AppImages.profileBold,
    inActiveImage: AppImages.profileOutline,
    name: S.current.profile,
  ),
];