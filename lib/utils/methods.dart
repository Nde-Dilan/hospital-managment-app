import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';

Logger _log = Logger('methods.dart');


void showErrorDialog(BuildContext context, String title, String error) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(fontSize: 24),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                error,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.deepPurple),
            ),
          )
        ],
      );
    },
  );
}




String getUserInitials(String fullName) {
  final List<String> nameParts = fullName.split(' ');
  if (nameParts.length > 1) {
    return nameParts[0][0] + nameParts[nameParts.length - 1][0];
  } else {
    return nameParts[0][0];
  }
}

/// Use to populate the firestore db with predefined data
Future<void> populateFirestore(FirebaseFirestore firestore, Map<String, dynamic> jsonData) async {
  jsonData.forEach((collection, documents) async {
    for (String docId in documents.keys) {
      await firestore.collection(collection).doc(docId).set(documents[docId]);
    }
  });
}
