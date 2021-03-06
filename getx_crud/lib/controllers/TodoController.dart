import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_crud/models/Todo.dart';

class TodoController extends GetxController{
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');

    if(!storedTodos.isNull){
      todos = storedTodos!.map((e)=>Todo.fromJson(e)).toList().obs;
    }

    ever(todos, (_){
      GetStorage().write('todos', todos.toList());
    });
    // TODO: implement onInit
    super.onInit();
  }

}