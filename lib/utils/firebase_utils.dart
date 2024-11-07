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
}
