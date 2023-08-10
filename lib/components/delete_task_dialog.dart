import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/task.dart';

class DeleteTaskDialog {
  static void showDeleteTaskConfirmationDialog(BuildContext context, int id) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext newContext) {
          return CupertinoAlertDialog(
            title: const Text("Delete task"),
            content: const Text("Are you sure you want to delete this task?"),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(newContext);
                },
                child: const Text("Cancel"),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  TaskModel().deleteTask(id);
                  Navigator.pop(newContext);
                },
                child: const Text("Continue"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext newContext) {
          return AlertDialog(
            title: const Text("Delete task"),
            content: const Text("Are you sure you want to delete this task?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(newContext);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  TaskModel().deleteTask(id);
                  Navigator.pop(newContext);
                },
                child: const Text("Continue"),
              ),
            ],
          );
        },
      );
    }
  }
}
