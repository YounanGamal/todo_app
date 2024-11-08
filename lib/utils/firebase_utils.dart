import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseUtils {
  CollectionReference<TaskModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromFireStore(snapshot.data()!),
            toFirestore: (taskModel, _) => taskModel.toFireStore());
  }

  Future<void> addTask(TaskModel taskModel) {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }

  Future<List<TaskModel>> getDocumentData(DateTime selectedDate) async {
    var collectionRef = getCollectionRef().where(
      'selectedDate',
      isEqualTo: selectedDate.millisecondsSinceEpoch,
    );
    var docRef = await collectionRef.get();
    List<TaskModel> tasksList = [];
    tasksList = docRef.docs
        .map(
          (e) => e.data(),
        )
        .toList();
    return tasksList;
  }

  Stream<QuerySnapshot<TaskModel>> getStreamData(DateTime selectedDate) {
    var collectionRef = getCollectionRef().where(
      'selectedDate',
      isEqualTo: selectedDate.millisecondsSinceEpoch,
    );
    return collectionRef.snapshots();
  }

  Future<void> deleteTask(TaskModel taskModel) async {
    var collectionRef = getCollectionRef();
    var docRef = await collectionRef.doc(taskModel.id);
    return docRef.delete();
  }

  Future<void> updateTask(TaskModel taskModel) async {
    var collectionRef = getCollectionRef();
    var docRef = await collectionRef.doc(taskModel.id);
    return docRef.update({
      'isDone': true,
    });
  }
}
