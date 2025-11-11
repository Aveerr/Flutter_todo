import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Коллекция для задач
  CollectionReference get todos => _firestore.collection('todos');

  // Добавить задачу
  Future<void> addTodo(String title, String description) {
    return todos.add({
      'title': title,
      'description': description,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Получить все задачи
  Stream<QuerySnapshot> getTodos() {
    return todos.orderBy('createdAt', descending: true).snapshots();
  }

  // Обновить задачу
  Future<void> updateTodo(String docId, bool completed) {
    return todos.doc(docId).update({
      'completed': completed,
    });
  }

  // Удалить задачу
  Future<void> deleteTodo(String docId) {
    return todos.doc(docId).delete();
  }
}