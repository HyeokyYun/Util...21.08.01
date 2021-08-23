import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/controllers/TodoController.dart';
import 'package:getx_crud/models/Todo.dart';

class TodoEditScreen extends StatelessWidget {
  final TodoController todoController = Get.find();

  final int index;
  TodoEditScreen({required this.index});

  @override
  Widget build(BuildContext context) {

    String text = '';
    text = todoController.todos[index].text; // 원래 데이터 저장
    TextEditingController textEditingController = TextEditingController(text: text); // 원래 기존 데이터 보여줌

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(36.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Write your Thought...!',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: (){
                      if(this.index.isNull){
                        todoController.todos
                            .add(Todo(text: textEditingController.text));
                      }else{
                        var editing = todoController.todos[index];
                        editing.text = textEditingController.text;
                        todoController.todos[index] = editing;
                      }
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Edit'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
