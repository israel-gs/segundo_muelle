import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:segundo_muelle/app/data/enums/category_enum.dart';
import 'package:segundo_muelle/app/data/models/order_model.dart';
import 'package:segundo_muelle/app/data/models/order_plate_model.dart';
import 'package:segundo_muelle/app/data/models/plate_model.dart';
import 'package:segundo_muelle/app/data/models/table_model.dart';
import 'package:segundo_muelle/app/data/models/user_model.dart';
import 'package:segundo_muelle/app/data/repository/order_repository.dart';
import 'package:segundo_muelle/app/data/repository/plate_repository.dart';
import 'package:segundo_muelle/app/data/repository/table_repository.dart';
import 'package:segundo_muelle/app/data/repository/user_repository.dart';

class MainController extends GetxController {
  late Box<TableModel> tableBox;
  late Box<UserModel> userBox;
  late Box<PlateModel> plateBox;
  late Box<OrderModel> orderBox;

  var currentUser = UserModel(
    username: '',
    name: '',
    password: '',
    isAdmin: false,
    isBlocked: false,
    attemptsCount: 0,
  ).obs;

  @override
  onInit() async {
    super.onInit();
    registerAdapters();
    await registerBoxes();
    inject();
  }

  inject() {
    Get.put(TableRepository());
    Get.put(PlateRepository());
    Get.put(OrderRepository());
    Get.put(UserRepository());
  }

  registerAdapters() {
    Hive.registerAdapter(TableModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(PlateModelAdapter());
    Hive.registerAdapter(CategoryEnumAdapter());
    Hive.registerAdapter(OrderModelAdapter());
    Hive.registerAdapter(OrderPlateModelAdapter());
  }

  registerBoxes() async {
    tableBox = await Hive.openBox<TableModel>('tableBox');
    plateBox = await Hive.openBox<PlateModel>('plateBox');
    userBox = await Hive.openBox<UserModel>('userBox');
    orderBox = await Hive.openBox<OrderModel>('orderBox');
  }
}
