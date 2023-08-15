import 'package:flutter/material.dart';
import '../components/task.dart';
import '../data/task.dart';

class NewTask extends StatefulWidget {
  final int? id;
  final BuildContext taskContext;
  const NewTask({required this.taskContext, this.id, super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) =>
      value != null && value.isEmpty ? true : false;

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      _loadTaskData();
    }
  }

  Future<void> _loadTaskData() async {
    final Task? task = await TaskModel().findTaskById(widget.id);

    if (task != null) {
      nameController.text = task.name;
      difficultyController.text = task.difficulty.toString();
      imageController.text = task.src.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          title: Text(widget.id != null ? 'Edit Task' : 'New Task'),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            width: 375,
            height: 650,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (BuildContext ctx, Object err,
                              StackTrace? stack) {
                            return Image.asset(
                              fit: BoxFit.cover,
                              'assets/fallback.png',
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(),
                          fillColor: Colors.white60,
                          filled: true),
                      controller: nameController,
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Difficulty',
                          border: OutlineInputBorder(),
                          fillColor: Colors.white60,
                          filled: true),
                      controller: difficultyController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Difficulty must be a number between 1 and 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Image',
                          border: OutlineInputBorder(),
                          fillColor: Colors.white60,
                          filled: true),
                      controller: imageController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Image must be an URL';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final task = Task(
                              name: nameController.text,
                              src: imageController.text,
                              difficulty: int.parse(difficultyController.text),
                            );

                            if (widget.id != null) {
                              TaskModel().updateTask(task);
                            } else {
                              TaskModel().insertTask(task);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Creating new task')));
                            Navigator.pop(context);
                          }
                        },
                        child: Text(widget.id != null ? 'Save' : 'Create'))
                  ]),
            ),
          ),
        )),
      ),
    );
  }
}
