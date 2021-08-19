import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File imageFileAvatar;
  String imageUrl;
  String id = '';
  String name = "";
  String email = "";
  // String photo = "";

  // PickedFile imageFile;
  // final ImagePicker _picker = ImagePicker();

  FirebaseAuth auth = FirebaseAuth.instance;

  String returnUser() {
    print(auth.currentUser.displayName);
    name = auth.currentUser.displayName;
    return name;
  }

  String returnEmail() {
    print(auth.currentUser.email);
    email = auth.currentUser.email;
    return email;
  }

  // String returnPhoto() {
  //   print(auth.currentUser.photoURL);
  //   photo = auth.currentUser.photoURL;
  //   return photo;
  // }

  

  final _storage = FirebaseStorage.instance;
  final _picker = ImagePicker();
  PickedFile image;

  uploadImage() async {
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot =
            await _storage.ref().child('folderName/imageName').putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
          // imageFileAvatar = image;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }

  // Future getImage() async{
  //   File image = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   if(image != null){
  //     setState(() {
  //       this.imageFileAvatar = image;

  //     });
  //   }
  

  //   uploadImageToFirestoreAndStorage();
  // }

  // Future uploadImageToFirestoreAndStorage () async{
  //   String mFileName = id;
  //   StorageReference storageReference = FirebaseStorage.instance.ref().child(mFileName);
  //   StorageUploadTask storageUploadTask = storageReference.putFile(imageFileAvatar);

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          ),
          backgroundColor:  
          Color(0xFF7BC6CC),

          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 35.0,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
            // color: Color(0xD06687AC),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                                Color(0xFFBE93C5),

                Color(0xff7BC6CC),
           
                
              ],

            )

            ),
            child: GestureDetector(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 50,
                ),

                Center(
                  child: Stack(children: <Widget>[
                    Container(
                      height: 160.0,
                      width: 160.0,
                    
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle, 
                        image: DecorationImage(
                            image: AssetImage("assets/images/bg3.jpeg"),
                            fit: BoxFit.cover),
                      ),
                      // child: imageFileAvatar,
                      child: (imageFileAvatar == null)
                          ? imageFileAvatar
                          // ? Image.network(imageUrl)
                          : Placeholder(
                              fallbackHeight: 200.0,
                              fallbackWidth: double.infinity),
                      // child: imageUrl == null
                      //     ? AssetImage('assets/images/image1.jpg')
                      //     : Image.network(imageUrl),
                      // backgroundImage: FileImage(File(image.path)),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: InkWell(
                        onTap: () {
                          // showModalBottomSheet(
                          //   context: context,
                          //   builder: ((builder) => bottomsheet()),
                          // );
                          uploadImage();
                          // getImage();
                        },
                        child: Icon(Icons.camera_alt,
                          color: Colors.black54,
                            size: 37.0),
                      ),
                    ),
                  ]),
                ),
                // Divider(height: 50, indent: 20, endIndent: 20, thickness: 1,),
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 300,
                    decoration: BoxDecoration(
                      // color: Color(0xD06687AC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10)),
                                Text('Name',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 2,
                                        offset: Offset(0, 3)),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white70,
                                  // color: Colors.black54,
                                ),
                                child: Center(
                                    child: Text(returnUser(),
                                        style: TextStyle(
                                            fontSize: 19,
                                            )))
                                            
                                ),
                            SizedBox(height: 35),
                            Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10)),
                                Text('Email',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 2,
                                        offset: Offset(0, 3)),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white70,
                                  // color: Colors.black54,
                                ),
                                child: Center(
                                    child: Text(returnEmail(),
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.black)))
                              
                                ),
                          ],
                        ),
                      ),
                    ),
              ]),
            ),
          ),
        ));
  }

  Widget bottomsheet() {
    return Container(
      height: 100.0,
      width: 200.0,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takephoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      image = pickedFile;
    });
  }
}
