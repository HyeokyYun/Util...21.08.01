import 'package:get/get.dart';
import 'package:self_study2/models/todo.dart';
import 'package:self_study2/services/database.dart';

import 'authController.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user!.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }
}