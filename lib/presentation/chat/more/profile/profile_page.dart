import 'package:chat/application/auth/profile/profile_cubit.dart';
import 'package:chat/repository/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _image;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image!;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      if (_image != null) {
        try {
          String fileName = basename(_image!.path);
          firebase_storage.Reference firebaseStorageRef =
              firebase_storage.FirebaseStorage.instance.ref().child(fileName);

          firebase_storage.UploadTask uploadTask =
              firebaseStorageRef.putFile(File(_image!.path));

          firebase_storage.TaskSnapshot taskSnapshot =
              await uploadTask.whenComplete(() => null);

          String downloadUrl = await taskSnapshot.ref.getDownloadURL();

          await UserRepository()
              .getUser(UserRepository.currentUserId)
              .then((user) {
            _firestore.collection('users').doc(user.uid).update({
              'avatarUrl': downloadUrl,
            });
          });

          setState(() {
            print("Profile Picture uploaded");
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile Picture Uploaded')));
          });
        } catch (e) {
          print("Error uploading profile picture: $e");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Failed to upload profile picture')));
        }
      }
    }

    return ColoredBox(
      color: Color(0xff222e3a),
      child: BlocProvider(
          create: (context) => ProfileCubit()..loadProfile(),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              print("State is ${state}");
              return state.maybeMap(
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loaded: (state) {
                  final user = state.user;
                  return Scaffold(
                    backgroundColor: const Color(0xff222e3a),
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    body: Builder(
                      builder: (context) => Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              height: 128,
                              width: 128,
                              child: Stack(
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: 64,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: getImageProvider(
                                          state.user.avatarUrl),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                      icon: const Icon(
                                        FontAwesomeIcons.camera,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                      onPressed: getImage,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0xff476cfb),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0xff476cfb),
                                  ),
                                  onPressed: () {
                                    uploadPic(context);
                                  },
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
          )),
    );
  }

  ImageProvider<Object>? getImageProvider(String? avatarUrl) {
    return ((_image != null)
        ? FileImage(File(_image!.path))
        : avatarUrl == null
            ? const AssetImage('assets/avatar.jpg')
            : NetworkImage(avatarUrl)) as ImageProvider<Object>?;
  }
}
