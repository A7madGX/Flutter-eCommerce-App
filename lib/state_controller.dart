import 'package:flutter/material.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/classes/utils/category.dart';
import 'package:krispy_store/classes/utils/order_status.dart';
import 'package:krispy_store/data_source/source.dart';
import 'package:krispy_store/model/notification.dart';
import 'package:krispy_store/model/order.dart';
import 'package:krispy_store/model/order_item.dart';
import 'package:krispy_store/model/product.dart';

class StateController extends ChangeNotifier {
  // Darkmode controller
  bool darkMode = false;
  void toggleThemeMode() {
    darkMode = !darkMode;
    LightTheme.toDarkMode(darkMode);
    notifyListeners();
  }

  // NavPages controller
  final PageController pgCtrl = PageController(initialPage: 0);
  int selectedpageIndex = 0;
  void selectPage(int index) {
    selectedpageIndex = index;
    notifyListeners();
  }

  void selectPageFromNav(int index) {
    pgCtrl.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    notifyListeners();
  }

  // Home controller
  int homepageIndex = 0;
  void selectHomePage(int index) {
    homepageIndex = index;
    notifyListeners();
  }

  // Settings controller
  int profilepageIndex = 0;
  void selectProfileIndex(int index) {
    profilepageIndex = index;
    notifyListeners();
  }

  // Language controller
  int languageIndex = 0;
  void selectLanguage(int index) {
    languageIndex = index;
    notifyListeners();
  }

  // Category controller
  late MyCategoryType category;
  late Future<List<Product>> fproducts;
  void setCategory(MyCategoryType selected) {
    category = selected;
    fproducts = DataSource.getProductsByCategory(category);
    notifyListeners();
  }

  // Favorite controller
  final Map<int, Product> myFavorites = {};
  final List<int> myFavoritesList = [];
  bool inFavs(Product product) {
    return myFavorites.containsKey(product.id);
  }

  void addToFavs(Product product) {
    myFavorites[product.id] = product;
    myFavoritesList.add(product.id);
    notifyListeners();
  }

  void removeFromFavs(Product product) {
    myFavorites.remove(product.id);
    myFavoritesList.remove(product.id);
    notifyListeners();
  }

  void clearFavs() {
    myFavorites.clear();
    myFavoritesList.clear();
    notifyListeners();
  }

  // Color and Size controllers
  int selectedSizeIndex = 0;
  int selectedColorIndex = 0;
  void setSizeIndex(int index) {
    selectedSizeIndex = index;
    notifyListeners();
  }

  void setColorIndex(int index) {
    selectedColorIndex = index;
    notifyListeners();
  }

  int getSize() {
    switch (selectedSizeIndex) {
      case 0:
        return 38;
      case 1:
        return 40;
      case 2:
        return 42;
      case 3:
        return 44;
      case 4:
        return 46;
      default:
        return 38;
    }
  }

  Color getColor() {
    switch (selectedColorIndex) {
      case 0:
        return LightTheme.firstChoiceColor;
      case 1:
        return LightTheme.secondChoiceColor;
      case 2:
        return LightTheme.thirdChoiceColor;
      case 3:
        return LightTheme.fourthChoiceColor;
      case 4:
        return LightTheme.fifthChoiceColor;
      default:
        return LightTheme.firstChoiceColor;
    }
  }

  // Cart controller
  final List<OrderItem> cartList = [];
  bool found = false;
  void addToCart(OrderItem myItem) {
    if (cartList.isEmpty) {
      cartList.add(myItem);
    } else {
      for (var item in cartList) {
        if (item.product.id == myItem.product.id &&
            item.color == myItem.color &&
            item.size == myItem.size) {
          item.amount++;
          found = true;
          break;
        }
      }
      if (!found) {
        cartList.add(myItem);
      }
      found = false;
    }
    notifyListeners();
  }

  void removeFromCart(OrderItem myItem) {
    for (var item in cartList) {
      if (item.product.id == myItem.product.id &&
          item.color == myItem.color &&
          item.size == myItem.size) {
        if (item.amount == 1) {
          cartList.removeWhere((element) =>
              (element.product.id == myItem.product.id &&
                  element.color == myItem.color &&
                  element.size == myItem.size));
          break;
        } else {
          item.amount--;
        }
      }
    }
    notifyListeners();
  }

  void clearCart() {
    cartList.clear();
    notifyListeners();
  }

  double getTotalOrderAmount() {
    double amount = 0;
    for (var element in cartList) {
      amount += element.amount * element.product.price;
    }
    return amount;
  }

  int getTotalOrderNumber() {
    int amount = 0;
    for (var element in cartList) {
      amount += element.amount;
    }
    return amount;
  }

  // Order and Notification Controller
  int orderId = 0;
  int notiId = 0;
  final List<Order> allOrders = [];
  final List<NotificationMessage> notifications = [];
  void addOrder(Order order) {
    orderId++;
    notiId++;
    allOrders.add(order);
    notifications.add(NotificationMessage(
      id: notiId,
      title: 'Order #${order.id}',
      description: 'Your Order is currently ${statusToString(order.status)}',
    ));
    notifyListeners();
  }

  void deleteNotification(NotificationMessage note) {
    notifications.removeWhere((notification) => notification.id == note.id);
    notifyListeners();
  }

  void clearNotifications() {
    notifications.clear();
    notifyListeners();
  }
}
