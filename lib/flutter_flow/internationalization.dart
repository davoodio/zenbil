import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'fa'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? faText = '',
  }) =>
      [enText, arText, faText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Splash
  {
    'xssnrfov': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Signup
  {
    '98lk433y': {
      'en': 'Login / Register',
      'ar': 'تسجيل الدخول / التسجيل',
      'fa': 'تۆمارکردنی چوونە ژوورەوە / تۆمارکردن',
    },
    'd204yxpt': {
      'en': 'Enter your phone number to continue...',
      'ar': 'أدخل رقم هاتفك للمتابعة...',
      'fa': 'ژمارەی مۆبایلەکەت تۆماربکە بۆ بەردەوام بوون...',
    },
    'qxfxgrm0': {
      'en': '+90',
      'ar': '+90',
      'fa': '+90',
    },
    'ucsjhnxn': {
      'en': '+1',
      'ar': '+1',
      'fa': '+1',
    },
    'w33kdtwk': {
      'en': 'Search for an item...',
      'ar': 'ابحث عن منتج...',
      'fa': 'گەڕان بەدوای کاڵا ...',
    },
    'zbw026kw': {
      'en': 'Phone number',
      'ar': 'رقم الهاتف',
      'fa': 'ژمارەی مۆبایل',
    },
    'trk7eetr': {
      'en': 'GET CODE',
      'ar': 'احصل على الرمز',
      'fa': 'کۆدەکەت بەدەستبهێنە',
    },
    '7fl9fg2p': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '097rag8v': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لە هەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    '39wm2g6d': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // PinCodeVerification
  {
    'x1tweg8e': {
      'en': 'Enter 6-digits code',
      'ar': 'أدخل الرمز المكون من 6 أرقام',
      'fa': 'کۆدی پێکهاتوو لە ٦ ژمارە تۆماربکە',
    },
    'am2c0hvz': {
      'en': 'Enter the 6-digits code that you recieved on your phone.',
      'ar': 'أدخل الرمز المكون من 6 أرقام الذي تلقيته على هاتفك.',
      'fa': 'کۆدی پێکهاتوو لە ٦ ژمارە تۆماربکە کە لە مۆبایلەکەت بەدەستت گەیشت.',
    },
    'hv2lxe0r': {
      'en': 'CONTINUE',
      'ar': 'متابعة',
      'fa': 'بەردەوام بوون',
    },
    'i0t70n83': {
      'en': 'Try again',
      'ar': 'حاول مرة أخرى',
      'fa': 'دووبارە هەوڵبدە',
    },
    'ywm17iwh': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // PasswordResetConfirmation
  {
    '61v49d8a': {
      'en': 'Confirmation',
      'ar': 'تأكيد',
      'fa': 'دڵنیابوونەوە',
    },
    'gda1gdsg': {
      'en':
          'Your password has been changed. Now you can log in with your new password.',
      'ar':
          'لقد تم تغيير كلمة المرور الخاصة بك. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.',
      'fa':
          'ژمارە نهێنیەکەت گۆڕدرا، ئێستا دەتوانی بە ژمارە نهێنی نوێ تۆمار بیت.',
    },
    'wh9xm2n7': {
      'en': 'LOG IN',
      'ar': 'تسجيل الدخول',
      'fa': 'چوونە ژوورەوە',
    },
    '18mdkbiu': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // TrackOrder
  {
    'ujpkfzxm': {
      'en': 'Track Order',
      'ar': 'تتبع الطلب',
      'fa': 'بەدواداچوونی داواکاری',
    },
    'xx6ucazs': {
      'en': 'Track Shipment Details',
      'ar': 'تتبع تفاصيل الشحنة',
      'fa': 'بەدواداچوونی وردەکاری بارکردن',
    },
    'f97nesv4': {
      'en': 'Error!',
      'ar': 'خطأ!',
      'fa': 'هەڵە!',
    },
    'd3xw1g8y': {
      'en': 'Please try again.',
      'ar': 'يرجى المحاولة مرة أخرى.',
      'fa': 'تکایە دووبارە هەوڵبدە.',
    },
    'dtoom1e5': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // TrackOrderOnMap
  {
    'g03v8in6': {
      'en': 'Track Order On Map',
      'ar': 'تتبع الطلب على الخريطة',
      'fa': 'بەدواداچوونی داواکاری لەسەر نەخشە',
    },
    '142z5ypa': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Cart
  {
    'mv0lc2hi': {
      'en': 'Shopping Bag',
      'ar': 'سلة التسوق',
      'fa': 'سەبەتەی بازاڕیکردن',
    },
    'b8xjdsfc': {
      'en': 'Cart Is Empty!',
      'ar': 'عربة التسوق فارغة!',
      'fa': 'سەبەتەکەت بەتاڵە!',
    },
    'kd0mpdxu': {
      'en': 'Your cart is empty try to add products to your cart.',
      'ar': 'عربة التسوق فارغة، حاول إضافة منتجات.',
      'fa':
          'سەبەتەی بازاڕیکردنت بەتاڵە هەوڵبدە کاڵا زیاد بکەیتە ناو سەبەتەکەت.',
    },
    'vd9zn8fs': {
      'en': 'Total',
      'ar': '',
      'fa': '',
    },
    'amcff748': {
      'en': 'CHECKOUT',
      'ar': '',
      'fa': '',
    },
    'dpqix3gq': {
      'en': '',
      'ar': 'الدفع',
      'fa': 'پارەدان',
    },
    'n8aagpr3': {
      'en': 'Insufficient cart sum!',
      'ar': 'مبلغ العربة غير كاف!',
      'fa': 'کۆی عەرەبانە بەس نییە!',
    },
    '2aauu3sh': {
      'en': 'The cart sum cannot be less than the minimum amount.',
      'ar': 'لا يمكن أن يكون مبلغ الشراء أقل من الحد الأدنى للمبلغ.',
      'fa': 'کۆی سەبەتە ناتوانێت لە کەمترین بڕی کەمتر بێت.',
    },
    '0ad21nz4': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Checkout
  {
    '2lsmrcs6': {
      'en': 'Warning!',
      'ar': 'تحذير!',
      'fa': 'ئاگاداری!',
    },
    'l4rooo56': {
      'en': 'You want to cancel this order? ',
      'ar': 'هل تريد إلغاء هذا الطلب؟',
      'fa': 'دەتەوێت ئەم داواکاریە هەڵبوەشێنیتەوە؟',
    },
    'mse50phj': {
      'en': 'Yes, Cancel',
      'ar': 'نعم، إلغاء',
      'fa': 'بەڵێ،هەڵوەشاندنەوە',
    },
    '3pd5h8pm': {
      'en': 'CHECKOUT',
      'ar': 'الدفع',
      'fa': 'پارەدان',
    },
    'zetkh747': {
      'en': 'You’re buying ',
      'ar': '',
      'fa': '',
    },
    'u375a2u4': {
      'en': 'Delivery Address',
      'ar': 'الفاتورە و عنوان التوصیل',
      'fa': 'پسولەکردن و ناونیشانی ناردن',
    },
    'e8ptayyf': {
      'en': 'Change / Add New',
      'ar': 'تغيير / إضافة جديد',
      'fa': 'گۆڕین / زیادکردنی نوێ',
    },
    'zk91df73': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع',
      'fa': 'جۆری پارەدان',
    },
    '4gplc6gd': {
      'en': 'Cost',
      'ar': 'التكلفة',
      'fa': 'تێچوو',
    },
    'i3dz3t4g': {
      'en': 'Products Price',
      'ar': 'سعر المنتجات',
      'fa': 'نرخی بەرهەمەکان',
    },
    'qubhbma1': {
      'en': 'Shipping Fees',
      'ar': 'رسوم التوصيل',
      'fa': 'کرێی گەیاندن',
    },
    'xm9edubi': {
      'en': 'Total',
      'ar': 'الإجمالي',
      'fa': 'کۆی گشتی',
    },
    'v0wvsjkk': {
      'en': 'Add Coupon Code',
      'ar': 'أضف رمز القسيمة',
      'fa': 'کۆدی کۆبۆن زیادبکە',
    },
    '9cbl9cmi': {
      'en': 'Confirm Order',
      'ar': 'تأكيد الطلب',
      'fa': 'دڵنیابوونەوە لە داواکاری',
    },
    '5374bxgy': {
      'en': 'No address!',
      'ar': 'لا يوجد عنوان!',
      'fa': 'بێ ناونیشان!',
    },
    '5n660yy3': {
      'en': 'You should select a shipping address.',
      'ar': 'يرجى تحديد عنوان التوصيل.',
      'fa': 'پێویستە ناونیشانی ناردن هەڵبژێریت.',
    },
    'a5bo9q99': {
      'en': 'Sorry!',
      'ar': 'نعتذر!',
      'fa': 'ببورە!',
    },
    'zax5th2r': {
      'en': 'Wallet amount is less than the order total.',
      'ar': 'رصيد المحفظة أقل من إجمالي الطلب.',
      'fa': 'بڕی ناو جزدان کەمترە لە کۆی گشتی داواکاریەکە.',
    },
    'riemyto1': {
      'en': 'Sorry!',
      'ar': 'نعتذر!',
      'fa': 'ببورە!',
    },
    '772tgoe3': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
    'vx5r4aub': {
      'en': 'No address!',
      'ar': 'لا يوجد عنوان!',
      'fa': 'بێ ناونیشان!',
    },
    'vebm2tsp': {
      'en': 'You should select a shipping address.',
      'ar': 'يرجى تحديد عنوان التوصيل.',
      'fa': 'پێویستە ناونیشانی گەیاندن هەڵبژێریت.',
    },
    'gha3bzgd': {
      'en': 'Error fetching delivery details!',
      'ar': 'خطأ في استرداد تفاصيل التسليم!',
      'fa': 'هەڵە لە هێنانی وردەکاریەکانی گەیاندن!',
    },
    'tmhl22xk': {
      'en': 'Error fetching delivery details!',
      'ar': 'خطأ في استرداد تفاصيل التسليم!',
      'fa': 'هەڵە لە هێنانی وردەکاریەکانی گەیاندن!',
    },
  },
  // OrderConfirmation
  {
    'nkh5xo81': {
      'en': 'Order Successful',
      'ar': 'تم الطلب بنجاح',
      'fa': 'داواکاریەکە سەرکەوتوو بوو',
    },
    'fmwk5en9': {
      'en':
          'Your order has been successful. Track your order from your orders history page',
      'ar':
          'لقد تم تنفيذ طلبك بنجاح. يمكنك تتبع طلبك من صفحة سجل الطلبات الخاصة بك',
      'fa':
          'داواکاریەکەت سەرکەوتوو بوو، دەتوانی بەدواداچوونی داواکاریەکەت بکەی لە پەڕەی داواکاریەکانت',
    },
    '8vgx1iqj': {
      'en': 'Order ID: ',
      'ar': 'رقم الطلب:',
      'fa': 'ژمارەی داواکاری:',
    },
    '44evm9tq': {
      'en': 'Track Details',
      'ar': 'تفاصيل التتبع',
      'fa': 'وردەکاریەکانی ڕێگا',
    },
    'r9x0znfi': {
      'en': 'Continue Shopping',
      'ar': 'واصل التسوق',
      'fa': 'بەردەوام بە لە بازاڕیکردن',
    },
    '074df2tf': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // zenbil
  {
    '033rwxmc': {
      'en': 'Men',
      'ar': 'رجالي',
      'fa': 'پیاوان',
    },
    'oibnflf2': {
      'en': 'Women',
      'ar': 'نسائي',
      'fa': 'ئافرەتان',
    },
    'mfu72il2': {
      'en': 'Stars',
      'ar': 'النجوم',
      'fa': 'ئەستێرەکان',
    },
    '24e6d594': {
      'en': 'Men',
      'ar': 'رجالي',
      'fa': 'پیاوان',
    },
    'd1vjcn7u': {
      'en': 'Women',
      'ar': 'نسائي',
      'fa': 'ئافرەتان',
    },
    '3t0fwcyu': {
      'en': 'See All',
      'ar': 'عرض الکل',
      'fa': 'پیشاندانی هەمووی',
    },
    '7dbwetzu': {
      'en': 'Brands',
      'ar': 'العلامات التجارية',
      'fa': 'بڕاندەکان',
    },
    'xa42l19t': {
      'en': 'See All',
      'ar': 'عرض الکل',
      'fa': 'پیشاندانی هەمووی',
    },
    'p3fjqw7b': {
      'en': 'Most Popular',
      'ar': 'الأكثر شهرة',
      'fa': 'بەناوبانگترین',
    },
    'v7qqd2pj': {
      'en': 'See All',
      'ar': 'عرض الکل',
      'fa': 'پیشاندانی هەمووی',
    },
    'q2sbun81': {
      'en': 'Highest Reviews',
      'ar': 'الأعلى تقييما',
      'fa': 'بەرزترین هەڵسەنگاندن',
    },
    'ahwsve40': {
      'en': 'See All',
      'ar': 'عرض الکل',
      'fa': 'پیشاندانی هەمووی',
    },
    'gg46154e': {
      'en': 'Hot Sales',
      'ar': 'الأكثر مبيعاً',
      'fa': 'پڕ فرۆشترین',
    },
    'cxpwi9dt': {
      'en': 'See All',
      'ar': 'عرض الکل',
      'fa': 'پیشاندانی هەمووی',
    },
    'chwhgv7e': {
      'en': 'Categories',
      'ar': 'فئات',
      'fa': 'جۆرەکان',
    },
    'a7326y4y': {
      'en': 'See All',
      'ar': 'عرض الکل',
      'fa': 'پیشاندانی هەمووی',
    },
    'iqcmjes6': {
      'en': 'Trending Now',
      'ar': 'الرائج الآن',
      'fa': 'ترێندی ئێستا',
    },
    'm53k5l6u': {
      'en': 'See All',
      'ar': 'عرض الکل',
      'fa': 'پیشاندانی هەمووی',
    },
    'goehe4sk': {
      'en': 'Stores',
      'ar': 'المتاجر',
      'fa': 'فرۆشگاکان',
    },
    'i4x9uaem': {
      'en': 'See All',
      'ar': 'عرض الکل',
      'fa': 'پیشاندانی هەمووی',
    },
    '4cfi842k': {
      'en': 'No favorites yet!',
      'ar': 'لا مفضلة حتى الآن!',
      'fa': 'تا وەکو ئێستا هیچ دڵخوازێکت نییە!',
    },
    '4tdvzv32': {
      'en': 'You can add a favorite product to see it in this list.',
      'ar': 'يمكنك إضافة منتجك المفضل لرؤيته في هذه القائمة.',
      'fa': 'دەتوانی بەرهەمی دڵخوازت زیاد بکەی بۆ ئەوەی لەم لیستە بیبینیت.',
    },
    'x77zbmat': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Notification
  {
    'b8sn8ca5': {
      'en': 'Notification',
      'ar': 'إشعار',
      'fa': 'ئاگادارکردنەوە',
    },
    'nnue2exs': {
      'en': 'Order Arrived',
      'ar': 'تم وصول الطلب',
      'fa': 'داواکاریەکەت گەیشت',
    },
    'g8rbgpue': {
      'en': '12:35 PM',
      'ar': '12:35 ظهرا',
      'fa': '12:35 دوای نیوەڕۆ',
    },
    'xn8fkyok': {
      'en': 'Order ',
      'ar': 'الطلب',
      'fa': 'داواکاری',
    },
    'k33dgzxw': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    's48jc5cz': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم اكتمال الطلب ووصله إلى العنوان المطلوب.',
      'fa': 'تەواو بووە و گەیشتە ناونیشانی مەبەست.',
    },
    'qvkyshek': {
      'en': 'Order Success',
      'ar': 'تم الطلب بنجاح',
      'fa': 'داواکاریەکە سەرکەوتوو بوو',
    },
    'li0tple2': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دوێنێ',
    },
    '2z6ex4cw': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'داواکاری',
    },
    'c5klnszd': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    'xez6e77e': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم اكتمال الطلب ووصله إلى العنوان المطلوب.',
      'fa': 'تەواو بووە و گەیشتە ناونیشانی مەبەست.',
    },
    '15m0ivok': {
      'en': 'Order Success',
      'ar': 'تم الطلب بنجاح',
      'fa': 'بە سەرکەوتوویی داواکرا',
    },
    'gnhmvvkn': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دوێنێ',
    },
    '3tuji3vz': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'داواکاری',
    },
    '0cjkvt7c': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    '6lka32cy': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم إكمال الطلب ووصوله إلى العنوان المحدد.',
      'fa': 'تەواو بووە و گەیشتە ناونیشانی مەبەست.',
    },
    'isi3y06r': {
      'en': 'Order Success',
      'ar': 'تم الطلب بنجاح',
      'fa': 'بە سەرکەوتوویی داواکرا',
    },
    'a19a4w2a': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دوێنێ',
    },
    'vzzie027': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'داواکاری',
    },
    'n8czi5ua': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    'fxd370mi': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم إكمال الطلب ووصوله إلى العنوان المحدد.',
      'fa': 'تەواو بووە و گەیشتە ناونیشانی مەبەست.',
    },
    'tar32od1': {
      'en': 'Order Success',
      'ar': 'تم الطلب بنجاح',
      'fa': 'بە سەرکەوتوویی داواکرا',
    },
    '2o02rudu': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دوێنێ',
    },
    'y5mfa1kk': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'داواکاری',
    },
    '43iegqb9': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    'w3k1aigs': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم إكمال الطلب ووصوله إلى العنوان المحدد.',
      'fa': 'تەواو بووە و گەیشتە ناونیشانی مەبەست.',
    },
    'ntqpq1za': {
      'en': 'Order Success',
      'ar': 'تم الطلب بنجاح',
      'fa': 'بە سەرکەوتوویی داواکرا',
    },
    'c4c3vvrf': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دوێنێ',
    },
    'upag28i2': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'داواکاری',
    },
    'c1uyhcs8': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    'tuplg6d9': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم إكمال الطلب ووصوله إلى العنوان المحدد.',
      'fa': 'تەواو بووە و گەیشتە ناونیشانی مەبەست.',
    },
    'cglze0f7': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Support
  {
    'ghrdztql': {
      'en': 'Support',
      'ar': 'الدعم',
      'fa': 'پشتگیری',
    },
    'gu6cr867': {
      'en':
          'There is no active conversation! Make sure you signup so you can start a conversation.',
      'ar': 'لا توجد محادثة نشطة! تأكد من التسجيل حتى تتمكن من بدء محادثة.',
      'fa':
          'هیچ گفتوگۆیەکی چالاک نییە! دڵنیابە لەوەی خۆت تۆمار بکەیت بۆ ئەوەی بتوانیت گفتوگۆیەک دەست پێبکەیت.',
    },
    'r1uu4uis': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Chat
  {
    'dsb5qb40': {
      'en': 'Hi! ',
      'ar': 'أهلاً!',
      'fa': 'سڵاو!',
    },
    'ktbr6wvv': {
      'en': 'Start your conversation.',
      'ar': 'ابدأ محادثتك.',
      'fa': 'دەست بە گفتوگۆ بکە',
    },
    '3s9nyko1': {
      'en': 'Conversation ended by the user.',
      'ar': 'تم إنهاء المحادثة بواسطة المستخدم.',
      'fa': 'گفتوگۆ کۆتایی پێهێندرا لەلایەن بەکارهێنەر.',
    },
    '5wf04d7v': {
      'en': 'Conversation ended by the support person.',
      'ar': 'تم إنهاء المحادثة بواسطة موظف الدعم',
      'fa': 'گفتوگۆ کۆتایی پێهێندرا لەلایەن کارمەندی پشتگیریکەر',
    },
    '6me1kzdh': {
      'en': 'Start Typing ...',
      'ar': 'ابدأ الكتابة...',
      'fa': 'دەست بە نووسین بکە...',
    },
    'sisemz6x': {
      'en': 'Uploading ...',
      'ar': 'جاري التحميل ...',
      'fa': 'ئەپلۆد کردن...',
    },
    '2iw1udr8': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // SearchFocus
  {
    '9duhaqee': {
      'en': 'Search Focus',
      'ar': 'بحث مركز',
      'fa': 'گەڕانێکی وردبین',
    },
    '8ekt8hmf': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'i2ohjb4y': {
      'en': 'Search',
      'ar': 'بحث',
      'fa': 'گەڕان',
    },
    'l0tv97n0': {
      'en': 'Recent Search History',
      'ar': 'تاريخ البحث الأخير',
      'fa': 'گەڕانی ئەم دواییانە',
    },
    '2yams9gm': {
      'en': 'Mikasa Volleyball',
      'ar': 'كرة طائرة ميكاسا',
      'fa': 'تۆپی بالەی میکاسا',
    },
    'jtp1ewrd': {
      'en': 'Sneakers',
      'ar': 'أحذية رياضية',
      'fa': 'پێڵاوی وەرزشی',
    },
    '0rkpw2d9': {
      'en': 'Iphone 12 Pro Max',
      'ar': 'ايفون 12 برو ماكس',
      'fa': 'ئایفۆن 12 پرۆ ماکس',
    },
    'ixolnsg2': {
      'en': 'Wacom Tablet',
      'ar': 'جهاز واكوم اللوحي',
      'fa': 'تابلێتی واکۆم',
    },
    'zkbzyso8': {
      'en': 'Macbook',
      'ar': 'ماك بوك',
      'fa': 'ماك بوك',
    },
    '2s2bppks': {
      'en': 'Trending Search',
      'ar': 'الأكثر بحثا',
      'fa': 'گەڕانی ترێند',
    },
    '0iknrlgx': {
      'en': 'Mikasa Volleyball',
      'ar': 'كرة طائرة ميكاسا',
      'fa': 'تۆپی بالەی میکاسا',
    },
    'ocrnidit': {
      'en': 'Sneakers',
      'ar': 'أحذية رياضية',
      'fa': 'پێڵاوی وەرزشی',
    },
    '13fm5ub0': {
      'en': 'Iphone 12 Pro Max',
      'ar': 'ايفون 12 برو ماكس',
      'fa': 'ئایفۆن 12 پرۆ ماکس',
    },
    'mwntkva4': {
      'en': 'Wacom Tablet',
      'ar': 'جهاز واكوم اللوحي',
      'fa': 'تابلێتی واکۆم',
    },
    'qy8gl0bq': {
      'en': 'Macbook',
      'ar': 'ماك بوك',
      'fa': 'ماك بوك',
    },
    'zeefixz4': {
      'en': 'Categories',
      'ar': 'الفئات',
      'fa': 'جۆرەکان',
    },
    'g6hjh0t6': {
      'en': 'Mikasa Volleyball',
      'ar': 'كرة طائرة ميكاسا',
      'fa': 'تۆپی بالەی میکاسا',
    },
    'x9ub1thu': {
      'en': 'Sneakers',
      'ar': 'أحذية رياضية',
      'fa': 'پێڵاوی وەرزشی',
    },
    'qkr5enxo': {
      'en': 'Iphone 12 Pro Max',
      'ar': 'ايفون 12 برو ماكس',
      'fa': 'ئایفۆن 12 پرۆ ماکس',
    },
    'xht3im48': {
      'en': 'Wacom Tablet',
      'ar': 'جهاز واكوم اللوحي',
      'fa': 'تابلێتی واکۆم',
    },
    '5qcpt11i': {
      'en': 'Macbook',
      'ar': 'ماك بوك',
      'fa': 'ماك بوك',
    },
    '7mvkyyqd': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Search
  {
    '3aze63c9': {
      'en': 'Search',
      'ar': 'بحث',
      'fa': 'گەڕان',
    },
    '97qd905t': {
      'en': 'Sorry.',
      'ar': 'نعتذر',
      'fa': 'ببورە',
    },
    't277na8q': {
      'en': 'Your search has no results!',
      'ar': 'لا توجد نتائج لبحثك!',
      'fa': 'گەڕانەکەت هیچ ئەنجامێکی نەبوو!',
    },
    'hzf0rkv7': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // ProductDetail
  {
    '0gfc1ja9': {
      'en': 'Market',
      'ar': 'السوق',
      'fa': 'بازاڕ',
    },
    'rzc0b1q4': {
      'en': 'Color:',
      'ar': 'اللون:',
      'fa': 'ڕەنگ:',
    },
    'khvf3jnc': {
      'en': 'Capacity:',
      'ar': 'السعة:',
      'fa': 'توانا:',
    },
    'uq94dbua': {
      'en': 'Size:',
      'ar': 'المقاس:',
      'fa': 'قەبارە:',
    },
    'gikaaf39': {
      'en': 'Description',
      'ar': 'وصف',
      'fa': 'وه‌سف کردن',
    },
    'qfocognr': {
      'en': 'Reviews',
      'ar': 'المراجعات',
      'fa': 'پێداچوونەوەکان',
    },
    'vigd3obx': {
      'en': 'Return Policy: ',
      'ar': 'سياسة الإرجاع:',
      'fa': 'سیاسەتی گەڕاندنەوە:',
    },
    'f29zkzjt': {
      'en': 'Warranty: ',
      'ar': 'الضمان:',
      'fa': 'گەرەنتی:',
    },
    '5xk4skg2': {
      'en':
          'Fully Automatic Front Load Washing Machines have Great Wash Quality with very less running cost',
      'ar':
          'الغسالات الأوتوماتيكية بالكامل ذات التحميل الأمامي تتميز بجودة غسيل رائعة وتكلفة تشغيل منخفضة',
      'fa':
          'ئامێرەکانی جلشۆردنی ئۆتۆماتیکی کوالیتی شوشتنێکی باشیان هەیە و تێچووی کارکردنیان زۆر کەمترە.',
    },
    'oglekf60': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'fa': 'وردەکاری',
    },
    'ec6wpmyv': {
      'en': 'Brand',
      'ar': 'العلامة التجارية',
      'fa': 'براند',
    },
    'p2b88x52': {
      'en': 'Long Sleeves',
      'ar': 'أكمام طويلة',
      'fa': 'قۆڵ درێژ',
    },
    'lnjo09ib': {
      'en': 'Model Name',
      'ar': 'اسم الموديل',
      'fa': 'ناوی مۆدێل',
    },
    '8v93r4kf': {
      'en': 'WW60R20GLMA/TL',
      'ar': 'WW60R20GLMA/TL',
      'fa': 'WW60R20GLMA/TL',
    },
    'klc4ij4d': {
      'en': 'Function Type',
      'ar': 'نوع الوظيفة',
      'fa': 'جۆری ئەرک',
    },
    'xrf4j8ck': {
      'en': 'Fully Automatic Front',
      'ar': 'أمامية أوتوماتيكية بالكامل',
      'fa': 'پێشەوەی تەواو ئۆتۆماتیک',
    },
    '5k7joq9l': {
      'en': 'Enerjgy Rating',
      'ar': 'تقييم الطاقة',
      'fa': 'هەڵسەنگاندنی وزە',
    },
    'dhlza4zf': {
      'en': '5',
      'ar': '5',
      'fa': '5',
    },
    'i4o31blr': {
      'en': 'Washing Capacity',
      'ar': 'سعة الغسيل',
      'fa': 'توانای شوشتن',
    },
    '0u9u34v8': {
      'en': '6 kg',
      'ar': '6 كجم',
      'fa': '6 کیلۆگرام',
    },
    '6g1mb4no': {
      'en': 'Washing Method',
      'ar': 'طريقة الغسيل',
      'fa': 'شێوازی شوشتن',
    },
    '45qg3ty9': {
      'en': 'Tumble',
      'ar': 'تقليب',
      'fa': 'کەوتن',
    },
    'bxquf0fm': {
      'en': 'Color',
      'ar': 'اللون',
      'fa': 'رەنگ',
    },
    'svrfh56f': {
      'en': 'White',
      'ar': 'أبيض',
      'fa': 'سپی',
    },
    'usmawiyi': {
      'en': 'Water Level Selector',
      'ar': 'محدد مستوى المياه',
      'fa': 'دیاریکەری ئاستی ئاو',
    },
    'agl10mr3': {
      'en': 'Regular',
      'ar': 'عادي',
      'fa': 'ئاسایی',
    },
    '4698k8sv': {
      'en': 'Shade',
      'ar': 'الظل',
      'fa': 'سێبەر',
    },
    'ncgixqeg': {
      'en': 'White',
      'ar': 'أبيض',
      'fa': 'سپی',
    },
    'baydwfvr': {
      'en': 'Technology Used',
      'ar': 'التكنولوجيا المستخدمة',
      'fa': 'تەکنەلۆژیای بەکارهێنراو',
    },
    'gtgwndlo': {
      'en': 'Yes',
      'ar': 'نعم',
      'fa': 'بەڵێ',
    },
    'j08zo9wl': {
      'en': 'In-built Heater\n',
      'ar': 'سخان مدمج',
      'fa': 'گەرمکەرەوەی ناوەکی',
    },
    'ihlc05p9': {
      'en': 'Digital Inverter',
      'ar': 'العاكس الرقمي',
      'fa': 'ئینڤێرتەری دیجیتاڵ',
    },
    'jicswwsm': {
      'en': 'Warranty Summary',
      'ar': 'ملخص الضمان',
      'fa': 'پوختەی گەرەنتی',
    },
    'qv24etj2': {
      'en': '3 Years ',
      'ar': '3 سنوات',
      'fa': '3 سال',
    },
    '6cnzoi11': {
      'en': 'Ratings & Reviews',
      'ar': 'التقييمات والمراجعات',
      'fa': 'هەڵسەنگاندن و پێداچوونەوە',
    },
    'j71dc4xr': {
      'en': 'View All',
      'ar': 'عرض الكل',
      'fa': 'پیشاندانی هەمووی',
    },
    'c3mufbxj': {
      'en': 'Leave a Review',
      'ar': 'اترك مراجعة',
      'fa': 'پێداچوونەوەیەک جێبهێڵە',
    },
    'mlcpxoet': {
      'en': 'Most Helpful',
      'ar': 'الأكثر إفادة',
      'fa': 'یارمەتی زیاتر',
    },
    'o67vbor8': {
      'en': 'Only with photos',
      'ar': 'بالصور فقط',
      'fa': 'تەنها بە وێنە',
    },
    'tf1zvz8y': {
      'en': 'Related Products',
      'ar': 'المنتجات ذات الصلة',
      'fa': 'بەرهەمە پەیوەندیدارەکان',
    },
    'op1qfm50': {
      'en': 'Suggested Advertised Products',
      'ar': 'المنتجات المقترحة',
      'fa': 'پێشنیاری بەرهەمە ڕیکلامکراوەکان',
    },
    'nqjp0yn7': {
      'en': 'ADD TO CART',
      'ar': 'أضف إلى السلة',
      'fa': 'زیاد بکە بۆ سەبەتە',
    },
    'foifxxua': {
      'en': 'Added!',
      'ar': 'تمت الإضافة!',
      'fa': 'زیاد کرا!',
    },
    'o90l5rna': {
      'en': 'Product is added to your cart.',
      'ar': 'تمت إضافة المنتج إلى سلة التسوق الخاصة بك.',
      'fa': 'بەرهەمەکە زیاد کرا بۆ ناو سەبەتەکەت',
    },
    'm101tp79': {
      'en': 'Sold Out',
      'ar': 'نفذ',
      'fa': 'بەردەست نییە',
    },
    '5t98199s': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // RatingsReviews
  {
    '91nvl6ii': {
      'en': 'Ratings & Reviews',
      'ar': 'التقييمات والمراجعات',
      'fa': 'هەڵسەنگاندن و پێداچوونەوە',
    },
    'qldrbdrx': {
      'en': 'Ratings & Reviews',
      'ar': 'التقييمات والمراجعات',
      'fa': 'هەڵسەنگاندن و پێداچوونەوە',
    },
    '1q1dii4w': {
      'en': 'Leave a Review',
      'ar': 'اترك مراجعة',
      'fa': 'سەرنجێک جێبهێڵە',
    },
    'h3bjl2p8': {
      'en': 'Most Helpful',
      'ar': 'الأكثر إفادة',
      'fa': 'یارمەتی زیاتر',
    },
    'vx64qejh': {
      'en': 'Only with photos',
      'ar': ' بالصور فقط',
      'fa': 'تەنها بە وێنە',
    },
    'tj6c0jj3': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // FeedBack
  {
    'vnpdlvgq': {
      'en': 'Feedback',
      'ar': 'تعليق',
      'fa': 'ڕاوبۆچوون',
    },
    'q9x664uf': {
      'en': 'Title',
      'ar': 'العنوان',
      'fa': 'ناونیشان',
    },
    'bn2gylam': {
      'en': 'Comment',
      'ar': 'تعليق',
      'fa': 'سەرنج',
    },
    'q1y44iv0': {
      'en': 'SUBMIT',
      'ar': 'إرسال',
      'fa': 'ناردن',
    },
    '1ji41nml': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // EditProfile
  {
    'aghmmphc': {
      'en': 'Complete Profile',
      'ar': 'أكمل الملف الشخصي',
      'fa': 'تەواوکردنی پڕۆفایل',
    },
    'xuzdev7z': {
      'en': 'Name',
      'ar': 'اسم',
      'fa': 'ناو',
    },
    'd0yu0gjn': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
      'fa': 'ناوی کۆتایی',
    },
    'x9hi2ojh': {
      'en': 'Choice a unique user name',
      'ar': 'اختيار اسم مستخدم فريد',
      'fa': 'ناوێکی بەکارهێنەری بێهاوتا هەڵبژێرە',
    },
    'i0eq9vvx': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
      'fa': 'ناوی بەکارهێنەر',
    },
    '1oe2sfmb': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
      'fa': 'ئیمەیڵ',
    },
    'tq3kjp0d': {
      'en': 'Phone Number',
      'ar': 'رقم الهاتف',
      'fa': 'ژمارەی مۆبایل',
    },
    '1khd2tqz': {
      'en': 'Male',
      'ar': 'ذكر',
      'fa': 'نێر',
    },
    '1abex2l6': {
      'en': 'Female',
      'ar': 'أنثى',
      'fa': 'مێ',
    },
    'o36g9br7': {
      'en': 'Other',
      'ar': 'آخر',
      'fa': 'هی تر',
    },
    'ikemzyoy': {
      'en': 'Gender',
      'ar': 'جنس',
      'fa': 'ڕەگەز',
    },
    'kggn9sqc': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'fa': 'بەدوای کاڵایەکدا بگەڕێ ...',
    },
    'ebucavkd': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'lpvnq0yo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەم هەڵبژاردنانەی خوارەوە هەڵبژێرە',
    },
    'uuyszii6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '7ovttnja': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەم هەڵبژاردنانەی خوارەوە هەڵبژێرە',
    },
    'hm32un01': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    't7edyw5o': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەم هەڵبژاردنانەی خوارەوە هەڵبژێرە',
    },
    'l0bhqdac': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'urydlm9c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەم هەڵبژاردنانەی خوارەوە هەڵبژێرە',
    },
    '8fic2o7v': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'yp748kxg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەم هەڵبژاردنانەی خوارەوە هەڵبژێرە',
    },
    'rkb5jiq8': {
      'en': 'Update',
      'ar': 'تحديث',
      'fa': 'نوێکردنەوە',
    },
    'mxep9fl0': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // HelpCenter
  {
    'ib99zku6': {
      'en': 'Help Center',
      'ar': 'مركز الدعم',
      'fa': 'ناوەندی یارمەتی',
    },
    '7qb69jdl': {
      'en': 'FAQ',
      'ar': 'الأسئلة الشائعة',
      'fa': 'پرسیارە دووبارە کراوەکان',
    },
    'xzcg6pae': {
      'en': 'General Support Tips',
      'ar': 'نصائح الدعم العامة',
      'fa': 'ئامۆژگاری پشتگیری گشتی',
    },
    '8wbz05yl': {
      'en': 'Refudn policy',
      'ar': 'سياسة الإرجاع',
      'fa': 'سیاسەتی گەڕاندنەوە',
    },
    'rjkv8qr9': {
      'en': 'Starting to buy',
      'ar': 'بدء الشراء',
      'fa': 'دەستکردن بە کڕین',
    },
    'tzdtm550': {
      'en': 'How to get help',
      'ar': 'كيفية الحصول على المساعدة',
      'fa': 'چۆنیەتی بەدەستهێنانی هاوکاری',
    },
    'vlpij65p': {
      'en': 'General Support Tips',
      'ar': 'نصائح الدعم العامة',
      'fa': 'ئامۆژگاری پشتگیری گشتی',
    },
    'wp0p4rpy': {
      'en': 'Which post service?',
      'ar': 'أي خدمة بريدية؟',
      'fa': 'کام خزمەتگوزاری پۆست؟',
    },
    'ffyttx1t': {
      'en': 'Contact Us',
      'ar': 'تواصل معنا',
      'fa': 'پەیوەندیمان پێوەبکە',
    },
    '79065lw6': {
      'en': 'Customer Service',
      'ar': 'خدمة العملاء',
      'fa': 'خزمەتگوزاری کڕیار',
    },
    'op8p10bo': {
      'en': 'Support',
      'ar': 'الدعم',
      'fa': 'پشتگیری',
    },
    'n34m6h75': {
      'en': 'Contact Us',
      'ar': 'تواصل معنا',
      'fa': 'پەیوەندیمان پێوە بکە',
    },
    'hos00pka': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // ShippingMethod
  {
    '8vl05jsx': {
      'en': 'Shipping Method',
      'ar': 'طريقة التوصيل',
      'fa': 'شێوازی گەیاندن',
    },
    'rq6kb5jr': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Orders
  {
    'oohpqxee': {
      'en': 'My Orders',
      'ar': 'طلباتي',
      'fa': 'داواکاریەکانم',
    },
    'a18t5x6y': {
      'en': 'InProgress',
      'ar': 'قيد التنفيذ',
      'fa': 'لە جێبەجێکردندایە',
    },
    'nrk4lzax': {
      'en': 'Completed',
      'ar': 'مكتمل',
      'fa': 'تەواو بوو',
    },
    'yy21d6mh': {
      'en': 'Canceled',
      'ar': 'تم الإلغاء',
      'fa': 'هەڵوەشێندرایەوە',
    },
    '5hqcid9i': {
      'en': 'All',
      'ar': 'الجميع',
      'fa': 'هەمووی',
    },
    '91ghekgh': {
      'en': 'You don\'t have any order yet.',
      'ar': 'ليس لديك أي طلب حتى الآن.',
      'fa': 'تا وەکو ئێستا هیچ داواکاریەکت نییە',
    },
    'sp5fp2w1': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Privacy
  {
    '6f5zrc1r': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fa': 'ڕێکاری تایبەتمەندێتی',
    },
    'c297fxx7': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Language
  {
    'nkldex0c': {
      'en': 'Language',
      'ar': 'اللغة',
      'fa': 'زمان',
    },
    'xs49x655': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // NotificatinSetting
  {
    'j5zsc19a': {
      'en': 'Notificatin Setting',
      'ar': 'إعدادات الإشعارات',
      'fa': 'چاککردنی ئاگادارکردنەوەکان',
    },
    'lyi4kt6m': {
      'en': 'Configure Notification',
      'ar': 'تهيئه الإشعارات',
      'fa': 'ڕێکخستنی ئاگادارکردنەوەکان',
    },
    'aposu1ca': {
      'en': 'General Notification',
      'ar': 'إشعار عام',
      'fa': 'ئاگادارکردنەوەی گشتی',
    },
    '7pzq3iyf': {
      'en': 'Sound',
      'ar': 'الصوت',
      'fa': 'دەنگ',
    },
    'mvdzo4c6': {
      'en': 'Vibrate',
      'ar': 'الاهتزاز',
      'fa': 'لەرزین',
    },
    'qzqvctc3': {
      'en': 'Special Offers',
      'ar': 'العروض الخاصة',
      'fa': 'ئۆفەری تایبەت',
    },
    'ofvykhy3': {
      'en': 'Promo & Discount',
      'ar': 'العروض والتخفيضات',
      'fa': 'پڕۆمۆ و داشکاندن',
    },
    'vk03u9s6': {
      'en': 'Payments',
      'ar': 'المدفوعات',
      'fa': 'پارەدانەکان',
    },
    'yqi66vx7': {
      'en': 'Cashback',
      'ar': 'استرداد  الأموال',
      'fa': 'پارە گەڕاندنەوە',
    },
    'lycjf659': {
      'en': 'App Updates',
      'ar': 'تحديثات التطبيق',
      'fa': 'نوێکردنەوەکانی ئەپڵیکەیشن',
    },
    '0di9hgf2': {
      'en': 'New Service Available',
      'ar': 'خدمة جديدة متاحة',
      'fa': 'خزمەتگوزاری نوێ بەردەستە',
    },
    '9i0d2ayc': {
      'en': 'New Tips Available',
      'ar': 'نصائح جديدة متاحة',
      'fa': 'ئامۆژگاری نوێ بەردەستە',
    },
    'frslwo8x': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Setting
  {
    'akr23z23': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fa': 'چوونە ژوورەوە',
    },
    'k63e1xs9': {
      'en': 'Signup',
      'ar': 'إنشاء حساب',
      'fa': 'تۆمارکردن',
    },
    '4qjpya8h': {
      'en': 'Customer Support',
      'ar': 'دعم العملاء',
      'fa': 'پشتیوانی کڕیار',
    },
    'lv7ivg2j': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fa': 'دەستکاریکردنی پڕۆفایل',
    },
    '0u3lq928': {
      'en': 'Orders',
      'ar': 'الطلبات',
      'fa': 'داواکاریەکان',
    },
    'gjyxrm8i': {
      'en': 'Manage Address',
      'ar': 'إدارة العناوين',
      'fa': 'بەڕێوەبردنی ناونیشان',
    },
    'm857msi9': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'fa': 'شێوازەکانی پارەدان',
    },
    '8ne2iv94': {
      'en': 'Shipping Methods',
      'ar': 'طرق التوصيل',
      'fa': 'شێوازەکانی گەیاندن',
    },
    'ane006qe': {
      'en': 'Notification Setting',
      'ar': 'إعدادات الإشعارات',
      'fa': 'چاککردنی ئاگادارکردنەوەکان',
    },
    '9nyt7q34': {
      'en': 'Country',
      'ar': 'دولة',
      'fa': 'وڵات',
    },
    'nks8i0bm': {
      'en': 'Language',
      'ar': 'اللغة',
      'fa': 'زمان',
    },
    'm12vb62i': {
      'en': 'English (US)',
      'ar': 'الإنجليزية (الولايات المتحدة)',
      'fa': 'ئینگلیزی (ویلایەتە یەکگرتووەکان)',
    },
    'swdcz12e': {
      'en': 'Dark Mode',
      'ar': 'الوضع الليلي',
      'fa': 'دۆخی تاریک',
    },
    'dq2nu91h': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fa': 'ڕێکاری تایبەتمەندێتی',
    },
    'wqoya4id': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'fa': 'ناوەندی یارمەتی',
    },
    'qe65e7nb': {
      'en': 'Share With Friends',
      'ar': 'شارك مع الأصدقاء',
      'fa': 'لەگەڵ هاوڕێکانت بەش بکە',
    },
    'now4ob1r': {
      'en': 'Follow us on ',
      'ar': 'تابعنا على',
      'fa': 'فۆڵۆومان بکە لە',
    },
    'jjlx0njo': {
      'en': 'Delete Account',
      'ar': 'حذف الحساب',
      'fa': 'سڕینەوەی ئەکاونت',
    },
    'pkkl1lnu': {
      'en': 'Warning!',
      'ar': 'تحذير!',
      'fa': 'ئاگادار کردنەوە!',
    },
    'hzotb4db': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
      'fa': 'چوونە دەرەوە',
    },
    '80oqv6lu': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // OrderDetails
  {
    '6g5fb2pg': {
      'en': 'Order Details',
      'ar': 'تفاصيل الطلب',
      'fa': 'وردەکاری داواکاری',
    },
    'uenoxwok': {
      'en': 'Contact',
      'ar': 'الاتصال',
      'fa': 'پەیوەندی پێوەکردن',
    },
    '5ilz0fyq': {
      'en': 'Products Price',
      'ar': 'سعر المنتجات',
      'fa': 'نرخی بەرهەمەکان',
    },
    'efqrqef7': {
      'en': 'Shipping Fees',
      'ar': 'رسوم التوصيل',
      'fa': 'کرێی گەیاندن',
    },
    'ivitb2om': {
      'en': 'Total',
      'ar': 'الإجمالي',
      'fa': 'کۆی گشتی',
    },
    'l3cqkot7': {
      'en': 'Go to Checkout',
      'ar': 'انتقل إلى الخروج',
      'fa': 'بڕۆ بۆ پارەدان',
    },
    'chj7iz7w': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Addresses
  {
    'q9hh6xpf': {
      'en': 'Addresses',
      'ar': 'عناوينك',
      'fa': 'ناونیشانەکانت',
    },
    'dtrsw49q': {
      'en': 'Your addresses',
      'ar': 'عنوانك',
      'fa': 'ناونیشانت',
    },
    '8fuhn301': {
      'en': 'No address!',
      'ar': 'لا توجد عناوين!',
      'fa': 'بێ ناونیشان!',
    },
    'n1y2zzre': {
      'en': 'You can manage your addresses here.',
      'ar': 'يمكنك إدارة عناوينك هنا.',
      'fa': 'دەتوانیت لێرە ناونیشانەکانت بەڕێوە ببەیت.',
    },
    'qllndhzn': {
      'en': 'Add New Address',
      'ar': 'أضف عنوان جديد',
      'fa': 'ناونیشانی نوێ زیادبکە',
    },
    'tg7hv5ts': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Control
  {
    'acaewof4': {
      'en': 'Loading your information...',
      'ar': 'جاري تحميل بياناتك...',
      'fa': 'داتاکانت وەردەگیرێت ...',
    },
    'jdfzeush': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Stores
  {
    'ojx6tkoy': {
      'en': 'Stores',
      'ar': 'المتاجر',
      'fa': 'فرۆشگاکان',
    },
    'r729njxm': {
      'en': 'Brands',
      'ar': 'العلامات التجارية',
      'fa': 'براندەکان',
    },
    '5nczj29i': {
      'en': 'Pages',
      'ar': 'الصفحات',
      'fa': 'پەڕەکان',
    },
    'q2646ayz': {
      'en': 'Sorry!',
      'ar': 'نعتذر!',
      'fa': 'ببورە!',
    },
    'r1893h74': {
      'en': 'There is no available brand in your area!',
      'ar': 'لا توجد علامة تجارية متاحة في منطقتك!',
      'fa': 'براندی بەردەست نییە لە ناوچەکەتدا!',
    },
    '1msumiqx': {
      'en': 'Sorry!',
      'ar': 'نعتذر!',
      'fa': 'ببورە!',
    },
    'm8lzvja7': {
      'en': 'There is no available market in your area!',
      'ar': 'لا يوجد سوق متاح في منطقتك!',
      'fa': 'فرۆشگایەکی بەردەست نییە لە ناوچەکەتدا!',
    },
    'tih1eidp': {
      'en': 'Stores',
      'ar': 'المتاجر',
      'fa': 'فرۆشگا',
    },
    '3jr695bw': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Categories
  {
    'qe6onoo4': {
      'en': 'Categories',
      'ar': 'الفئات',
      'fa': 'جۆرەکان',
    },
    '32agg2q1': {
      'en': 'Sorry!',
      'ar': 'نعتذر!',
      'fa': 'ببورە!',
    },
    '7qzsn9r3': {
      'en': 'There is no available market in your area!',
      'ar': 'لا يوجد سوق متاح في منطقتك!',
      'fa': 'فرۆشگایەکی بەردەست نییە لە ناوچەکەتدا!',
    },
    'ot6vxz23': {
      'en': 'Sorry!',
      'ar': 'نعتذر!',
      'fa': 'ببورە!',
    },
    'ky7uc4i6': {
      'en': 'There is no available market in your area!',
      'ar': 'لا يوجد سوق متاح في منطقتك!',
      'fa': 'فرۆشگایەکی بەردەست نییە لە ناوچەکەتدا!',
    },
    '2skp4dhb': {
      'en': 'Categories',
      'ar': 'الفئات',
      'fa': 'جۆرەکان',
    },
    'mcfm99bz': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Brands
  {
    'koci1n5x': {
      'en': 'Brands',
      'ar': 'العلامات التجارية',
      'fa': 'براندەکان',
    },
    'z6bsloz7': {
      'en': 'Sorry!',
      'ar': 'نعتذر!',
      'fa': 'ببورە!',
    },
    '076dcrmf': {
      'en': 'There is no available market in your area!',
      'ar': 'لا يوجد سوق متاح في منطقتك!',
      'fa': 'فرۆشگایەکی بەردەست نییە لە ناوچەکەتدا!',
    },
    '3d8xd5hr': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Terms
  {
    'i8vngblc': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fa': 'ڕێکاری تایبەتمەندێتی',
    },
    'z55vk7qc': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // ProductsCategory
  {
    'q6exawo9': {
      'en': 'There is no product in this category!',
      'ar': 'لا يوجد منتج في هذه الفئة!',
      'fa': 'هیچ بەرهەمێک لەم جۆرە بەردەست نیی\n!',
    },
    'wd7w9vg1': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Stars
  {
    '1cxeu42f': {
      'en': 'Stars',
      'ar': 'النجوم',
      'fa': 'ئەستێرەکان',
    },
    'k32zbmon': {
      'en': 'Men',
      'ar': 'رجال',
      'fa': 'پیاوان',
    },
    'l504u95w': {
      'en': 'Women',
      'ar': 'نساء',
      'fa': 'ئافرەتان',
    },
    '3ed2ruqb': {
      'en': 'All',
      'ar': 'الجميع',
      'fa': 'هەمووی',
    },
    'zwop1v6n': {
      'en': 'Men',
      'ar': 'رجال',
      'fa': 'پیاوان',
    },
    'niha6r6n': {
      'en': 'Women',
      'ar': 'نحيف',
      'fa': 'ئافرەتان',
    },
    '49mq422u': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // WalletHistory
  {
    'gvyi92ma': {
      'en': 'Wallet History',
      'ar': 'تاريخ المحفظة',
      'fa': 'مێژووی جزدان',
    },
    'l8jworn3': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // StoreFront
  {
    'qeceyuw7': {
      'en': 'There is no product.',
      'ar': 'لا يوجد منتج.',
      'fa': 'هیچ بەرهەمێک نییە.',
    },
    '3ap39mgk': {
      'en': 'There is no product.',
      'ar': 'لا يوجد منتج.',
      'fa': 'هیچ بەرهەمێک نییە.',
    },
    '8yiwqji8': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // DeliveryLogin
  {
    '2leo6ajh': {
      'en': 'Welcome',
      'ar': 'مرحباً',
      'fa': 'بەخێربێیت',
    },
    'yh0al0wx': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
      'fa': 'ئیمەیڵ',
    },
    'nnjrn69i': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fa': 'ژمارەی نهێنی',
    },
    'h34nd8s2': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'fa': 'ژمارە نهێنیەکەت بیرچۆتەوە؟',
    },
    'hwro55hh': {
      'en': 'LOG IN',
      'ar': 'تسجيل الدخول',
      'fa': 'چوونەژوورەوە',
    },
    '3jrxwytl': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '9acbapfe': {
      'en': 'Enter Valid Email!',
      'ar': 'أدخل بريد إلكتروني صحيح!',
      'fa': 'ئیمەیڵی دروست تۆماربکە!',
    },
    'zpggu4ys': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'rjq559m5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'czzba6wx': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'tyg4qv91': {
      'en': 'Don’t have an account? ',
      'ar': 'ليس لديك حساب؟',
      'fa': 'هەژمارت نییە؟',
    },
    'q84jm0aq': {
      'en': 'Register',
      'ar': 'إنشاء حساب',
      'fa': 'تۆمارکردن',
    },
    'vdidpx2l': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // DeliverySignup
  {
    '94w3qzk5': {
      'en': 'Welcome',
      'ar': 'مرحباً',
      'fa': 'بەخێربێیت',
    },
    'b6ku8pdn': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'fa': 'ناوی تەواو',
    },
    '1kthd28o': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
      'fa': 'ئیمەیڵ',
    },
    '7xi2189m': {
      'en': 'Create Password',
      'ar': 'إنشاء كلمة المرور',
      'fa': 'دروستکردنی ژمارە نهێنی نوێ',
    },
    'kodkbhxf': {
      'en': 'By joining you are agree to our ',
      'ar': 'بانضمامك فإنك توافق على',
      'fa': 'بە بەشداریکردن تۆ ڕازی دەبیت بە',
    },
    '37gvpxey': {
      'en': 'Terms of Service ',
      'ar': 'شروط الخدمة',
      'fa': 'مەرجەکانی خزمەتگوزاری',
    },
    'tiho3z55': {
      'en': 'and ',
      'ar': 'و',
      'fa': 'و',
    },
    '9rn0e1ih': {
      'en': 'Privacy Policy.',
      'ar': 'سياسة الخصوصية.',
      'fa': 'ڕێکاری تایبەتمەندێتی.',
    },
    'l8pbxt7r': {
      'en': 'REGISTER',
      'ar': 'تسجيل',
      'fa': 'چوونەژوورەوە',
    },
    '94ps9fri': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'vkp2w354': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    '3jcqa1lt': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'r2h6k7lh': {
      'en': 'Ener Valid Email!',
      'ar': 'أدخل بريد إلكتروني صحيح!',
      'fa': 'ئیمەیڵی دروست تۆماربکە!',
    },
    'ns8s5xpv': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'af3a6em7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'eclsrv56': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'n5w39pwz': {
      'en': 'Have an account? ',
      'ar': 'لديك حساب؟',
      'fa': 'هەژمارت هەیە؟',
    },
    'hus6q8qr': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'fa': 'چوونە ژوورەوە',
    },
    'c6u8jbx9': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // DeliveryHome
  {
    'qsb466fp': {
      'en': 'Available Orders',
      'ar': 'الطلبات المتاحة',
      'fa': 'داواکاری بەردەست',
    },
    'fedj9fib': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
    'tkgejvzj': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // DeliveryHistory
  {
    'xvnf9xur': {
      'en': 'Delivery History',
      'ar': 'تاريخ التوصيل',
      'fa': 'مێژووی گەیاندن',
    },
    'efq32kvm': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // DeliveryAccount
  {
    'uaybgmt2': {
      'en': 'Customer Support',
      'ar': 'دعم العملاء',
      'fa': 'پشتگیری کڕیار',
    },
    'uusmmf1x': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fa': 'ڕێکخستنی پرۆفایل',
    },
    'pyxffg8q': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'fa': 'جۆرەکانی پارەدان',
    },
    '9kc6rtvp': {
      'en': 'Notification Setting',
      'ar': 'إعدادات الإشعارات',
      'fa': 'چاککردنی ئاگادارکردنەوەکان',
    },
    'sn0el9uy': {
      'en': 'Country',
      'ar': 'الدولة',
      'fa': 'وڵات',
    },
    'mgczheqz': {
      'en': 'Language',
      'ar': 'اللغة',
      'fa': 'زمان',
    },
    'g71uj0xb': {
      'en': 'English (US)',
      'ar': 'الإنجليزية (الولايات المتحدة)',
      'fa': 'ئینگلیزی (ویلایەتە یەکگرتووەکان)',
    },
    'vljnxi2b': {
      'en': 'Dark Mode',
      'ar': 'الوضع الليلي',
      'fa': 'دۆخی تاریک',
    },
    'f2eut7i0': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fa': 'ڕێکاری تایبەتمەندێتی',
    },
    'ieilcjqs': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'fa': 'ناوەندی یارمەتی',
    },
    'ta3wf7mr': {
      'en': 'Share With Friends',
      'ar': 'شارك مع الأصدقاء',
      'fa': 'لەگەڵ هاوڕێکانت بەش بکە',
    },
    'xgzeu57x': {
      'en': 'Consumer Application',
      'ar': 'تطبيق المستهلك',
      'fa': 'ئەپڵیکەیشنی بەکاربەر',
    },
    '9ax0bmyv': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
      'fa': 'چوونەدەرەوە',
    },
    'ccve1mpx': {
      'en': 'Account',
      'ar': 'حساب',
      'fa': 'هەژمار',
    },
    'e13xcpjn': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // Favorites
  {
    'lged1lff': {
      'en': 'Favorites',
      'ar': 'المفضلة',
      'fa': 'دڵخوازەکان',
    },
    '8rlv9bsq': {
      'en': 'Your Favorite Products',
      'ar': 'منتجاتك المفضلة',
      'fa': 'بەرهەمە دڵخوازەکانت',
    },
    'hd4yj7a0': {
      'en': 'No favorites yet!',
      'ar': 'لا يوجد مفضلة حتى الآن!',
      'fa': 'تاوەکو ئێستا هیچ دڵخوازێکت نییە!',
    },
    '8m37z2ps': {
      'en': 'You can add a favorite product to see it in this list.',
      'ar': 'يمكنك إضافة منتجك المفضل لرؤيته في هذه القائمة.',
      'fa':
          'دەتوانیت بەرهەمێکی دڵخواز زیاد بکەیت بۆ ئەوەی لەم لیستەدا بیبینیت.',
    },
    'sz4u7bi8': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // ReviewConfirmation
  {
    '682lizt3': {
      'en': 'Review Successful',
      'ar': 'تمت المراجعة بنجاح',
      'fa': 'پێداچوونەوە سەرکەوتوو بوو',
    },
    'ubittld0': {
      'en': 'Thanks for your review!',
      'ar': 'شكرا على تقييمك!',
      'fa': 'سوپاس بۆ پێداچوونەوەکەت!',
    },
    'jntd90tm': {
      'en': 'Back to Product Page',
      'ar': 'العودة لصفحة المنتج',
      'fa': 'گەڕانەوە بۆ پەڕەی بەرهەمەکان',
    },
    'ze6cs842': {
      'en': 'Go to Homepage',
      'ar': 'انتقل إلى الصفحة الرئيسية',
      'fa': 'گەڕانەوە بۆ پەڕەی سەرەکی',
    },
    '9j34h6cb': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // SuccessfulPayment
  {
    'kgrz3v9j': {
      'en': 'Payment',
      'ar': 'الدفع',
      'fa': 'پارەدان',
    },
    't7fbuvno': {
      'en': 'Payment successful',
      'ar': 'تم الدفع بنجاح',
      'fa': 'پارەدان سەرکەوتوو بوو',
    },
    'g456xjd2': {
      'en': 'Your payment has been successfully completed!',
      'ar': 'لقد تم إكمال الدفع بنجاح!',
      'fa': 'پارەدانەکەت بە سەرکەوتوویی تەواو کرا!',
    },
    'x312kqyp': {
      'en': 'Homepage',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
    '5750qy82': {
      'en': 'Show orders',
      'ar': 'عرض الطلبات',
      'fa': 'پشاندانی داواکاریەکان',
    },
    'olt91hik': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // FIBPayment
  {
    'i9e05gg4': {
      'en': 'Please select the payment method.',
      'ar': 'يرجى اختيار طريقة الدفع.',
      'fa': 'تکایە شێوازی پارەدانەکە هەڵبژێرە.',
    },
    'ai8yzttf': {
      'en': 'Payment',
      'ar': 'الدفع',
      'fa': 'پارەدان',
    },
    'iyiilib6': {
      'en': 'Personal',
      'ar': 'شخصي',
      'fa': 'تایبەت',
    },
    'rrbk5tma': {
      'en': 'Business',
      'ar': 'عمل',
      'fa': 'بازرگانی',
    },
    'qs9s634f': {
      'en': 'Corporate',
      'ar': 'شرکات',
      'fa': 'کۆمپانیاکان',
    },
    'cf02xvsu': {
      'en': 'Pay With FIB',
      'ar': 'الدفع باستخدام FIB',
      'fa': 'پارەدان بە FIB',
    },
    '8ss28lvh': {
      'en': 'Cancel payment process',
      'ar': 'إلغاء عملية الدفع',
      'fa': 'هەڵوەشاندنەوەی پرۆسەی پارەدان',
    },
    'wvjsui59': {
      'en': 'Pay Later',
      'ar': 'ادفع لاحقا',
      'fa': 'دواتر پارەبدە',
    },
    'a2nuq8pv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'hmz9fqqz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'fpl8m172': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'ahefxx37': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'yy9m3ygd': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // PaymentConfirmation
  {
    'r5bqzmir': {
      'en': 'Payment Successful',
      'ar': 'تم الدفع بنجاح',
      'fa': 'پارەدان سەرکەوتوو بوو',
    },
    'la2vtks0': {
      'en': 'Your payment has been successful.',
      'ar': 'لقد تم الدفع بنجاح.',
      'fa': 'پارەدانەکەت سەرکەوتوو بوو.',
    },
    'hlplg60e': {
      'en': 'Go to Homepage',
      'ar': 'انتقل للصفحة الرئيسية',
      'fa': 'چوون بۆ پەڕەی سەرەکی',
    },
    'gb4z2dbr': {
      'en': 'Go to My Cart',
      'ar': 'انتقل إلى سلة التسوق الخاصة بي',
      'fa': 'چوون بۆ سەبەتەکەم',
    },
    'u4bupu10': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // AddDomesticAddress
  {
    'utu4bnnr': {
      'en': 'Street Number',
      'ar': 'رقم الشارع',
      'fa': 'ژمارەی کۆڵان',
    },
    '0d88sxa2': {
      'en': 'Building name',
      'ar': 'اسم المبنى',
      'fa': 'ناوی باڵەخانە',
    },
    'iusgedrt': {
      'en': 'Floor',
      'ar': 'الطابق',
      'fa': 'نهۆم',
    },
    '8ivpfwda': {
      'en': 'Unit',
      'ar': 'الوحدة',
      'fa': 'یەکە',
    },
    's3jsa60q': {
      'en': 'Address owner phone number',
      'ar': 'رقم  هاتف صاحب العنوان',
      'fa': 'ژمارە مۆبایلی خاوەن ناونیشان',
    },
    'qvgtqnal': {
      'en': 'Address owner email address',
      'ar': 'عنوان البريد الإلكتروني لصاحب العنوان',
      'fa': 'ئیمەیڵی خاوەن ناونیشان',
    },
    'nvhgz5s1': {
      'en': 'Address Label',
      'ar': 'تصنيف العنوان',
      'fa': 'تەواوی ناونیشان',
    },
    'xat0yh0j': {
      'en': 'Address Note',
      'ar': 'ملاحظة العنوان',
      'fa': 'تێبینی ناونیشان',
    },
    'u1p0p9ow': {
      'en': 'Save and continue',
      'ar': 'حفظ ومتابعة',
      'fa': 'تۆمار کردن و بەردەوام بوون',
    },
    '3uhpyezy': {
      'en': 'Error!',
      'ar': 'خطأ!',
      'fa': 'هەڵە!',
    },
    'mjbnqery': {
      'en': 'The email you entered is not valid.',
      'ar': 'البريد الإلكتروني الذي أدخلته غير صالح.',
      'fa': 'ئەو ئیمەیڵەی کە تۆمارت کردووە دروست نییە.',
    },
    'rhayxtn2': {
      'en': 'Invalid address!',
      'ar': 'عنوان غير صالح!',
      'fa': 'ناونیشانی نادروست!',
    },
    'gy2vfnh1': {
      'en': 'Delivery is only possible to the addresses within Iraq.',
      'ar': 'التسليم ممكن فقط إلى العناوين داخل العراق.',
      'fa': 'گەیاندن تەنها بۆ ئەو ناونیشانانەی ناوەوەی عێراق بەردەستە.',
    },
    '5xtxgnjn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '6j8ep55y': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'jbidw6p4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '9v3b2bed': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    '5tysv1vz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '5h4whrxn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    '3hf6zn7f': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'lcbuwzzo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    '8mjpmfrf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'iawsr5ab': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'nwgisut6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '3zp1r5x9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'yun170nj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    'd1oaa1uk': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'd632kv3t': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '6rs1g8xc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
    'p5z062yj': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
  },
  // CartItem
  {
    'amntffow': {
      'en': 'Confirm!',
      'ar': 'تأكيد!',
      'fa': 'دڵنیابوونەوە!',
    },
    '0w5bhe66': {
      'en': 'You sure you want to remove the product from your cart?',
      'ar': 'هل أنت متأكد أنك تريد إزالة المنتج من سلة التسوق الخاصة بك؟',
      'fa': 'دڵنیایت کە دەتەوێ ئەم بەرهەمە لابدەیت لە سەبەتەکەت؟',
    },
    'bzz1vsjq': {
      'en': 'Yes, Remove',
      'ar': 'نعم، قم بإزالة',
      'fa': 'بەڵێ،لایبدە',
    },
    'twjbyt8b': {
      'en': 'Add note and special requests',
      'ar': 'إضافة ملاحظة طلب خاص',
      'fa': 'زیادکردنی تێبینی بۆ داواکاری تایبەت',
    },
    'k8rfldaj': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '923svstl': {
      'en': 'special request',
      'ar': 'طلب خاص',
      'fa': 'داواکاری تایبەت',
    },
  },
  // NavBar
  {
    'x0waiw5y': {
      'en': 'Stores',
      'ar': 'المتاجر',
      'fa': 'فرۆشگاکان',
    },
    'g85460uu': {
      'en': 'Stars',
      'ar': 'النجوم',
      'fa': 'ئەستێرەکان',
    },
    'i81l6pdr': {
      'en': 'Categories',
      'ar': 'الفئات',
      'fa': 'جۆرەکان',
    },
    's4f8om5t': {
      'en': 'Account',
      'ar': 'حساب',
      'fa': 'هەژمار',
    },
  },
  // ChatHeader
  {
    'hyguljxb': {
      'en': 'Confirm!',
      'ar': 'تأكيد!',
      'fa': 'دڵنیابوونەوە!',
    },
    'ip3fobkr': {
      'en': 'You sure you want to delete this conversation?',
      'ar': 'هل أنت متأكد أنك تريد حذف هذه المحادثة؟',
      'fa': 'دڵنیایت لەوەی کە دەتەوێت ئەم گفتوگۆیە بسڕیتەوە؟',
    },
    '268cabss': {
      'en': 'Yes, Delete',
      'ar': 'نعم، حذف',
      'fa': 'بەڵێ، بیسڕەوە',
    },
    'f7wwnhef': {
      'en': 'Confirm!',
      'ar': 'تأكيد!',
      'fa': 'دڵنیابوونەوە!',
    },
    '7k6n7bgs': {
      'en': 'You sure you want to archive this conversation?',
      'ar': 'هل أنت متأكد من أرشفة هذه المحادثة؟',
      'fa': 'دڵنیایت کە دەتەوێ ئەم گفتوگۆیە ئەرشیف بکەیت؟',
    },
    'v1xcbuv5': {
      'en': 'Yes, Archive',
      'ar': 'نعم، الأرشيف',
      'fa': 'بەڵێ، ئەرشیفی بکە',
    },
    'xr6tn033': {
      'en': 'Chat archived successfully!',
      'ar': 'تم أرشفة الدردشة بنجاح!',
      'fa': 'گفتوگۆیەکە بە سەرکەوتوویی ئەرشیف کرا!',
    },
  },
  // SearchSortPopup
  {
    '2aau9zm4': {
      'en': 'Sort',
      'ar': 'ترتيب',
      'fa': 'ڕیز کردن',
    },
    'tla4h7x2': {
      'en': 'Apply',
      'ar': 'تطبيق',
      'fa': 'جێبەجێ کردن',
    },
  },
  // AddAddressPopup
  {
    '6dmevb8n': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'fa': 'زیادکردنی ناونیشانی نوێ',
    },
    'b3quo1cf': {
      'en': 'Address Name',
      'ar': 'اسم العنوان',
      'fa': 'ناوی ناونیشان',
    },
    'onmsux76': {
      'en': 'Address name',
      'ar': 'اسم العنوان',
      'fa': 'ناوی ناونیشان',
    },
    'taiwnoza': {
      'en': 'Address Details (Delivery only possible within Iraq)',
      'ar': 'تفاصيل العنوان (التوصيل متاح فقط داخل العراق)',
      'fa': 'وردەکاری ناونیشان (گەیاندن تەنها بۆ ناوەوەی عێراق بەردەستە)',
    },
    'qu33px6o': {
      'en': 'Select Location',
      'ar': 'حدد الموقع',
      'fa': 'شوێن هەڵبژێرە',
    },
    'kunhv5t5': {
      'en': 'Default address',
      'ar': 'العنوان الإفتراضي',
      'fa': 'ناونیشانی گریمانەیی',
    },
    'r43429w7': {
      'en': 'Shipping address',
      'ar': 'عنوان التوصيل',
      'fa': 'ناونیشانی گەیاندن',
    },
    'lapjab4i': {
      'en': 'Add',
      'ar': 'اضافة',
      'fa': 'زیادکردن',
    },
    'v34112m3': {
      'en': 'Invalid address!',
      'ar': 'عنوان غير صالح!',
      'fa': 'ناونیشانی نادروست!',
    },
    'i2nz440n': {
      'en': 'Delivery is only possible to the addresses within Iraq.',
      'ar': 'التسليم ممكن فقط إلى العناوين داخل العراق.',
      'fa': 'گەیاندن تەنها بۆ ئەو ناونیشانانەی ناوەوەی عێراق بەردەستە.',
    },
  },
  // CongratulationModal
  {
    'abmzq2y2': {
      'en': 'Congratulations!',
      'ar': 'مبروك!',
      'fa': 'پیرۆزە!',
    },
    'rd5gb9z1': {
      'en':
          'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
      'ar':
          'حسابك جاهز للاستخدام. سيتم إعادة توجيهك إلى الصفحة الرئيسية في غضون ثوانٍ قليلة.',
      'fa':
          'هەژمارەکەت ئامادەیە بۆ بەکارهێنان، لەماوەی چەن چرکەیەکدا ئاراستە دەکرێیتەوە بۆ پەڕەی سەرەکی..',
    },
  },
  // OrderHistoryItem
  {
    'bp1tzbls': {
      'en': 'Review',
      'ar': 'مراجعة',
      'fa': 'پێداچوونەوە',
    },
  },
  // NotificationBadge
  {
    'lzcyhmv3': {
      'en': '23',
      'ar': '23',
      'fa': '23',
    },
  },
  // WalletFrontCard
  {
    'kml1rrf7': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'fa': 'جزدان',
    },
    'p1o5y80s': {
      'en': 'History',
      'ar': 'تاريخ',
      'fa': 'مێژوو',
    },
    '9s7zajf3': {
      'en': 'Top Up',
      'ar': 'إعادة التعبئة',
      'fa': 'پڕکردنەوە',
    },
  },
  // AnonUserCard
  {
    'wu2yg5sy': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
      'fa': 'بەخێربێیت!',
    },
    'r2h82q3j': {
      'en': 'Guest',
      'ar': 'ضيف',
      'fa': 'میوان',
    },
  },
  // InfoModal
  {
    'exw6m8qw': {
      'en': 'Cancel',
      'ar': 'الغاء',
      'fa': 'هەڵوەشاندنەوە',
    },
  },
  // TopupModal
  {
    'z61lvxqj': {
      'en': 'Topup Your Wallet',
      'ar': 'قم بشحن محفظتك',
      'fa': 'جزدانەکەت پڕبکەوە',
    },
    '56fjw6ab': {
      'en': 'Amount',
      'ar': 'كمية',
      'fa': 'بڕ',
    },
    'efxrqxix': {
      'en': 'Amount',
      'ar': 'كمية',
      'fa': 'بڕ',
    },
    '962glepn': {
      'en': 'Apply',
      'ar': 'تطبيق',
      'fa': 'جێبەجێکردن',
    },
    '32ucc61h': {
      'en': 'Invalid amount!',
      'ar': 'مبلغ غير صالح!',
      'fa': 'بڕەکە نادروستە!',
    },
    '1jpxuuac': {
      'en': 'The value is not in the min-max boundaries.',
      'ar': 'القيمة ليست ضمن حدود الحد الأدنى والحد الأقصى.',
      'fa': 'بەهاکە لە سنووری کەمترین-زۆرتریندا نییە.',
    },
    'vgkrbpsq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'ئەم خانەیە داواکراوە',
    },
    '3fjn08c6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fa': 'تکایە یەک لەهەڵبژاردنەکانی خوارەوە هەڵبژێرە',
    },
  },
  // SearchShell
  {
    'zi9zb8q2': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'ek1xovlj': {
      'en': 'Search',
      'ar': 'بحث',
      'fa': 'گەڕان',
    },
  },
  // AddressCard
  {
    'j27ac60i': {
      'en': 'Default Address',
      'ar': 'العنوان الإفتراضي',
      'fa': 'ناونیشانی گریمانەیی',
    },
    'kvxg229g': {
      'en': 'Set as Default',
      'ar': 'تعيين كافتراضي',
      'fa': 'دانان وەک گریمانەیی',
    },
    'e0a6powq': {
      'en': 'Confirm!',
      'ar': 'يتأكد!',
      'fa': 'دڵنیاکردنەوە!',
    },
    'i1rmwmf8': {
      'en': 'You sure you want to remove this address?',
      'ar': 'هل أنت متأكد أنك تريد إزالة هذا العنوان؟',
      'fa': 'دڵنیای دەتەوێت ئەم ناونیشانە لاببەیت؟',
    },
    'xflb73wp': {
      'en': 'Yes, Remove',
      'ar': 'نعم، قم بإزالة',
      'fa': 'بەڵێ، لابەرە',
    },
    'vak8irjs': {
      'en': 'Removed!',
      'ar': 'تمت الإزالة!',
      'fa': 'لابرا!',
    },
    'sov781s1': {
      'en': 'Address is successfully removed.',
      'ar': 'تم إزالة العنوان بنجاح.',
      'fa': 'ناونیشان بە سەرکەوتوویی لابرا.',
    },
  },
  // addressInsert
  {
    'bqxk57d9': {
      'en': 'Select Address',
      'ar': 'حدد العنوان',
      'fa': 'ناونیشان هەڵبژێرە',
    },
    '3m2dki9l': {
      'en': 'No address, Please start add your addresses',
      'ar': 'لا يوجد عنوان، يرجى البدء بإضافة عناوينك',
      'fa': 'ناونیشان نییە، تکایە دەست بکە بە زیادکردنی ناونیشانەکانت',
    },
    'y9n3rq0x': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'fa': 'زیادکردنی ناونیشانی نوێ',
    },
  },
  // DeliveryMethodItem
  {
    '0pb14jpp': {
      'en': 'Delivery',
      'ar': 'طريقة التوصیل',
      'fa': 'شێوازی گەیاندن',
    },
    'm33hsh03': {
      'en': 'Change',
      'ar': '',
      'fa': '',
    },
  },
  // DeliveryMethodSelector
  {
    '1lrst0pi': {
      'en': 'Select Delivery Method',
      'ar': 'حدد طريقة التوصیل',
      'fa': 'هەڵبژاردنی شێوازی گەیاندن',
    },
  },
  // NavBarDelivery
  {
    'p5z062yj': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
      'fa': 'پەڕەی سەرەکی',
    },
    'pp5xpshl': {
      'en': 'Delivery History',
      'ar': 'تاريخ التوصیل',
      'fa': 'مێژووی گەیاندن',
    },
    'srv0anaj': {
      'en': 'Account',
      'ar': 'حساب',
      'fa': 'هەژمار',
    },
  },
  // Banner
  {
    'v8uxpwlm': {
      'en': 'Title',
      'ar': 'عنوان',
      'fa': 'ناونیشان',
    },
    'lfze99l8': {
      'en': 'SubTitle',
      'ar': 'العنوان الفرعي',
      'fa': 'ژێرنووس',
    },
    'cdmi1lhm': {
      'en': 'Description ',
      'ar': 'وصف',
      'fa': 'وه‌سف کردن',
    },
    '52g2fc7i': {
      'en': 'Description',
      'ar': 'وصف',
      'fa': 'وه‌سف کردن',
    },
    'v0klx8km': {
      'en': 'Description',
      'ar': 'وصف',
      'fa': 'وه‌سف کردن',
    },
  },
  // PaymentMethodSelect
  {
    '41f9oaxq': {
      'en': 'Please select your payment method',
      'ar': 'الرجاء اختيار طريقة الدفع الخاصة بك',
      'fa': 'تکایە شێوازی پارەدانەکەت هەڵبژێرە',
    },
    'p9uwyazy': {
      'en': 'Pay with',
      'ar': 'ادفع بـ',
      'fa': 'پارەبدە بە',
    },
    '0w0vu247': {
      'en': 'FIB',
      'ar': 'فيب',
      'fa': 'FIB',
    },
    'gx0vfjap': {
      'en': 'FIRST IRAQI BANK',
      'ar': 'البنك العراقي الأول',
      'fa': 'یەکەمین بانکی عێراقی',
    },
    'wyow9mm4': {
      'en': 'Pay with',
      'ar': 'ادفع بـ',
      'fa': 'پارەبدە بە',
    },
    'oo9x5ouf': {
      'en': 'Credit Card',
      'ar': 'بطاقة إئتمان',
      'fa': 'کارتی بانکیی',
    },
  },
  // ReviewSummary
  {
    '5qr7sgqh': {
      'en': '5',
      'ar': '5',
      'fa': '5',
    },
    'm2d7sv1b': {
      'en': '4',
      'ar': '4',
      'fa': '4',
    },
    'gidysjdk': {
      'en': '3',
      'ar': '3',
      'fa': '3',
    },
    'q4nyfjsq': {
      'en': '2',
      'ar': '2',
      'fa': '2',
    },
    '1gq7tqfr': {
      'en': '1',
      'ar': '1',
      'fa': '1',
    },
  },
  // ReviewSummarySection
  {
    'gno2ruga': {
      'en': '5',
      'ar': '5',
      'fa': '5',
    },
    '19o5pxwa': {
      'en': '4',
      'ar': '4',
      'fa': '4',
    },
    '3stis28j': {
      'en': '3',
      'ar': '3',
      'fa': '3',
    },
    'vk0ni0av': {
      'en': '2',
      'ar': '2',
      'fa': '2',
    },
    'vsqokq19': {
      'en': '1',
      'ar': '1',
      'fa': '1',
    },
  },
  // OrderGroupDeliveryItem
  {
    'xxbouuhm': {
      'en': 'Track',
      'ar': 'مسار',
      'fa': 'ڕێگا و بان',
    },
  },
  // AddressReturnPlaceId
  {
    'o3sc6vkv': {
      'en': 'Continue',
      'ar': 'متابعة',
      'fa': 'بەردەوام بوون',
    },
    'juqcixd5': {
      'en': 'Find Address',
      'ar': 'البحث عن العنوان',
      'fa': 'گەڕان بەدوای ناونیشان',
    },
    'j9p6967u': {
      'en': 'Start writing and elect the neearest address and continue',
      'ar': 'ابدأ بالكتابة واختر أقرب عنوان واستمر',
      'fa': 'دەست بکە بە نووسین، نزیکترین ناونیشان هەڵبژێرە و بەردەوام بە',
    },
    'obci6typ': {
      'en': 'Enter a new address',
      'ar': 'أدخل عنوان جديد',
      'fa': 'ناونیشانێکی نوێ تۆماربکە',
    },
    '5f4z046j': {
      'en': 'Nearest addresses',
      'ar': 'العنوان الأقرب',
      'fa': 'نزیکترین ناونیشان',
    },
    'li7p55tm': {
      'en': 'No Address',
      'ar': 'لا يوجد عنوان',
      'fa': 'بێ ناونیشان',
    },
    'zwzw22uk': {
      'en': 'Map',
      'ar': 'خريطة',
      'fa': 'نەخشە',
    },
    'bcmnbug0': {
      'en': 'Finder',
      'ar': 'الباحث',
      'fa': 'دۆزەرەوە',
    },
    'xbgdmnto': {
      'en': 'Map',
      'ar': 'خريطة',
      'fa': 'نەخشە',
    },
  },
  // TermsTexts
  {
    'loe8vknm': {
      'en': 'By joining you are agree to our ',
      'ar': 'من خلال الانضمام فإنك توافق على',
      'fa': 'بە بەشداریکردن تۆ ڕازیت بە',
    },
    'mow1c2lx': {
      'en': 'Terms of Service ',
      'ar': 'شروط الخدمة',
      'fa': 'مەرجەکانی خزمەتگوزاری',
    },
    'r9qvi8vu': {
      'en': 'and ',
      'ar': 'و',
      'fa': 'و',
    },
    'm9pje3b2': {
      'en': 'Privacy Policy.',
      'ar': 'سياسة الخصوصية الخاصة بنا.',
      'fa': 'سیاسەتی پاراستنی نهێنی.',
    },
  },
  // PickHowToPay
  {
    '04bhw9bc': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'fa': 'جزدان',
    },
  },
  // Miscellaneous
  {
    'se1hf4rp': {
      'en': 'Start Shopping',
      'ar': 'ابدأ التسوق',
      'fa': 'شروع به خرید کنید',
    },
    'bvptjg1x': {
      'en': 'Continue with Email',
      'ar': 'متابعة مع البريد الإلكتروني',
      'fa': 'با ایمیل ادامه دهید',
    },
    '1k487id9': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fa': 'ایمیل',
    },
    '3xttmo0x': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fa': 'رمز عبور',
    },
    '09b5hp19': {
      'en': 'Track Order',
      'ar': 'تتبع الطلب',
      'fa': 'پیگیری سفارش',
    },
    'i5pl2vch': {
      'en': 'Search',
      'ar': 'يبحث',
      'fa': 'جستجو کنید',
    },
    'b8ad2jmn': {
      'en': 'Review',
      'ar': 'مراجعة',
      'fa': 'بررسی کنید',
    },
    'm68jijfd': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '9uh5swn8': {
      'en': 'special request',
      'ar': 'طلب خاص',
      'fa': 'درخواست ویژه',
    },
    'cnb861qw': {
      'en': 'Stars',
      'ar': 'النجوم',
      'fa': 'ئەستێرەکان',
    },
    'zpo4ryku': {
      'en':
          'To enable you to take a new photo for your profile picture, this app requires permission to access the camera.',
      'ar': '',
      'fa': '',
    },
    'bxael09x': {
      'en':
          'To allow you to customize your profile, this app requires access to your photo library for selecting a profile picture.',
      'ar': '',
      'fa': '',
    },
    'eitnewvx': {
      'en':
          'To provide support through audio messages, this app requires permission to access the microphone for recording voice messages in chat support.',
      'ar': '',
      'fa': '',
    },
    'maigzira': {
      'en':
          'To provide accurate delivery services, this app requires access to your location to allow you to save your shipping address when placing an order.',
      'ar': '',
      'fa': '',
    },
    '230mer5i': {
      'en':
          'To keep you informed about order updates and important alerts, this app requires permission to send you notifications.',
      'ar': '',
      'fa': '',
    },
    'y2e4x0u0': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '4xfo5zae': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'sffj6vp0': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'oj73rext': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '8he2bx7k': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'nlz5rv3y': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '3wnpzna5': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'v6opt512': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'cmshsmyg': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'b329ahc1': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '097riu02': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'qw45r1gj': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'rn2dw0q4': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'y36zkn92': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'jmiumhry': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'dkdrcxct': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'ui6ft3t4': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'ydduoyoj': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '0ns66fo8': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '946uyn0f': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'wvm4a5b0': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '4o55gt3n': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'oecqjejz': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'bdyvbin3': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'ggd1dz19': {
      'en': '',
      'ar': '',
      'fa': '',
    },
  },
].reduce((a, b) => a..addAll(b));
