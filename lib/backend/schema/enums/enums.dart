import 'package:collection/collection.dart';

enum MediaTypes {
  Image,
  Video,
  Audio,
}

enum OrderStatuses {
  Draft,
  Canceled,
  OrderReceived,
  Declined,
  Preparing,
  HasBeenShipped,
  Completed,
  Disputed,
  Refunded,
  PartiallyRefunded,
}

enum OrderPaymentStatus {
  Unpaid,
  Paid,
  Refunded,
}

enum PaymentTypes {
  CashOnDelivery,
  Wallet,
  FIB,
  Amwal,
}

enum Roles {
  SUPER_ADMIN,
  BUSINESS_ADMIN,
  BUSINESS_ACCOUNTANT,
  DELIVERY_ADMIN,
  DELIVERY_EMPLOYEE,
  INFLUENCER,
}

enum AdvertisePlacesInMobileApp {
  Home,
  Categories,
  SubCategories,
  Markets,
  ProductDetail,
  Search,
  Conversation,
  ChatSupport,
  Notification,
  Cart,
}

enum AdvertiseStatus {
  Active,
  Pending,
  Deactive,
}

enum AdvertiseType {
  Product,
  Market,
  Business,
  Brand,
  None,
  Category,
  External,
}

enum ConversationStatus {
  Active,
  ClosedByUser,
  ClosedByAdmin,
  Draft,
}

enum MarketStatus {
  Pending,
  Active,
  Deactive,
}

enum MarketType {
  Business,
  Brand,
  Star,
}

enum TransactionType {
  Order,
  Topup,
}

enum BusinessStatuses {
  Active,
  Pending,
  Deactive,
}

enum ProductStatus {
  Available,
  Unavailable,
  Pending,
  Draft,
}

enum Gender {
  All,
  Men,
  Women,
}

enum UserTypes {
  Consumer,
  Delivery,
  Business,
  Star,
}

enum MarketingOptions {
  Open,
  Invite,
}

enum ReviewStatus {
  Accepted,
  Pending,
  Rejected,
}

enum SocialTypes {
  X,
  YouTube,
  Instagram,
  TikTok,
  FaceBook,
  Linkedin,
  WhatsApp,
  Reddit,
}

enum LanguageCodes {
  en,
  ar,
  ku,
}

enum DeliveryOptions {
  Instant,
  Fast,
  Normal,
}

enum BrandStatus {
  Active,
  Archive,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MediaTypes):
      return MediaTypes.values.deserialize(value) as T?;
    case (OrderStatuses):
      return OrderStatuses.values.deserialize(value) as T?;
    case (OrderPaymentStatus):
      return OrderPaymentStatus.values.deserialize(value) as T?;
    case (PaymentTypes):
      return PaymentTypes.values.deserialize(value) as T?;
    case (Roles):
      return Roles.values.deserialize(value) as T?;
    case (AdvertisePlacesInMobileApp):
      return AdvertisePlacesInMobileApp.values.deserialize(value) as T?;
    case (AdvertiseStatus):
      return AdvertiseStatus.values.deserialize(value) as T?;
    case (AdvertiseType):
      return AdvertiseType.values.deserialize(value) as T?;
    case (ConversationStatus):
      return ConversationStatus.values.deserialize(value) as T?;
    case (MarketStatus):
      return MarketStatus.values.deserialize(value) as T?;
    case (MarketType):
      return MarketType.values.deserialize(value) as T?;
    case (TransactionType):
      return TransactionType.values.deserialize(value) as T?;
    case (BusinessStatuses):
      return BusinessStatuses.values.deserialize(value) as T?;
    case (ProductStatus):
      return ProductStatus.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (UserTypes):
      return UserTypes.values.deserialize(value) as T?;
    case (MarketingOptions):
      return MarketingOptions.values.deserialize(value) as T?;
    case (ReviewStatus):
      return ReviewStatus.values.deserialize(value) as T?;
    case (SocialTypes):
      return SocialTypes.values.deserialize(value) as T?;
    case (LanguageCodes):
      return LanguageCodes.values.deserialize(value) as T?;
    case (DeliveryOptions):
      return DeliveryOptions.values.deserialize(value) as T?;
    case (BrandStatus):
      return BrandStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
