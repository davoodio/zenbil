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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Splash
  {
    'xssnrfov': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Signup
  {
    '98lk433y': {
      'en': 'Login / Register',
      'ar': 'تسجيل الدخول / التسجيل',
      'fa': 'ورود / ثبت نام',
    },
    'd204yxpt': {
      'en': 'Enter your phone number to continue...',
      'ar': 'أدخل رقم هاتفك للمواصلة...',
      'fa': 'برای ادامه شماره تلفن خود را وارد کنید...',
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
      'ar': 'البحث عن العنصر...',
      'fa': 'جستجو برای یک مورد ...',
    },
    'zbw026kw': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
      'fa': 'شماره تلفن',
    },
    'trk7eetr': {
      'en': 'GET CODE',
      'ar': 'احصل على الكود',
      'fa': 'دریافت کد',
    },
    '7fl9fg2p': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    '097rag8v': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '39wm2g6d': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // PinCodeVerification
  {
    'x1tweg8e': {
      'en': 'Enter 6-digits code',
      'ar': 'أدخل الرمز المكون من 6 أرقام',
      'fa': 'کد 6 رقمی را وارد کنید',
    },
    'am2c0hvz': {
      'en': 'Enter the 6-digits code that you recieved on your phone.',
      'ar': 'أدخل الرمز المكون من 6 أرقام الذي تلقيته على هاتفك.',
      'fa': 'کد 6 رقمی را که در گوشی خود دریافت کرده اید وارد کنید.',
    },
    'hv2lxe0r': {
      'en': 'CONTINUE',
      'ar': 'يكمل',
      'fa': 'ادامه دهید',
    },
    'i0t70n83': {
      'en': 'Try again',
      'ar': 'حاول ثانية',
      'fa': 'دوباره امتحان کنید',
    },
    'ywm17iwh': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // PasswordResetConfirmation
  {
    '61v49d8a': {
      'en': 'Confirmation',
      'ar': 'تأكيد',
      'fa': 'تایید',
    },
    'gda1gdsg': {
      'en':
          'Your password has been changed. Now you can log in with your new password.',
      'ar':
          'لقد تم تغيير كلمة المرور الخاصة بك. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.',
      'fa':
          'رمز عبور شما تغییر کرده است. اکنون می توانید با رمز عبور جدید وارد شوید.',
    },
    'wh9xm2n7': {
      'en': 'LOG IN',
      'ar': 'تسجيل الدخول',
      'fa': 'وارد شوید',
    },
    '18mdkbiu': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // TrackOrder
  {
    'ujpkfzxm': {
      'en': 'Track Order',
      'ar': 'تتبع الطلب',
      'fa': 'پیگیری سفارش',
    },
    'xx6ucazs': {
      'en': 'Track Shipment Details',
      'ar': 'تتبع تفاصيل الشحنة',
      'fa': 'پیگیری جزئیات حمل و نقل',
    },
    'f97nesv4': {
      'en': 'Error!',
      'ar': 'خطأ!',
      'fa': 'خطا!',
    },
    'd3xw1g8y': {
      'en': 'Please try again.',
      'ar': 'من فضلك حاول مرة أخرى.',
      'fa': 'لطفا دوباره امتحان کنید.',
    },
    'dtoom1e5': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // TrackOrderOnMap
  {
    'g03v8in6': {
      'en': 'Track Order On Map',
      'ar': 'تتبع الطلب على الخريطة',
      'fa': 'پیگیری سفارش در نقشه',
    },
    '142z5ypa': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Cart
  {
    'mv0lc2hi': {
      'en': 'Shopping Bag',
      'ar': 'كيس التسوق',
      'fa': 'کیف خرید',
    },
    'b8xjdsfc': {
      'en': 'Cart Is Empty!',
      'ar': 'العربة فارغة!',
      'fa': 'سبد خرید خالی است!',
    },
    'kd0mpdxu': {
      'en': 'Your cart is empty try to add products to your cart.',
      'ar':
          'سلة التسوق الخاصة بك فارغة. حاول إضافة المنتجات إلى سلة التسوق الخاصة بك.',
      'fa': 'سبد شما خالی است سعی کنید محصولاتی را به سبد خرید خود اضافه کنید.',
    },
    'd9mh8z15': {
      'en': 'Total',
      'ar': 'المجموع',
      'fa': 'مجموع',
    },
    'dpqix3gq': {
      'en': 'CHECKOUT',
      'ar': 'الدفع',
      'fa': 'تسویه حساب',
    },
    '0ad21nz4': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Checkout
  {
    '2lsmrcs6': {
      'en': 'Warning!',
      'ar': 'تحذير!',
      'fa': 'هشدار!',
    },
    'l4rooo56': {
      'en': 'You want to cancel this order? ',
      'ar': 'هل تريد إلغاء هذا الطلب؟',
      'fa': 'می خواهید این سفارش را لغو کنید؟',
    },
    'mse50phj': {
      'en': 'Yes, Cancel',
      'ar': 'نعم، إلغاء',
      'fa': 'بله، لغو',
    },
    '3pd5h8pm': {
      'en': 'CHECKOUT',
      'ar': 'الدفع',
      'fa': 'تسویه حساب',
    },
    'u375a2u4': {
      'en': 'Billing & Delivery Address',
      'ar': 'عنوان الفاتورة والتسليم',
      'fa': 'آدرس صورتحساب و تحویل',
    },
    'e8ptayyf': {
      'en': 'Change / Add New',
      'ar': 'تغيير / إضافة جديد',
      'fa': 'تغییر / اضافه کردن جدید',
    },
    'zk91df73': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع',
      'fa': 'روش پرداخت',
    },
    '4gplc6gd': {
      'en': 'Cost',
      'ar': 'يكلف',
      'fa': 'هزینه',
    },
    'i3dz3t4g': {
      'en': 'Products Price',
      'ar': 'سعر المنتجات',
      'fa': 'قیمت محصولات',
    },
    'qubhbma1': {
      'en': 'Shipping Fees',
      'ar': 'رسوم الشحن',
      'fa': 'هزینه های حمل و نقل',
    },
    'xm9edubi': {
      'en': 'Total',
      'ar': 'المجموع',
      'fa': 'مجموع',
    },
    'v0wvsjkk': {
      'en': 'Add Coupon Code',
      'ar': 'أضف رمز القسيمة',
      'fa': 'اضافه کردن کد کوپن',
    },
    '9cbl9cmi': {
      'en': 'Confirm Order',
      'ar': 'تأكيد الطلب',
      'fa': 'سفارش را تایید کنید',
    },
    'n8aagpr3': {
      'en': 'No address!',
      'ar': 'لا يوجد عنوان!',
      'fa': 'بدون آدرس!',
    },
    '2aauu3sh': {
      'en': 'You should select a shipping address.',
      'ar': 'ينبغي عليك تحديد عنوان الشحن.',
      'fa': 'شما باید یک آدرس حمل و نقل را انتخاب کنید.',
    },
    'a5bo9q99': {
      'en': 'Sorry!',
      'ar': 'آسف!',
      'fa': 'متاسفم!',
    },
    'zax5th2r': {
      'en': 'Wallet amount is less than the order total.',
      'ar': 'مبلغ المحفظة أقل من إجمالي الطلب.',
      'fa': 'مقدار کیف پول کمتر از کل سفارش است.',
    },
    'riemyto1': {
      'en': 'Sorry!',
      'ar': 'آسف!',
      'fa': 'متاسفم!',
    },
    '772tgoe3': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
    'vx5r4aub': {
      'en': 'No address!',
      'ar': 'لا يوجد عنوان!',
      'fa': 'بدون آدرس!',
    },
    'vebm2tsp': {
      'en': 'You should select a shipping address.',
      'ar': 'ينبغي عليك تحديد عنوان الشحن.',
      'fa': 'شما باید یک آدرس حمل و نقل را انتخاب کنید.',
    },
    'gha3bzgd': {
      'en': 'Error fetching delivery details!',
      'ar': 'خطأ في جلب تفاصيل التسليم!',
      'fa': 'خطا در واکشی جزئیات تحویل!',
    },
    'tmhl22xk': {
      'en': 'Error fetching delivery details!',
      'ar': 'خطأ في جلب تفاصيل التسليم!',
      'fa': 'خطا در واکشی جزئیات تحویل!',
    },
  },
  // OrderConfirmation
  {
    'nkh5xo81': {
      'en': 'Order Successful',
      'ar': 'تم الطلب بنجاح',
      'fa': 'سفارش با موفقیت انجام شد',
    },
    'fmwk5en9': {
      'en':
          'Your order has been successful. Track your order from your orders history page',
      'ar':
          'لقد تم تنفيذ طلبك بنجاح. يمكنك تتبع طلبك من صفحة سجل الطلبات الخاصة بك',
      'fa':
          'سفارش شما با موفقیت انجام شد سفارش خود را از صفحه تاریخچه سفارشات خود پیگیری کنید',
    },
    '8vgx1iqj': {
      'en': 'Order ID: ',
      'ar': 'معرف الطلب:',
      'fa': 'شناسه سفارش:',
    },
    '44evm9tq': {
      'en': 'Track Details',
      'ar': 'تفاصيل المسار',
      'fa': 'جزئیات آهنگ',
    },
    'r9x0znfi': {
      'en': 'Continue Shopping',
      'ar': 'متابعة التسوق',
      'fa': 'به خرید ادامه دهید',
    },
    '074df2tf': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // zenbil
  {
    '033rwxmc': {
      'en': 'Men',
      'ar': 'الرجال',
      'fa': 'مردان',
    },
    'oibnflf2': {
      'en': 'Women',
      'ar': 'نحيف',
      'fa': 'زنان',
    },
    'cnb861qw': {
      'en': 'Stars',
      'ar': 'النجوم',
      'fa': 'ستاره ها',
    },
    '24e6d594': {
      'en': 'Men',
      'ar': 'الرجال',
      'fa': 'مردان',
    },
    'd1vjcn7u': {
      'en': 'Women',
      'ar': 'نحيف',
      'fa': 'زنان',
    },
    '3t0fwcyu': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'fa': 'مشاهده همه',
    },
    '7dbwetzu': {
      'en': 'Brands',
      'ar': 'العلامات التجارية',
      'fa': 'برندها',
    },
    'xa42l19t': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'fa': 'مشاهده همه',
    },
    'p3fjqw7b': {
      'en': 'Most Popular',
      'ar': 'الأكثر شعبية',
      'fa': 'محبوب ترین',
    },
    'v7qqd2pj': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'fa': 'مشاهده همه',
    },
    'q2sbun81': {
      'en': 'Highest Reviews',
      'ar': 'أعلى التقييمات',
      'fa': 'بالاترین نظرات',
    },
    'ahwsve40': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'fa': 'مشاهده همه',
    },
    'gg46154e': {
      'en': 'Hot Sales',
      'ar': 'المبيعات الساخنة',
      'fa': 'فروش داغ',
    },
    'cxpwi9dt': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'fa': 'مشاهده همه',
    },
    'chwhgv7e': {
      'en': 'Categories',
      'ar': 'فئات',
      'fa': 'دسته بندی ها',
    },
    'a7326y4y': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'fa': 'مشاهده همه',
    },
    'iqcmjes6': {
      'en': 'Trending Now',
      'ar': 'الأكثر رواجًا الآن',
      'fa': 'پرطرفدار در حال حاضر',
    },
    'm53k5l6u': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'fa': 'مشاهده همه',
    },
    'goehe4sk': {
      'en': 'Stores',
      'ar': 'المتاجر',
      'fa': 'فروشگاه ها',
    },
    'i4x9uaem': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'fa': 'مشاهده همه',
    },
    '4cfi842k': {
      'en': 'No favorites yet!',
      'ar': 'لا يوجد مفضلة حتى الآن!',
      'fa': 'هنوز موارد دلخواه وجود ندارد!',
    },
    '4tdvzv32': {
      'en': 'You can add a favorite product to see it in this list.',
      'ar': 'يمكنك إضافة منتجك المفضل لرؤيته في هذه القائمة.',
      'fa':
          'برای مشاهده آن در این لیست می توانید محصول مورد علاقه خود را اضافه کنید.',
    },
    'x77zbmat': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Notification
  {
    'b8sn8ca5': {
      'en': 'Notification',
      'ar': 'إشعار',
      'fa': 'اطلاع رسانی',
    },
    'nnue2exs': {
      'en': 'Order Arrived',
      'ar': 'وصل الطلب',
      'fa': 'سفارش رسید',
    },
    'g8rbgpue': {
      'en': '12:35 PM',
      'ar': '12:35 ظهرا',
      'fa': '12:35 بعد از ظهر',
    },
    'xn8fkyok': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'سفارش دهید',
    },
    'k33dgzxw': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    's48jc5cz': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم الانتهاء من الشحنة ووصلت إلى عنوان الوجهة.',
      'fa': 'تکمیل شده و به آدرس مقصد رسیده است.',
    },
    'qvkyshek': {
      'en': 'Order Success',
      'ar': 'نجاح الطلب',
      'fa': 'سفارش موفقیت',
    },
    'li0tple2': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دیروز',
    },
    '2z6ex4cw': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'سفارش دهید',
    },
    'c5klnszd': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    'xez6e77e': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم الانتهاء من الشحنة ووصلت إلى عنوان الوجهة.',
      'fa': 'تکمیل شده و به آدرس مقصد رسیده است.',
    },
    '15m0ivok': {
      'en': 'Order Success',
      'ar': 'نجاح الطلب',
      'fa': 'سفارش موفقیت',
    },
    'gnhmvvkn': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دیروز',
    },
    '3tuji3vz': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'سفارش دهید',
    },
    '0cjkvt7c': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    '6lka32cy': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم الانتهاء من الشحنة ووصلت إلى عنوان الوجهة.',
      'fa': 'تکمیل شده و به آدرس مقصد رسیده است.',
    },
    'isi3y06r': {
      'en': 'Order Success',
      'ar': 'نجاح الطلب',
      'fa': 'سفارش موفقیت',
    },
    'a19a4w2a': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دیروز',
    },
    'vzzie027': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'سفارش دهید',
    },
    'n8czi5ua': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    'fxd370mi': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم الانتهاء من الشحنة ووصلت إلى عنوان الوجهة.',
      'fa': 'تکمیل شده و به آدرس مقصد رسیده است.',
    },
    'tar32od1': {
      'en': 'Order Success',
      'ar': 'نجاح الطلب',
      'fa': 'سفارش موفقیت',
    },
    '2o02rudu': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دیروز',
    },
    'y5mfa1kk': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'سفارش دهید',
    },
    '43iegqb9': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    'w3k1aigs': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم الانتهاء من الشحنة ووصلت إلى عنوان الوجهة.',
      'fa': 'تکمیل شده و به آدرس مقصد رسیده است.',
    },
    'ntqpq1za': {
      'en': 'Order Success',
      'ar': 'نجاح الطلب',
      'fa': 'سفارش موفقیت',
    },
    'c4c3vvrf': {
      'en': 'Yesterday',
      'ar': 'أمس',
      'fa': 'دیروز',
    },
    'upag28i2': {
      'en': 'Order ',
      'ar': 'طلب',
      'fa': 'سفارش دهید',
    },
    'c1uyhcs8': {
      'en': '#567896 ',
      'ar': '#567896',
      'fa': '#567896',
    },
    'tuplg6d9': {
      'en': 'has been completed & arrived at the destination address.',
      'ar': 'تم الانتهاء من الشحنة ووصلت إلى عنوان الوجهة.',
      'fa': 'تکمیل شده و به آدرس مقصد رسیده است.',
    },
    'cglze0f7': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Support
  {
    'ghrdztql': {
      'en': 'Support',
      'ar': 'يدعم',
      'fa': 'پشتیبانی کنید',
    },
    'gu6cr867': {
      'en':
          'There is no active conversation! Make sure you signup so you can start a conversation.',
      'ar': 'لا توجد محادثة نشطة! تأكد من التسجيل حتى تتمكن من بدء محادثة.',
      'fa':
          'هیچ مکالمه فعالی وجود ندارد! حتما ثبت نام کنید تا بتوانید مکالمه را شروع کنید.',
    },
    'r1uu4uis': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Chat
  {
    'dsb5qb40': {
      'en': 'Hi! ',
      'ar': 'أهلاً!',
      'fa': 'سلام!',
    },
    'ktbr6wvv': {
      'en': 'Start your conversation.',
      'ar': 'ابدأ محادثتك.',
      'fa': 'مکالمه خود را شروع کنید',
    },
    '3s9nyko1': {
      'en': 'Conversation ended by the user.',
      'ar': 'تم إنهاء المحادثة بواسطة المستخدم.',
      'fa': 'مکالمه توسط کاربر به پایان رسید.',
    },
    '5wf04d7v': {
      'en': 'Conversation ended by the support person.',
      'ar': 'تم إنهاء المحادثة بواسطة شخص الدعم.',
      'fa': 'مکالمه توسط شخص پشتیبانی به پایان رسید.',
    },
    '6me1kzdh': {
      'en': 'Start Typing ...',
      'ar': 'ابدأ الكتابة...',
      'fa': 'شروع به تایپ کنید...',
    },
    'sisemz6x': {
      'en': 'Uploading ...',
      'ar': 'جاري التحميل ...',
      'fa': 'در حال آپلود...',
    },
    '2iw1udr8': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // SearchFocus
  {
    '9duhaqee': {
      'en': 'Search Focus',
      'ar': 'التركيز على البحث',
      'fa': 'تمرکز جستجو',
    },
    '8ekt8hmf': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    'i2ohjb4y': {
      'en': 'Search',
      'ar': 'يبحث',
      'fa': 'جستجو کنید',
    },
    'l0tv97n0': {
      'en': 'Recent Search History',
      'ar': 'سجل البحث الأخير',
      'fa': 'تاریخچه جستجوی اخیر',
    },
    '2yams9gm': {
      'en': 'Mikasa Volleyball',
      'ar': 'ميكاسا الكرة الطائرة',
      'fa': 'والیبال میکاسا',
    },
    'jtp1ewrd': {
      'en': 'Sneakers',
      'ar': 'أحذية رياضية',
      'fa': 'کفش های کتانی',
    },
    '0rkpw2d9': {
      'en': 'Iphone 12 Pro Max',
      'ar': 'ايفون 12 برو ماكس',
      'fa': 'آیفون 12 پرو مکس',
    },
    'ixolnsg2': {
      'en': 'Wacom Tablet',
      'ar': 'جهاز واكوم اللوحي',
      'fa': 'تبلت Wacom',
    },
    'zkbzyso8': {
      'en': 'Macbook',
      'ar': 'ماك بوك',
      'fa': 'مک بوک',
    },
    '2s2bppks': {
      'en': 'Trending Search',
      'ar': 'البحث الشائع',
      'fa': 'جستجوی پرطرفدار',
    },
    '0iknrlgx': {
      'en': 'Mikasa Volleyball',
      'ar': 'ميكاسا الكرة الطائرة',
      'fa': 'والیبال میکاسا',
    },
    'ocrnidit': {
      'en': 'Sneakers',
      'ar': 'أحذية رياضية',
      'fa': 'کفش های کتانی',
    },
    '13fm5ub0': {
      'en': 'Iphone 12 Pro Max',
      'ar': 'ايفون 12 برو ماكس',
      'fa': 'آیفون 12 پرو مکس',
    },
    'mwntkva4': {
      'en': 'Wacom Tablet',
      'ar': 'جهاز واكوم اللوحي',
      'fa': 'تبلت Wacom',
    },
    'qy8gl0bq': {
      'en': 'Macbook',
      'ar': 'ماك بوك',
      'fa': 'مک بوک',
    },
    'zeefixz4': {
      'en': 'Categories',
      'ar': 'فئات',
      'fa': 'دسته بندی ها',
    },
    'g6hjh0t6': {
      'en': 'Mikasa Volleyball',
      'ar': 'ميكاسا الكرة الطائرة',
      'fa': 'والیبال میکاسا',
    },
    'x9ub1thu': {
      'en': 'Sneakers',
      'ar': 'أحذية رياضية',
      'fa': 'کفش های کتانی',
    },
    'qkr5enxo': {
      'en': 'Iphone 12 Pro Max',
      'ar': 'ايفون 12 برو ماكس',
      'fa': 'آیفون 12 پرو مکس',
    },
    'xht3im48': {
      'en': 'Wacom Tablet',
      'ar': 'جهاز واكوم اللوحي',
      'fa': 'تبلت Wacom',
    },
    '5qcpt11i': {
      'en': 'Macbook',
      'ar': 'ماك بوك',
      'fa': 'مک بوک',
    },
    '7mvkyyqd': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Search
  {
    '3aze63c9': {
      'en': 'Search',
      'ar': 'يبحث',
      'fa': 'جستجو کنید',
    },
    '97qd905t': {
      'en': 'Sorry.',
      'ar': 'آسف.',
      'fa': 'متاسفم',
    },
    't277na8q': {
      'en': 'Your search has no results!',
      'ar': 'بحثك ليس له نتائج!',
      'fa': 'جستجوی شما نتیجه ای ندارد!',
    },
    'hzf0rkv7': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // ProductDetail
  {
    '0gfc1ja9': {
      'en': 'Market',
      'ar': 'سوق',
      'fa': 'بازار',
    },
    'rzc0b1q4': {
      'en': 'Color:',
      'ar': 'لون:',
      'fa': 'رنگ:',
    },
    'khvf3jnc': {
      'en': 'Capacity:',
      'ar': 'سعة:',
      'fa': 'ظرفیت:',
    },
    'uq94dbua': {
      'en': 'Size:',
      'ar': 'مقاس:',
      'fa': 'اندازه:',
    },
    'gikaaf39': {
      'en': 'Description',
      'ar': 'وصف',
      'fa': 'توضیحات',
    },
    'qfocognr': {
      'en': 'Reviews',
      'ar': 'المراجعات',
      'fa': 'بررسی ها',
    },
    'vigd3obx': {
      'en': 'Return Policy: ',
      'ar': 'سياسة العائدات:',
      'fa': 'سیاست بازگشت:',
    },
    'f29zkzjt': {
      'en': 'Warranty: ',
      'ar': 'ضمان:',
      'fa': 'گارانتی:',
    },
    '5xk4skg2': {
      'en':
          'Fully Automatic Front Load Washing Machines have Great Wash Quality with very less running cost',
      'ar':
          'تتميز الغسالات الأوتوماتيكية بالكامل ذات التحميل الأمامي بجودة غسيل رائعة مع تكلفة تشغيل منخفضة للغاية',
      'fa':
          'ماشین‌های لباسشویی تمام اتوماتیک درب جلو دارای کیفیت شستشوی عالی با هزینه بسیار کمتر هستند',
    },
    'oglekf60': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'fa': 'جزئیات',
    },
    'ec6wpmyv': {
      'en': 'Brand',
      'ar': 'ماركة',
      'fa': 'نام تجاری',
    },
    'p2b88x52': {
      'en': 'Long Sleeves',
      'ar': 'أكمام طويلة',
      'fa': 'آستین بلند',
    },
    'lnjo09ib': {
      'en': 'Model Name',
      'ar': 'اسم الموديل',
      'fa': 'نام مدل',
    },
    '8v93r4kf': {
      'en': 'WW60R20GLMA/TL',
      'ar': 'WW60R20GLMA/TL',
      'fa': 'WW60R20GLMA/TL',
    },
    'klc4ij4d': {
      'en': 'Function Type',
      'ar': 'نوع الوظيفة',
      'fa': 'نوع تابع',
    },
    'xrf4j8ck': {
      'en': 'Fully Automatic Front',
      'ar': 'أمامية أوتوماتيكية بالكامل',
      'fa': 'جلو تمام اتوماتیک',
    },
    '5k7joq9l': {
      'en': 'Enerjgy Rating',
      'ar': 'تقييم الطاقة',
      'fa': 'رتبه بندی انرژی',
    },
    'dhlza4zf': {
      'en': '5',
      'ar': '5',
      'fa': '5',
    },
    'i4o31blr': {
      'en': 'Washing Capacity',
      'ar': 'سعة الغسيل',
      'fa': 'ظرفیت شستشو',
    },
    '0u9u34v8': {
      'en': '6 kg',
      'ar': '6 كجم',
      'fa': '6 کیلوگرم',
    },
    '6g1mb4no': {
      'en': 'Washing Method',
      'ar': 'طريقة الغسيل',
      'fa': 'روش شستشو',
    },
    '45qg3ty9': {
      'en': 'Tumble',
      'ar': 'تعثر',
      'fa': 'غلت زدن',
    },
    'bxquf0fm': {
      'en': 'Color',
      'ar': 'لون',
      'fa': 'رنگ',
    },
    'svrfh56f': {
      'en': 'White',
      'ar': 'أبيض',
      'fa': 'سفید',
    },
    'usmawiyi': {
      'en': 'Water Level Selector',
      'ar': 'محدد مستوى المياه',
      'fa': 'انتخابگر سطح آب',
    },
    'agl10mr3': {
      'en': 'Regular',
      'ar': 'عادي',
      'fa': 'منظم',
    },
    '4698k8sv': {
      'en': 'Shade',
      'ar': 'ظل',
      'fa': 'سایه',
    },
    'ncgixqeg': {
      'en': 'White',
      'ar': 'أبيض',
      'fa': 'سفید',
    },
    'baydwfvr': {
      'en': 'Technology Used',
      'ar': 'التكنولوجيا المستخدمة',
      'fa': 'تکنولوژی مورد استفاده',
    },
    'gtgwndlo': {
      'en': 'Yes',
      'ar': 'نعم',
      'fa': 'بله',
    },
    'j08zo9wl': {
      'en': 'In-built Heater\n',
      'ar': 'سخان مدمج',
      'fa': 'بخاری داخلی',
    },
    'ihlc05p9': {
      'en': 'Digital Inverter',
      'ar': 'العاكس الرقمي',
      'fa': 'اینورتر دیجیتال',
    },
    'jicswwsm': {
      'en': 'Warranty Summary',
      'ar': 'ملخص الضمان',
      'fa': 'خلاصه گارانتی',
    },
    'qv24etj2': {
      'en': '3 Years ',
      'ar': '3 سنوات',
      'fa': '3 سال',
    },
    '6cnzoi11': {
      'en': 'Ratings & Reviews',
      'ar': 'التقييمات والمراجعات',
      'fa': 'رتبه بندی ها و نظرات',
    },
    'j71dc4xr': {
      'en': 'View All',
      'ar': 'عرض الكل',
      'fa': 'مشاهده همه',
    },
    'c3mufbxj': {
      'en': 'Leave a Review',
      'ar': 'اترك تعليقا',
      'fa': 'نظر بدهید',
    },
    'mlcpxoet': {
      'en': 'Most Helpful',
      'ar': 'الأكثر إفادة',
      'fa': 'مفیدترین',
    },
    'o67vbor8': {
      'en': 'Only with photos',
      'ar': 'فقط بالصور',
      'fa': 'فقط با عکس',
    },
    'tf1zvz8y': {
      'en': 'Related Products',
      'ar': 'المنتجات ذات الصلة',
      'fa': 'محصولات مرتبط',
    },
    'op1qfm50': {
      'en': 'Suggested Advertised Products',
      'ar': 'المنتجات المعلن عنها المقترحة',
      'fa': 'محصولات تبلیغاتی پیشنهادی',
    },
    'nqjp0yn7': {
      'en': 'ADD TO CART',
      'ar': 'أضف إلى السلة',
      'fa': 'افزودن به سبد خرید',
    },
    'foifxxua': {
      'en': 'Added!',
      'ar': 'تمت الإضافة!',
      'fa': 'اضافه شد!',
    },
    'o90l5rna': {
      'en': 'Product is added to your cart.',
      'ar': 'تمت إضافة المنتج إلى سلة التسوق الخاصة بك.',
      'fa': 'محصول به سبد خرید شما اضافه شد',
    },
    'm101tp79': {
      'en': 'Sold Out',
      'ar': 'نفذ',
      'fa': 'فروخته شد',
    },
    '5t98199s': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // RatingsReviews
  {
    '91nvl6ii': {
      'en': 'Ratings & Reviews',
      'ar': 'التقييمات والمراجعات',
      'fa': 'رتبه بندی ها و نظرات',
    },
    'qldrbdrx': {
      'en': 'Ratings & Reviews',
      'ar': 'التقييمات والمراجعات',
      'fa': 'رتبه بندی ها و نظرات',
    },
    '1q1dii4w': {
      'en': 'Leave a Review',
      'ar': 'اترك تعليقا',
      'fa': 'نظر بدهید',
    },
    'h3bjl2p8': {
      'en': 'Most Helpful',
      'ar': 'الأكثر إفادة',
      'fa': 'مفیدترین',
    },
    'vx64qejh': {
      'en': 'Only with photos',
      'ar': 'فقط بالصور',
      'fa': 'فقط با عکس',
    },
    'tj6c0jj3': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // FeedBack
  {
    'vnpdlvgq': {
      'en': 'Feedback',
      'ar': 'تعليق',
      'fa': 'بازخورد',
    },
    'q9x664uf': {
      'en': 'Title',
      'ar': 'عنوان',
      'fa': 'عنوان',
    },
    'bn2gylam': {
      'en': 'Comment',
      'ar': 'تعليق',
      'fa': 'نظر دهید',
    },
    'q1y44iv0': {
      'en': 'SUBMIT',
      'ar': 'يُقدِّم',
      'fa': 'ارسال کنید',
    },
    '1ji41nml': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // EditProfile
  {
    'aghmmphc': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'fa': 'نمایه کامل',
    },
    'xuzdev7z': {
      'en': 'Name',
      'ar': 'اسم',
      'fa': 'نام',
    },
    'd0yu0gjn': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
      'fa': 'نام خانوادگی',
    },
    'x9hi2ojh': {
      'en': 'Choice a unique user name',
      'ar': 'اختيار اسم مستخدم فريد',
      'fa': 'یک نام کاربری منحصر به فرد انتخاب کنید',
    },
    'i0eq9vvx': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
      'fa': 'نام کاربری',
    },
    '1oe2sfmb': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fa': 'ایمیل',
    },
    'tq3kjp0d': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
      'fa': 'شماره تلفن',
    },
    '1khd2tqz': {
      'en': 'Male',
      'ar': 'ذكر',
      'fa': 'مرد',
    },
    '1abex2l6': {
      'en': 'Female',
      'ar': 'أنثى',
      'fa': 'مونث',
    },
    'o36g9br7': {
      'en': 'Other',
      'ar': 'آخر',
      'fa': 'دیگر',
    },
    'ikemzyoy': {
      'en': 'Gender',
      'ar': 'جنس',
      'fa': 'جنسیت',
    },
    'kggn9sqc': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'fa': 'جستجو برای یک مورد ...',
    },
    'ebucavkd': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'lpvnq0yo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'uuyszii6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    '7ovttnja': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'hm32un01': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    't7edyw5o': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'l0bhqdac': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'urydlm9c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '8fic2o7v': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'yp748kxg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'rkb5jiq8': {
      'en': 'Update',
      'ar': 'تحديث',
      'fa': 'به روز رسانی',
    },
    'mxep9fl0': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // HelpCenter
  {
    'ib99zku6': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'fa': 'مرکز راهنمایی',
    },
    '7qb69jdl': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'fa': 'سوالات متداول',
    },
    'xzcg6pae': {
      'en': 'General Support Tips',
      'ar': 'نصائح الدعم العامة',
      'fa': 'نکات پشتیبانی عمومی',
    },
    '8wbz05yl': {
      'en': 'Refudn policy',
      'ar': 'سياسة الرفض',
      'fa': 'سیاست بازپرداخت',
    },
    'rjkv8qr9': {
      'en': 'Starting to buy',
      'ar': 'البدء في الشراء',
      'fa': 'شروع به خرید کرد',
    },
    'tzdtm550': {
      'en': 'How to get help',
      'ar': 'كيفية الحصول على المساعدة',
      'fa': 'چگونه می توان کمک گرفت',
    },
    'vlpij65p': {
      'en': 'General Support Tips',
      'ar': 'نصائح الدعم العامة',
      'fa': 'نکات پشتیبانی عمومی',
    },
    'wp0p4rpy': {
      'en': 'Which post service?',
      'ar': 'أي خدمة بريدية؟',
      'fa': 'کدوم سرویس پست؟',
    },
    'ffyttx1t': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
      'fa': 'تماس با ما',
    },
    '79065lw6': {
      'en': 'Customer Service',
      'ar': 'خدمة العملاء',
      'fa': 'خدمات مشتری',
    },
    'op8p10bo': {
      'en': 'Support',
      'ar': 'يدعم',
      'fa': 'پشتیبانی کنید',
    },
    'n34m6h75': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
      'fa': 'تماس با ما',
    },
    'hos00pka': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // ShippingMethod
  {
    '8vl05jsx': {
      'en': 'Shipping Method',
      'ar': 'طريقة الشحن',
      'fa': 'روش حمل و نقل',
    },
    'rq6kb5jr': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Orders
  {
    'oohpqxee': {
      'en': 'My Orders',
      'ar': 'طلبياتي',
      'fa': 'سفارشات من',
    },
    'a18t5x6y': {
      'en': 'InProgress',
      'ar': 'في تَقَدم',
      'fa': 'در حال پیشرفت',
    },
    'nrk4lzax': {
      'en': 'Completed',
      'ar': 'مكتمل',
      'fa': 'تکمیل شد',
    },
    'yy21d6mh': {
      'en': 'Canceled',
      'ar': 'تم الإلغاء',
      'fa': 'لغو شد',
    },
    '5hqcid9i': {
      'en': 'All',
      'ar': 'الجميع',
      'fa': 'همه',
    },
    '91ghekgh': {
      'en': 'You don\'t have any order yet.',
      'ar': 'ليس لديك أي طلب حتى الآن.',
      'fa': 'شما هنوز سفارشی ندارید',
    },
    'sp5fp2w1': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Privacy
  {
    '6f5zrc1r': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fa': 'سیاست حفظ حریم خصوصی',
    },
    'c297fxx7': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Language
  {
    'nkldex0c': {
      'en': 'Language',
      'ar': 'لغة',
      'fa': 'زبان',
    },
    'xs49x655': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // NotificatinSetting
  {
    'j5zsc19a': {
      'en': 'Notificatin Setting',
      'ar': 'إعدادات الإشعارات',
      'fa': 'تنظیم اعلان',
    },
    'lyi4kt6m': {
      'en': 'Configure Notification',
      'ar': 'تكوين الإشعارات',
      'fa': 'اعلان را پیکربندی کنید',
    },
    'aposu1ca': {
      'en': 'General Notification',
      'ar': 'إشعار عام',
      'fa': 'اطلاعیه عمومی',
    },
    '7pzq3iyf': {
      'en': 'Sound',
      'ar': 'صوت',
      'fa': 'صدا',
    },
    'mvdzo4c6': {
      'en': 'Vibrate',
      'ar': 'تذبذب',
      'fa': 'لرزش',
    },
    'qzqvctc3': {
      'en': 'Special Offers',
      'ar': 'العروض الخاصة',
      'fa': 'پیشنهادات ویژه',
    },
    'ofvykhy3': {
      'en': 'Promo & Discount',
      'ar': 'العروض الترويجية والخصومات',
      'fa': 'تبلیغات و تخفیف',
    },
    'vk03u9s6': {
      'en': 'Payments',
      'ar': 'المدفوعات',
      'fa': 'پرداخت ها',
    },
    'yqi66vx7': {
      'en': 'Cashback',
      'ar': 'استرداد النقود',
      'fa': 'برگشت نقدی',
    },
    'lycjf659': {
      'en': 'App Updates',
      'ar': 'تحديثات التطبيق',
      'fa': 'به روز رسانی برنامه',
    },
    '0di9hgf2': {
      'en': 'New Service Available',
      'ar': 'خدمة جديدة متاحة',
      'fa': 'سرویس جدید در دسترس است',
    },
    '9i0d2ayc': {
      'en': 'New Tips Available',
      'ar': 'نصائح جديدة متاحة',
      'fa': 'نکات جدید در دسترس است',
    },
    'frslwo8x': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Setting
  {
    'akr23z23': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fa': 'وارد شوید',
    },
    'k63e1xs9': {
      'en': 'Signup',
      'ar': 'اشتراك',
      'fa': 'ثبت نام کنید',
    },
    '4qjpya8h': {
      'en': 'Customer Support',
      'ar': 'دعم العملاء',
      'fa': 'پشتیبانی مشتری',
    },
    'lv7ivg2j': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fa': 'ویرایش نمایه',
    },
    '0u3lq928': {
      'en': 'Orders',
      'ar': 'طلبات',
      'fa': 'سفارشات',
    },
    'gjyxrm8i': {
      'en': 'Manage Address',
      'ar': 'إدارة العنوان',
      'fa': 'مدیریت آدرس',
    },
    'm857msi9': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'fa': 'روش های پرداخت',
    },
    '8ne2iv94': {
      'en': 'Shipping Methods',
      'ar': 'طرق الشحن',
      'fa': 'روش های حمل و نقل',
    },
    'ane006qe': {
      'en': 'Notification Setting',
      'ar': 'إعداد الإشعارات',
      'fa': 'تنظیم اعلان',
    },
    '9nyt7q34': {
      'en': 'Country',
      'ar': 'دولة',
      'fa': 'کشور',
    },
    'nks8i0bm': {
      'en': 'Language',
      'ar': 'لغة',
      'fa': 'زبان',
    },
    'm12vb62i': {
      'en': 'English (US)',
      'ar': 'الإنجليزية (الولايات المتحدة)',
      'fa': 'انگلیسی (ایالات متحده)',
    },
    'swdcz12e': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'fa': 'حالت تاریک',
    },
    'dq2nu91h': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fa': 'سیاست حفظ حریم خصوصی',
    },
    'wqoya4id': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'fa': 'مرکز راهنمایی',
    },
    'qe65e7nb': {
      'en': 'Share With Friends',
      'ar': 'شارك مع الأصدقاء',
      'fa': 'با دوستان به اشتراک بگذارید',
    },
    'now4ob1r': {
      'en': 'Follow us on ',
      'ar': 'تابعونا على',
      'fa': 'ما را دنبال کنید',
    },
    'jjlx0njo': {
      'en': 'Delete Accoun',
      'ar': 'تسجيل الخروج',
      'fa': 'خروج از سیستم',
    },
    'pkkl1lnu': {
      'en': 'Warning!',
      'ar': '',
      'fa': '',
    },
    'hzotb4db': {
      'en': 'Logout',
      'ar': '',
      'fa': '',
    },
    '80oqv6lu': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // OrderDetails
  {
    '6g5fb2pg': {
      'en': 'Order Details',
      'ar': 'تفاصيل الطلب',
      'fa': 'جزئیات سفارش',
    },
    'uenoxwok': {
      'en': 'Contact',
      'ar': 'اتصال',
      'fa': 'تماس بگیرید',
    },
    '5ilz0fyq': {
      'en': 'Products Price',
      'ar': 'سعر المنتجات',
      'fa': 'قیمت محصولات',
    },
    'efqrqef7': {
      'en': 'Shipping Fees',
      'ar': 'رسوم الشحن',
      'fa': 'هزینه های حمل و نقل',
    },
    'ivitb2om': {
      'en': 'Total',
      'ar': 'المجموع',
      'fa': 'مجموع',
    },
    'l3cqkot7': {
      'en': 'Go to Checkout',
      'ar': 'انتقل إلى الخروج',
      'fa': 'به Checkout بروید',
    },
    'chj7iz7w': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Addresses
  {
    'q9hh6xpf': {
      'en': 'Addresses',
      'ar': 'العناوين',
      'fa': 'آدرس ها',
    },
    'dtrsw49q': {
      'en': 'Your addresses',
      'ar': 'عناوينك',
      'fa': 'آدرس های شما',
    },
    '8fuhn301': {
      'en': 'No address!',
      'ar': 'لا يوجد عنوان!',
      'fa': 'بدون آدرس!',
    },
    'n1y2zzre': {
      'en': 'You can manage your addresses here.',
      'ar': 'يمكنك إدارة عناوينك هنا.',
      'fa': 'می توانید آدرس های خود را در اینجا مدیریت کنید.',
    },
    'qllndhzn': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'fa': 'اضافه کردن آدرس جدید',
    },
    'tg7hv5ts': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Control
  {
    'acaewof4': {
      'en': 'Loading your information...',
      'ar': '',
      'fa': '',
    },
    'jdfzeush': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Stores
  {
    'ojx6tkoy': {
      'en': 'Stores',
      'ar': 'المتاجر',
      'fa': 'فروشگاه ها',
    },
    'r729njxm': {
      'en': 'Brands',
      'ar': 'العلامات التجارية',
      'fa': 'برندها',
    },
    '5nczj29i': {
      'en': 'Pages',
      'ar': 'الصفحات',
      'fa': 'صفحات',
    },
    'q2646ayz': {
      'en': 'Sorry!',
      'ar': 'آسف!',
      'fa': 'متاسفم!',
    },
    'r1893h74': {
      'en': 'There is no available brand in your area!',
      'ar': 'لا يوجد علامة تجارية متاحة في منطقتك!',
      'fa': 'هیچ برندی در منطقه شما موجود نیست!',
    },
    '1msumiqx': {
      'en': 'Sorry!',
      'ar': 'آسف!',
      'fa': 'متاسفم!',
    },
    'm8lzvja7': {
      'en': 'There is no available market in your area!',
      'ar': 'لا يوجد سوق متاح في منطقتك!',
      'fa': 'هیچ بازاری در منطقه شما وجود ندارد!',
    },
    'tih1eidp': {
      'en': 'Stores',
      'ar': 'المتاجر',
      'fa': 'فروشگاه ها',
    },
    '3jr695bw': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Categories
  {
    'qe6onoo4': {
      'en': 'Categories',
      'ar': 'فئات',
      'fa': 'دسته بندی ها',
    },
    '32agg2q1': {
      'en': 'Sorry!',
      'ar': 'آسف!',
      'fa': 'متاسفم!',
    },
    '7qzsn9r3': {
      'en': 'There is no available market in your area!',
      'ar': 'لا يوجد سوق متاح في منطقتك!',
      'fa': 'هیچ بازاری در منطقه شما وجود ندارد!',
    },
    'ot6vxz23': {
      'en': 'Sorry!',
      'ar': 'آسف!',
      'fa': 'متاسفم!',
    },
    'ky7uc4i6': {
      'en': 'There is no available market in your area!',
      'ar': 'لا يوجد سوق متاح في منطقتك!',
      'fa': 'هیچ بازاری در منطقه شما وجود ندارد!',
    },
    '2skp4dhb': {
      'en': 'Categories',
      'ar': 'فئات',
      'fa': 'دسته بندی ها',
    },
    'mcfm99bz': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Brands
  {
    'koci1n5x': {
      'en': 'Brands',
      'ar': 'العلامات التجارية',
      'fa': 'برندها',
    },
    'z6bsloz7': {
      'en': 'Sorry!',
      'ar': 'آسف!',
      'fa': 'متاسفم!',
    },
    '076dcrmf': {
      'en': 'There is no available market in your area!',
      'ar': 'لا يوجد سوق متاح في منطقتك!',
      'fa': 'هیچ بازاری در منطقه شما وجود ندارد!',
    },
    '3d8xd5hr': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Terms
  {
    'i8vngblc': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fa': 'سیاست حفظ حریم خصوصی',
    },
    'z55vk7qc': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // ProductsCategory
  {
    'q6exawo9': {
      'en': 'There is no product in this category!',
      'ar': 'لا يوجد منتج في هذه الفئة!',
      'fa': 'هیچ محصولی در این دسته وجود ندارد!',
    },
    'wd7w9vg1': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Stars
  {
    '1cxeu42f': {
      'en': 'Stars',
      'ar': 'النجوم',
      'fa': 'ستاره ها',
    },
    'k32zbmon': {
      'en': 'Men',
      'ar': 'الرجال',
      'fa': 'مردان',
    },
    'l504u95w': {
      'en': 'Women',
      'ar': 'نحيف',
      'fa': 'زنان',
    },
    '3ed2ruqb': {
      'en': 'All',
      'ar': 'الجميع',
      'fa': 'همه',
    },
    'zwop1v6n': {
      'en': 'Men',
      'ar': 'الرجال',
      'fa': 'مردان',
    },
    'niha6r6n': {
      'en': 'Women',
      'ar': 'نحيف',
      'fa': 'زنان',
    },
    '49mq422u': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // WalletHistory
  {
    'gvyi92ma': {
      'en': 'Wallet History',
      'ar': 'تاريخ المحفظة',
      'fa': 'تاریخچه کیف پول',
    },
    'l8jworn3': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // StoreFront
  {
    'qeceyuw7': {
      'en': 'There is no product.',
      'ar': 'لا يوجد منتج.',
      'fa': 'هیچ محصولی وجود ندارد.',
    },
    '3ap39mgk': {
      'en': 'There is no product.',
      'ar': 'لا يوجد منتج.',
      'fa': 'هیچ محصولی وجود ندارد.',
    },
    '8yiwqji8': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // DeliveryLogin
  {
    '2leo6ajh': {
      'en': 'Welcome',
      'ar': 'مرحباً',
      'fa': 'خوش آمدید',
    },
    'yh0al0wx': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fa': 'ایمیل',
    },
    'nnjrn69i': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fa': 'رمز عبور',
    },
    'h34nd8s2': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'fa': 'رمز عبور را فراموش کرده اید؟',
    },
    'hwro55hh': {
      'en': 'LOG IN',
      'ar': 'تسجيل الدخول',
      'fa': 'وارد شوید',
    },
    '3jrxwytl': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    '9acbapfe': {
      'en': 'Enter Valid Email!',
      'ar': 'أدخل بريد إلكتروني صالح!',
      'fa': 'ایمیل معتبر وارد کنید',
    },
    'zpggu4ys': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'rjq559m5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'czzba6wx': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'tyg4qv91': {
      'en': 'Don’t have an account? ',
      'ar': 'ليس لديك حساب؟',
      'fa': 'حساب کاربری ندارید؟',
    },
    'q84jm0aq': {
      'en': 'Register',
      'ar': 'يسجل',
      'fa': 'ثبت نام کنید',
    },
    'vdidpx2l': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // DeliverySignup
  {
    '94w3qzk5': {
      'en': 'Welcome',
      'ar': 'مرحباً',
      'fa': 'خوش آمدید',
    },
    'b6ku8pdn': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'fa': 'نام کامل',
    },
    '1kthd28o': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fa': 'ایمیل',
    },
    '7xi2189m': {
      'en': 'Create Password',
      'ar': 'إنشاء كلمة المرور',
      'fa': 'رمز عبور ایجاد کنید',
    },
    'kodkbhxf': {
      'en': 'By joining you are agree to our ',
      'ar': 'من خلال الانضمام فإنك توافق على شروطنا',
      'fa': 'با عضویت شما با ما موافقت می کنید',
    },
    '37gvpxey': {
      'en': 'Terms of Service ',
      'ar': 'شروط الخدمة',
      'fa': 'شرایط خدمات',
    },
    'tiho3z55': {
      'en': 'and ',
      'ar': 'و',
      'fa': 'و',
    },
    '9rn0e1ih': {
      'en': 'Privacy Policy.',
      'ar': 'سياسة الخصوصية.',
      'fa': 'سیاست حفظ حریم خصوصی.',
    },
    'l8pbxt7r': {
      'en': 'REGISTER',
      'ar': 'يسجل',
      'fa': 'ثبت نام کنید',
    },
    '94ps9fri': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'vkp2w354': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '3jcqa1lt': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'r2h6k7lh': {
      'en': 'Ener Valid Email!',
      'ar': 'الآن بريدك الإلكتروني صالح!',
      'fa': 'ایمیل معتبر را وارد کنید!',
    },
    'ns8s5xpv': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'af3a6em7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'eclsrv56': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'n5w39pwz': {
      'en': 'Have an account? ',
      'ar': 'هل لديك حساب؟',
      'fa': 'حساب کاربری دارید؟',
    },
    'hus6q8qr': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'fa': 'وارد شوید',
    },
    'c6u8jbx9': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // DeliveryHome
  {
    'qsb466fp': {
      'en': 'Available Orders',
      'ar': 'الطلبات المتاحة',
      'fa': 'سفارشات موجود',
    },
    'fedj9fib': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
    'tkgejvzj': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // DeliveryHistory
  {
    'xvnf9xur': {
      'en': 'Delivery History',
      'ar': 'تاريخ التسليم',
      'fa': 'تاریخچه تحویل',
    },
    'efq32kvm': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // DeliveryAccount
  {
    'uaybgmt2': {
      'en': 'Customer Support',
      'ar': 'دعم العملاء',
      'fa': 'پشتیبانی مشتری',
    },
    'uusmmf1x': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fa': 'ویرایش نمایه',
    },
    'pyxffg8q': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'fa': 'روش های پرداخت',
    },
    '9kc6rtvp': {
      'en': 'Notification Setting',
      'ar': 'إعداد الإشعارات',
      'fa': 'تنظیم اعلان',
    },
    'sn0el9uy': {
      'en': 'Country',
      'ar': 'دولة',
      'fa': 'کشور',
    },
    'mgczheqz': {
      'en': 'Language',
      'ar': 'لغة',
      'fa': 'زبان',
    },
    'g71uj0xb': {
      'en': 'English (US)',
      'ar': 'الإنجليزية (الولايات المتحدة)',
      'fa': 'انگلیسی (ایالات متحده)',
    },
    'vljnxi2b': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'fa': 'حالت تاریک',
    },
    'f2eut7i0': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fa': 'سیاست حفظ حریم خصوصی',
    },
    'ieilcjqs': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'fa': 'مرکز راهنمایی',
    },
    'ta3wf7mr': {
      'en': 'Share With Friends',
      'ar': 'شارك مع الأصدقاء',
      'fa': 'با دوستان به اشتراک بگذارید',
    },
    'xgzeu57x': {
      'en': 'Consumer Application',
      'ar': 'تطبيق المستهلك',
      'fa': 'برنامه مصرف کننده',
    },
    '9ax0bmyv': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
      'fa': 'خروج از سیستم',
    },
    'ccve1mpx': {
      'en': 'Account',
      'ar': 'حساب',
      'fa': 'حساب',
    },
    'e13xcpjn': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // Favorites
  {
    'lged1lff': {
      'en': 'Favorites',
      'ar': 'المفضلة',
      'fa': 'موارد دلخواه',
    },
    '8rlv9bsq': {
      'en': 'Your Favorite Products',
      'ar': 'منتجاتك المفضلة',
      'fa': 'محصولات مورد علاقه شما',
    },
    'hd4yj7a0': {
      'en': 'No favorites yet!',
      'ar': 'لا يوجد مفضلة حتى الآن!',
      'fa': 'هنوز موارد دلخواه وجود ندارد!',
    },
    '8m37z2ps': {
      'en': 'You can add a favorite product to see it in this list.',
      'ar': 'يمكنك إضافة منتجك المفضل لرؤيته في هذه القائمة.',
      'fa':
          'برای مشاهده آن در این لیست می توانید محصول مورد علاقه خود را اضافه کنید.',
    },
    'sz4u7bi8': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // ReviewConfirmation
  {
    '682lizt3': {
      'en': 'Review Successful',
      'ar': 'تمت المراجعة بنجاح',
      'fa': 'بررسی موفقیت آمیز بود',
    },
    'ubittld0': {
      'en': 'Thanks for your review!',
      'ar': 'شكرا لمراجعتك!',
      'fa': 'با تشکر از بررسی شما!',
    },
    'jntd90tm': {
      'en': 'Back to Product Page',
      'ar': 'العودة إلى صفحة المنتج',
      'fa': 'بازگشت به صفحه محصول',
    },
    'ze6cs842': {
      'en': 'Go to Homepage',
      'ar': 'انتقل إلى الصفحة الرئيسية',
      'fa': 'به صفحه اصلی بروید',
    },
    '9j34h6cb': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // SuccessfulPayment
  {
    'kgrz3v9j': {
      'en': 'Payment',
      'ar': 'قسط',
      'fa': 'پرداخت',
    },
    't7fbuvno': {
      'en': 'Payment successful',
      'ar': 'تم الدفع بنجاح',
      'fa': 'پرداخت با موفقیت انجام شد',
    },
    'g456xjd2': {
      'en': 'Your payment has been successfully completed!',
      'ar': 'لقد تم إكمال الدفع بنجاح!',
      'fa': 'پرداخت شما با موفقیت انجام شد!',
    },
    'x312kqyp': {
      'en': 'Homepage',
      'ar': 'الصفحة الرئيسية',
      'fa': 'صفحه اصلی',
    },
    '5750qy82': {
      'en': 'Show orders',
      'ar': 'عرض الطلبات',
      'fa': 'نمایش سفارشات',
    },
    'olt91hik': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // FIBPayment
  {
    'i9e05gg4': {
      'en': 'Please select the payment method.',
      'ar': 'الرجاء اختيار طريقة الدفع.',
      'fa': 'لطفا روش پرداخت را انتخاب کنید.',
    },
    'ai8yzttf': {
      'en': 'Payment',
      'ar': 'قسط',
      'fa': 'پرداخت',
    },
    'iyiilib6': {
      'en': 'Personal',
      'ar': 'شخصي',
      'fa': 'شخصی',
    },
    'rrbk5tma': {
      'en': 'Business',
      'ar': 'عمل',
      'fa': 'تجارت',
    },
    'qs9s634f': {
      'en': 'Corporate',
      'ar': 'شركة كبرى',
      'fa': 'شرکتی',
    },
    'cf02xvsu': {
      'en': 'Pay With FIB',
      'ar': 'الدفع باستخدام FIB',
      'fa': 'پرداخت با FIB',
    },
    '8ss28lvh': {
      'en': 'Cancel payment process',
      'ar': 'إلغاء عملية الدفع',
      'fa': 'لغو فرآیند پرداخت',
    },
    'wvjsui59': {
      'en': 'Pay Later',
      'ar': 'ادفع لاحقا',
      'fa': 'بعدا پرداخت کنید',
    },
    'a2nuq8pv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'hmz9fqqz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'fpl8m172': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    'ahefxx37': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'yy9m3ygd': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // PaymentConfirmation
  {
    'r5bqzmir': {
      'en': 'Payment Successful',
      'ar': 'تم الدفع بنجاح',
      'fa': 'پرداخت با موفقیت انجام شد',
    },
    'la2vtks0': {
      'en': 'Your payment has been successful.',
      'ar': 'لقد تم الدفع بنجاح.',
      'fa': 'پرداخت شما با موفقیت انجام شد.',
    },
    'hlplg60e': {
      'en': 'Go to Homepage',
      'ar': 'انتقل إلى الصفحة الرئيسية',
      'fa': 'به صفحه اصلی بروید',
    },
    'gb4z2dbr': {
      'en': 'Go to My Cart',
      'ar': 'انتقل إلى سلة التسوق الخاصة بي',
      'fa': 'به سبد خرید من بروید',
    },
    'u4bupu10': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // AddDomesticAddress
  {
    'utu4bnnr': {
      'en': 'Street Number',
      'ar': 'رقم الشارع',
      'fa': 'شماره خیابان',
    },
    '0d88sxa2': {
      'en': 'Building name',
      'ar': 'اسم المبنى',
      'fa': 'نام ساختمان',
    },
    'iusgedrt': {
      'en': 'Floor',
      'ar': 'أرضية',
      'fa': 'طبقه',
    },
    '8ivpfwda': {
      'en': 'Unit',
      'ar': 'وحدة',
      'fa': 'واحد',
    },
    's3jsa60q': {
      'en': 'Address owner phone number',
      'ar': 'عنوان صاحب رقم الهاتف',
      'fa': 'آدرس شماره تلفن مالک',
    },
    'qvgtqnal': {
      'en': 'Address owner email address',
      'ar': 'عنوان البريد الإلكتروني لصاحب العنوان',
      'fa': 'آدرس ایمیل مالک آدرس',
    },
    'nvhgz5s1': {
      'en': 'Address Label',
      'ar': 'ملصق العنوان',
      'fa': 'برچسب آدرس',
    },
    'xat0yh0j': {
      'en': 'Address Note',
      'ar': 'ملاحظة العنوان',
      'fa': 'یادداشت آدرس',
    },
    'u1p0p9ow': {
      'en': 'Save and continue',
      'ar': 'حفظ ومتابعة',
      'fa': 'ذخیره کنید و ادامه دهید',
    },
    '3uhpyezy': {
      'en': 'Error!',
      'ar': 'خطأ!',
      'fa': 'خطا!',
    },
    'mjbnqery': {
      'en': 'The email you entered is not valid.',
      'ar': 'البريد الإلكتروني الذي أدخلته غير صالح.',
      'fa': 'ایمیلی که وارد کردید معتبر نیست.',
    },
    'rhayxtn2': {
      'en': 'Invalid address!',
      'ar': 'عنوان غير صالح!',
      'fa': 'آدرس نامعتبر است!',
    },
    'gy2vfnh1': {
      'en': 'Delivery is only possible to the addresses within Iraq.',
      'ar': 'التسليم ممكن فقط إلى العناوين داخل العراق.',
      'fa': 'تحویل فقط به آدرس های داخل عراق امکان پذیر است.',
    },
    '5xtxgnjn': {
      'en': 'Field is required',
      'ar': '',
      'fa': '',
    },
    '6j8ep55y': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fa': '',
    },
    'jbidw6p4': {
      'en': 'Field is required',
      'ar': '',
      'fa': '',
    },
    '9v3b2bed': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fa': '',
    },
    '5tysv1vz': {
      'en': 'Field is required',
      'ar': '',
      'fa': '',
    },
    '5h4whrxn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fa': '',
    },
    '3hf6zn7f': {
      'en': 'Field is required',
      'ar': '',
      'fa': '',
    },
    'lcbuwzzo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fa': '',
    },
    '8mjpmfrf': {
      'en': 'Field is required',
      'ar': '',
      'fa': '',
    },
    'iawsr5ab': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fa': '',
    },
    'nwgisut6': {
      'en': 'Field is required',
      'ar': '',
      'fa': '',
    },
    '3zp1r5x9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fa': '',
    },
    'yun170nj': {
      'en': 'Field is required',
      'ar': '',
      'fa': '',
    },
    'd1oaa1uk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fa': '',
    },
    'd632kv3t': {
      'en': 'Field is required',
      'ar': '',
      'fa': '',
    },
    '6rs1g8xc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fa': '',
    },
    'p5z062yj': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
  },
  // CartItem
  {
    'amntffow': {
      'en': 'Confirm!',
      'ar': 'يتأكد!',
      'fa': 'تایید کنید!',
    },
    '0w5bhe66': {
      'en': 'You sure you want to remove the product from your cart?',
      'ar': 'هل أنت متأكد أنك تريد إزالة المنتج من سلة التسوق الخاصة بك؟',
      'fa': 'آیا مطمئن هستید که می خواهید محصول را از سبد خرید خود حذف کنید؟',
    },
    'bzz1vsjq': {
      'en': 'Yes, Remove',
      'ar': 'نعم، قم بإزالة',
      'fa': 'بله، حذف کنید',
    },
    'twjbyt8b': {
      'en': 'Add note special request',
      'ar': 'إضافة ملاحظة طلب خاص',
      'fa': 'درخواست ویژه یادداشت اضافه کنید',
    },
    'k8rfldaj': {
      'en': '',
      'ar': '',
      'fa': '',
    },
    '923svstl': {
      'en': 'special request',
      'ar': 'طلب خاص',
      'fa': 'درخواست ویژه',
    },
  },
  // NavBar
  {
    'x0waiw5y': {
      'en': 'Stores',
      'ar': 'المتاجر',
      'fa': 'فروشگاه ها',
    },
    'g85460uu': {
      'en': 'Stars',
      'ar': 'النجوم',
      'fa': 'ستاره ها',
    },
    'i81l6pdr': {
      'en': 'Categories',
      'ar': 'فئات',
      'fa': 'دسته بندی ها',
    },
    's4f8om5t': {
      'en': 'Account',
      'ar': 'حساب',
      'fa': 'حساب',
    },
  },
  // ChatHeader
  {
    'hyguljxb': {
      'en': 'Confirm!',
      'ar': 'يتأكد!',
      'fa': 'تایید کنید!',
    },
    'ip3fobkr': {
      'en': 'You sure you want to delete this conversation?',
      'ar': 'هل أنت متأكد أنك تريد حذف هذه المحادثة؟',
      'fa': 'آیا مطمئن هستید که می خواهید این مکالمه را حذف کنید؟',
    },
    '268cabss': {
      'en': 'Yes, Delete',
      'ar': 'نعم، حذف',
      'fa': 'بله حذف کنید',
    },
    'f7wwnhef': {
      'en': 'Confirm!',
      'ar': 'يتأكد!',
      'fa': 'تایید کنید!',
    },
    '7k6n7bgs': {
      'en': 'You sure you want to archive this conversation?',
      'ar': 'هل أنت متأكد أنك تريد أرشفة هذه المحادثة؟',
      'fa': 'مطمئنید می‌خواهید این مکالمه را بایگانی کنید؟',
    },
    'v1xcbuv5': {
      'en': 'Yes, Archive',
      'ar': 'نعم، الأرشيف',
      'fa': 'بله آرشیو',
    },
    'xr6tn033': {
      'en': 'Chat archived successfully!',
      'ar': 'تم أرشفة الدردشة بنجاح!',
      'fa': 'گپ با موفقیت بایگانی شد!',
    },
  },
  // SearchSortPopup
  {
    '2aau9zm4': {
      'en': 'Sort',
      'ar': 'نوع',
      'fa': 'مرتب کردن',
    },
    'tla4h7x2': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'fa': 'درخواست کنید',
    },
  },
  // AddAddressPopup
  {
    '6dmevb8n': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'fa': 'اضافه کردن آدرس جدید',
    },
    'b3quo1cf': {
      'en': 'Address Name',
      'ar': 'اسم العنوان',
      'fa': 'نام آدرس',
    },
    'onmsux76': {
      'en': 'Address name',
      'ar': 'اسم العنوان',
      'fa': 'نام آدرس',
    },
    'taiwnoza': {
      'en': 'Address Details (Delivery only possible within Iraq)',
      'ar': 'تفاصيل العنوان (التوصيل متاح فقط داخل العراق)',
      'fa': 'جزئیات آدرس (تحویل فقط در داخل عراق امکان پذیر است)',
    },
    'qu33px6o': {
      'en': 'Select Location',
      'ar': 'حدد الموقع',
      'fa': 'مکان را انتخاب کنید',
    },
    'kunhv5t5': {
      'en': 'Default address',
      'ar': 'العنوان الإفتراضي',
      'fa': 'آدرس پیش فرض',
    },
    'r43429w7': {
      'en': 'Shipping address',
      'ar': 'عنوان الشحن',
      'fa': 'آدرس حمل و نقل',
    },
    'lapjab4i': {
      'en': 'Add',
      'ar': 'يضيف',
      'fa': 'اضافه کنید',
    },
    'v34112m3': {
      'en': 'Invalid address!',
      'ar': 'عنوان غير صالح!',
      'fa': 'آدرس نامعتبر است!',
    },
    'i2nz440n': {
      'en': 'Delivery is only possible to the addresses within Iraq.',
      'ar': 'التسليم ممكن فقط إلى العناوين داخل العراق.',
      'fa': 'تحویل فقط به آدرس های داخل عراق امکان پذیر است.',
    },
  },
  // CongratulationModal
  {
    'abmzq2y2': {
      'en': 'Congratulations!',
      'ar': 'مبروك!',
      'fa': 'تبریک می گویم!',
    },
    'rd5gb9z1': {
      'en':
          'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
      'ar':
          'حسابك جاهز للاستخدام. سيتم إعادة توجيهك إلى الصفحة الرئيسية في غضون ثوانٍ قليلة.',
      'fa':
          'حساب شما آماده استفاده است. در عرض چند ثانیه به صفحه اصلی هدایت خواهید شد..',
    },
  },
  // OrderHistoryItem
  {
    'bp1tzbls': {
      'en': 'Review',
      'ar': 'مراجعة',
      'fa': 'بررسی کنید',
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
      'fa': 'کیف پول',
    },
    'p1o5y80s': {
      'en': 'History',
      'ar': 'تاريخ',
      'fa': 'تاریخچه',
    },
    '9s7zajf3': {
      'en': 'Top Up',
      'ar': 'إعادة التعبئة',
      'fa': 'بالا',
    },
  },
  // AnonUserCard
  {
    'wu2yg5sy': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
      'fa': 'خوش آمدید!',
    },
    'r2h82q3j': {
      'en': 'Guest',
      'ar': 'ضيف',
      'fa': 'مهمان',
    },
  },
  // InfoModal
  {
    'exw6m8qw': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fa': 'لغو کنید',
    },
  },
  // TopupModal
  {
    'z61lvxqj': {
      'en': 'Topup Your Wallet',
      'ar': 'قم بشحن محفظتك',
      'fa': 'کیف پول خود را شارژ کنید',
    },
    '56fjw6ab': {
      'en': 'Amount',
      'ar': 'كمية',
      'fa': 'مقدار',
    },
    'efxrqxix': {
      'en': 'Amount',
      'ar': 'كمية',
      'fa': 'مقدار',
    },
    '962glepn': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'fa': 'درخواست کنید',
    },
    '32ucc61h': {
      'en': 'Invalid amount!',
      'ar': 'مبلغ غير صالح!',
      'fa': 'مبلغ نامعتبر!',
    },
    '1jpxuuac': {
      'en': 'The value is not in the min-max boundaries.',
      'ar': 'القيمة ليست ضمن حدود الحد الأدنى والحد الأقصى.',
      'fa': 'مقدار در مرزهای حداقل حداکثر نیست.',
    },
    'vgkrbpsq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fa': 'فیلد الزامی است',
    },
    '3fjn08c6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'fa': 'لطفاً یک گزینه را از منوی کشویی انتخاب کنید',
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
      'ar': 'يبحث',
      'fa': 'جستجو کنید',
    },
    'osedvh1j': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'fa': 'گزینه 1',
    },
  },
  // AddressCard
  {
    'j27ac60i': {
      'en': 'Default Address',
      'ar': 'العنوان الإفتراضي',
      'fa': 'آدرس پیش فرض',
    },
    'kvxg229g': {
      'en': 'Set as Default',
      'ar': 'تعيين كإعداد افتراضي',
      'fa': 'به عنوان پیش فرض تنظیم کنید',
    },
  },
  // addressInsert
  {
    'bqxk57d9': {
      'en': 'Select Address',
      'ar': 'حدد العنوان',
      'fa': 'آدرس را انتخاب کنید',
    },
    'y9n3rq0x': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
      'fa': 'اضافه کردن آدرس جدید',
    },
  },
  // DeliveryMethodItem
  {
    '0pb14jpp': {
      'en': 'Delivery Method',
      'ar': 'طريقة التسليم',
      'fa': 'روش تحویل',
    },
    '9k3i0m8e': {
      'en': 'Est Arrival: 24 Jan',
      'ar': 'تاريخ الوصول المتوقع: 24 يناير',
      'fa': 'ورود: 24 ژانویه',
    },
  },
  // DeliveryMethodSelector
  {
    '1lrst0pi': {
      'en': 'Select Delivery Method',
      'ar': 'حدد طريقة التسليم',
      'fa': 'روش تحویل را انتخاب کنید',
    },
  },
  // NavBarDelivery
  {
    'p5z062yj': {
      'en': 'Home',
      'ar': 'بيت',
      'fa': 'صفحه اصلی',
    },
    'pp5xpshl': {
      'en': 'Delivery History',
      'ar': 'تاريخ التسليم',
      'fa': 'تاریخچه تحویل',
    },
    'srv0anaj': {
      'en': 'Account',
      'ar': 'حساب',
      'fa': 'حساب',
    },
  },
  // Banner
  {
    'v8uxpwlm': {
      'en': 'Title',
      'ar': 'عنوان',
      'fa': 'عنوان',
    },
    'lfze99l8': {
      'en': 'SubTitle',
      'ar': 'العنوان الفرعي',
      'fa': 'عنوان فرعی',
    },
    'cdmi1lhm': {
      'en': 'Description ',
      'ar': 'وصف',
      'fa': 'توضیحات',
    },
    '52g2fc7i': {
      'en': 'Description',
      'ar': 'وصف',
      'fa': 'توضیحات',
    },
    'v0klx8km': {
      'en': 'Description',
      'ar': 'وصف',
      'fa': 'توضیحات',
    },
  },
  // PaymentMethodSelect
  {
    '41f9oaxq': {
      'en': 'Please select your payment method',
      'ar': 'الرجاء اختيار طريقة الدفع الخاصة بك',
      'fa': 'لطفا روش پرداخت خود را انتخاب کنید',
    },
    'p9uwyazy': {
      'en': 'Pay with',
      'ar': 'ادفع بـ',
      'fa': 'پرداخت با',
    },
    '0w0vu247': {
      'en': 'FIB',
      'ar': 'فيب',
      'fa': 'FIB',
    },
    'gx0vfjap': {
      'en': 'FIRST IRAQI BANK',
      'ar': 'البنك العراقي الأول',
      'fa': 'اولین بانک عراقی',
    },
    'wyow9mm4': {
      'en': 'Pay with',
      'ar': 'ادفع بـ',
      'fa': 'پرداخت با',
    },
    'oo9x5ouf': {
      'en': 'Credit Card',
      'ar': 'بطاقة إئتمان',
      'fa': 'کارت اعتباری',
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
      'fa': 'آهنگ',
    },
  },
  // AddressReturnPlaceId
  {
    'o3sc6vkv': {
      'en': 'Continue',
      'ar': 'يكمل',
      'fa': 'ادامه دهید',
    },
    'juqcixd5': {
      'en': 'Find Address',
      'ar': 'البحث عن العنوان',
      'fa': 'آدرس را پیدا کنید',
    },
    'j9p6967u': {
      'en': 'Start writing and elect the neearest address and continue',
      'ar': 'ابدأ بالكتابة واختر أقرب عنوان واستمر',
      'fa': 'شروع به نوشتن کنید و نزدیکترین آدرس را انتخاب کنید و ادامه دهید',
    },
    'obci6typ': {
      'en': 'Enter a new address',
      'ar': 'أدخل عنوان جديد',
      'fa': 'یک آدرس جدید وارد کنید',
    },
    '5f4z046j': {
      'en': 'Nearest addresses',
      'ar': 'العناوين الأقرب',
      'fa': 'نزدیک ترین آدرس ها',
    },
    'li7p55tm': {
      'en': 'No Address',
      'ar': 'لا يوجد عنوان',
      'fa': 'بدون آدرس',
    },
    'zwzw22uk': {
      'en': 'Map',
      'ar': 'رسم خريطة',
      'fa': 'نقشه',
    },
    'bcmnbug0': {
      'en': 'Finder',
      'ar': 'الباحث',
      'fa': 'یاب',
    },
    'xbgdmnto': {
      'en': 'Map',
      'ar': 'رسم خريطة',
      'fa': 'نقشه',
    },
  },
  // TermsTexts
  {
    'loe8vknm': {
      'en': 'By joining you are agree to our ',
      'ar': '',
      'fa': '',
    },
    'mow1c2lx': {
      'en': 'Terms of Service ',
      'ar': '',
      'fa': '',
    },
    'r9qvi8vu': {
      'en': 'and ',
      'ar': '',
      'fa': '',
    },
    'm9pje3b2': {
      'en': 'Privacy Policy.',
      'ar': '',
      'fa': '',
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
