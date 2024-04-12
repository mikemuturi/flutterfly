import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fly_app/todo/bloc/todo_bloc.dart';
import 'package:fly_app/todo/data/todo.dart';

class HomeTodo extends StatefulWidget {
  const HomeTodo({Key? key}) : super(key: key);

  @override
  State<HomeTodo> createState() => _HomeTodoState();
}
class _HomeTodoState extends State<HomeTodo> {
  void addTodo(Todo todo) {
    context.read<TodoBloc>().add(AddTodo(todo));
  }

  void removeTodo(Todo todo) {
    context.read<TodoBloc>().add(RemoveTodo(todo));
  }

  void alterTodo(int index) {
    context.read<TodoBloc>().add(AlterTodo(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController controller1 = TextEditingController();
              TextEditingController controller2 = TextEditingController();
              return AlertDialog(
                title: const Text("Add Text"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: controller1,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: " Task Title",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black
                          )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: controller2, // Use controller2 here
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: " Task Description",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black
                          )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey
                          )
                        )
                      ),
                    ),
                  ],
                ),
                actions:  [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {
                        addTodo(
                          Todo(
                            title: controller1.text,
                            subtitle: controller2.text
                          ),
                        );
                        controller1.text = '';
                        controller2.text = '';
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Colors.black,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Icon(
                          CupertinoIcons.check_mark,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          );
        },
        backgroundColor: Colors.amberAccent,
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: const Text(
          "My Todo App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.status == TodoStatus.success) {
              // Display the list of todos
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, int i) {
                  // final todo = state.todos[i];
                  return Card(
                    color: Colors.amber,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Slidable(
                      key: ValueKey(0),
                      startActionPane: ActionPane(
                        motion: ScrollMotion(),
                         children: [
                          SlidableAction(
                          onPressed: (_){
                            removeTodo(state.todos[i]);
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                          )]
                          ),
                      child: ListTile(
                          title: Text(
                            state.todos[i].title
                          ),
                          subtitle: Text(
                            state.todos[i].subtitle
                          ),
                          trailing: Checkbox(value: state.todos[i].isDone,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            alterTodo(i);
                          }),
                    ),
                      ),

                  );
                },
              );
            } else if (state.status == TodoStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
