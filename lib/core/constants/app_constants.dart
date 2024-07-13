import 'package:easy_localization/easy_localization.dart';


class AppConstants{


    static const String baseUrl = "https://msarsolutions.com/";
  static const String getCurrencies = "api/currencies";
  static const String login = "api/login";
  static const String register = "api/register";
  static const String getMyAccount = "api/getaccount";
  static const String logout = "api/logout";
  static const String paymentAccount = "api/accounts";
  static const String paymentAccountTypes = "api/accounttypes";
  static const String budgets = "api/budgets";
  static const String goals = "api/goals";
  static const String transactions = "api/transaction/handle";
  static const String getTransactions = "api/transactions/report";
  static const String transaction = "api/transaction";
  static const String updateTransaction = "api/transaction/update";
  static const String categories = "api/categories";
  static const String shopping = "api/shopping-lists";
  static const String updateListName = "api/shopping/updateListName";
  static const String shoppingListItem = "api/addItemOnList";
  static const String loyaltyCards = "api/loyalty-cards";
  static const String debts = "api/debts";
  static const String profile = "api/user/profile";
  static const String addRecord = "api/shopping/add-record";




  static const List<int> colorValues = [
    0xFF80D8FF,
    0xFF00BCD4,
    0xFF3F51B5,
    0xFF536DFE,
    0xFF2196F3,
    0xFF40C4FF,
    0xFFFF5722,
    0xFFFF9800,
    0xFFFFAB40,
    0xFF795548,
    0xFF3E2723,
  ];

  static List<String> paymentTypes=[
    'Cash'.tr(),
    'Debit Card'.tr(),
    'Credit Card'.tr(),
    'Bank Transfer'.tr(),
    'Coupon'.tr(),
    'By Mobile'.tr(),
    'By Web'.tr(),
  ];



  static String currency ="";

}

class Er {
  static String error = tr("Some Thing wrong");
  static String networkError = tr("Check Connection");
  static String unAuthenticatedError = tr("Unauthenticated");

}