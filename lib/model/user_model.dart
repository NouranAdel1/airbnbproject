import 'package: cloud_firestore/cloud_firestore.dart';
import 'package: flutter/material.dart';

class UserModel extends ContactModel
{
    String? email;
    String? password;
    String? bio;
    String? city;
    String? country;
    bool? isHost;
    bool? isCurrentlyHosting;
    DocumentSnapshot? snapshot;

    UserModel({
     String id = "",
     String firstName = "",
     String lastName= "",
     Memory Image? displayImage,
     this.email = "",
     this.bio = "",
     this.city = "",
     this.country = "",
    }): super (id: id, firstName: firstName, lastName: lastName, displayImage: displayImage)
    {
     isHost = false;
     isCurrentlyHosting = false;
    }

    Future<void> saveUserToFirestore() async
    {
      Map<String, dynamic> dataMap =
      {
        "bio": bio,
        "city" : city,
        "country": country,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "isHost": false,
        "myPostingIDs": [],
        "savedPostingIDs": [],
        "earnings": 0,
      };

      await FirebaseFirestore.instance.collection("users").doc(id).set(dataMap);
    }
}