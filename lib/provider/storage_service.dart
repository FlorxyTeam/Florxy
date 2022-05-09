import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async{
    File file = File(filePath);
    try{
      await storage.ref('profile/$fileName').putFile(file);
    }on firebase_core.FirebaseException catch (e) {print(e);}
  }

  Future<firebase_storage.ListResult> listFiles() async{
    firebase_storage.ListResult results = await storage.ref('profile').listAll();
    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file $ref');
    });

    return results;
  }
  Future<String> downloadURL(String imageName) async{
    String downloadURL = await storage.ref('profile/$imageName').getDownloadURL();

    return downloadURL;
  }
  Future<String> uploadProfile(String filePath, String fileName) async{
    File file = File(filePath);
    try{
      await storage.ref('profile/$fileName').putFile(file);
    }on firebase_core.FirebaseException catch (e)
    {print(e);}
    String downloadURL = await storage.ref('profile/$fileName').getDownloadURL();
    return downloadURL;
  }

  Future<String> uploadPostImage(String filePath, String fileName) async{
    File file = File(filePath);
    try{
      await storage.ref('post/$fileName').putFile(file);
    }on firebase_core.FirebaseException catch (e)
    {print(e);}
    String downloadURL = await storage.ref('post/$fileName').getDownloadURL();
    return downloadURL;
  }

  Future<String> uploadRequestImage(String filePath, String fileName) async{
    File file = File(filePath);
    try{
      await storage.ref('request/$fileName').putFile(file);
    }on firebase_core.FirebaseException catch (e)
    {print(e);}
    String downloadURL = await storage.ref('request/$fileName').getDownloadURL();
    return downloadURL;
  }
}