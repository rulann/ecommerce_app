import 'package:get/get.dart';

class locale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'viewAll': 'view all',
          'deals': 'Best Deals For You',
          'ShopBy': 'Shop By Category',
          'subC': 'sub Categories',
          'subP': 'sub Products',
          'addC': 'Add to cart',
          'cart': 'My Cart',
          'buy': 'Buy Now',
          'total': 'Total',
          'subtotal': 'Subtotal',
          'acc': 'My Account',
          'order': 'My Order',
          'info': 'My Information',
          'payment': 'Payment Method',
          'services': 'Services',
          'about': 'About Us',
          'logOut': 'Log Out',
          'follow': 'Follow us on social media',
          'noProducts': 'there are no products',
          'products': 'Products'
        },
        'ar': {
          'viewAll': 'عرض الكل',
          'deals': 'افضل العروض',
          'ShopBy': 'تسوق حسب الفئة',
          'subC': 'الفئات الفرعية',
          'subP': 'المنتجات الفرعية',
          'addC': 'اضافة للسلة',
          'cart': 'السلة',
          'buy': 'شراء',
          'total': 'المجموع',
          'subtotal': 'المجموع',
          'acc': 'حسابي',
          'order': 'طلباتي',
          'info': 'معلوماتي',
          'payment': 'طرق الدفع',
          'services': 'الخدمات',
          'about': 'عنا',
          'logOut': 'تسجيل الخروج',
          'follow': 'تابعونا على مواقع التواصل الاجتماعي',
          'noProducts': 'لا يوجد منتجات',
          'products': 'المنتجات'
        }
      };
}
