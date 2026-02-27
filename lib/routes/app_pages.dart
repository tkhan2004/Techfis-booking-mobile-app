import 'package:get/instance_manager.dart';
import 'package:hotel_booking/presentation/controllers/booking_controller.dart';
import 'package:hotel_booking/presentation/controllers/main_controller.dart';
import 'package:hotel_booking/presentation/controllers/onboarding_controller.dart';
import 'package:hotel_booking/presentation/controllers/room_detail_controller.dart';
import 'package:hotel_booking/presentation/controllers/splash_controller.dart';
import 'package:hotel_booking/presentation/controllers/auth_controller.dart';
import 'package:hotel_booking/presentation/pages/booking/booking_page.dart';
import 'package:hotel_booking/presentation/controllers/add_card_controller.dart';
import 'package:hotel_booking/presentation/controllers/payment_method_controller.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';
import 'package:hotel_booking/presentation/pages/main_view.dart';
import 'package:hotel_booking/presentation/pages/onboarding/onboarding_page.dart';
import 'package:hotel_booking/presentation/pages/auth/auth_page.dart';
import 'package:hotel_booking/presentation/pages/payment/add_new_card_page.dart';
import 'package:hotel_booking/presentation/pages/payment/payment_method_page.dart';
import 'package:hotel_booking/presentation/pages/room_detail/room_detail_page.dart';
import 'package:hotel_booking/presentation/pages/write_review/write_review_page.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/presentation/pages/payment/payment_success_page.dart';
import 'package:hotel_booking/presentation/controllers/payment_success_controller.dart';
import 'package:get/route_manager.dart';
import 'package:hotel_booking/presentation/pages/splash/splash_page.dart';
import 'package:hotel_booking/presentation/controllers/home_page_controller.dart';
import 'package:hotel_booking/presentation/controllers/notifications_controller.dart';
import 'package:hotel_booking/presentation/pages/notifications/notifications_page.dart';
import 'package:hotel_booking/presentation/pages/search/search_result_page.dart';
import 'package:hotel_booking/presentation/pages/travel_blog_detail/travel_blog_detail_page.dart';
import 'package:hotel_booking/presentation/controllers/travel_blog_detail_controller.dart';
import 'package:hotel_booking/presentation/pages/travel_blog_list/travel_blog_list_page.dart';
import 'package:hotel_booking/presentation/controllers/travel_blog_list_controller.dart';
import 'package:hotel_booking/presentation/pages/booking_detail/booking_detail_page.dart';
import 'package:hotel_booking/presentation/controllers/booking_detail_controller.dart';

class AppPages {
  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingPage(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => const AuthPage(),
      binding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const MainView(),
      binding: BindingsBuilder(() {
        Get.put(MainController());
        Get.put(HomePageController());
        Get.put(HotelSearchController());
      }),
    ),
    GetPage(
      name: AppRoutes.ROOM_DETAIL,
      page: () => RoomDetailPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RoomDetailController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.BOOKING,
      page: () => const BookingPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => BookingController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.PAYMENT_METHOD,
      page: () => const PaymentMethodPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => PaymentMethodController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.ADD_CARD,
      page: () => const AddNewCardPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AddCardController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.PAYMENT_SUCCESS,
      page: () => const PaymentSuccessPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => PaymentSuccessController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.SEARCH_RESULT,
      page: () => const SearchResultPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HotelSearchController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATIONS,
      page: () => const NotificationsPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => NotificationsController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.WRITE_REVIEW,
      page: () => const WriteReviewPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RoomDetailController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.TRAVEL_BLOG_DETAIL,
      page: () => const TravelBlogDetailPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => TravelBlogDetailController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.TRAVEL_BLOG_LIST,
      page: () => const TravelBlogListPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => TravelBlogListController(), fenix: true);
      }),
    ),
    GetPage(
      name: AppRoutes.BOOKING_DETAIL,
      page: () => const BookingDetailPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => BookingDetailController(), fenix: true);
      }),
    ),
  ];
}
