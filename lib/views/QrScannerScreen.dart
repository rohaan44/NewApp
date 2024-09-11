import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:paysense/controllers/UserController.dart';

class QrScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
        backgroundColor: Colors.blue,
      ),
      body: MobileScanner(
        controller:
            MobileScannerController(detectionSpeed: DetectionSpeed.normal),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (var barcode in barcodes) {
            if (barcode.rawValue != null) {
              String accountNumber = barcode.rawValue!;
              log("Account number scanned: $accountNumber");

              // Fetch data using account number
              userController.onQRCodeScanned(context, accountNumber);
              break;
            }
          }
        },
      ),
    );
  }
}
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase package

// class QrScannerScreen extends StatelessWidget {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR Code Scanner"),
//         backgroundColor: Colors.blue,
//       ),
//       body: MobileScanner(
//         controller: MobileScannerController(detectionSpeed: DetectionSpeed.normal),
//         onDetect: (capture) async {
//           final List<Barcode> barcodes = capture.barcodes;

//           for (var barcode in barcodes) {
//             log("Barcode found: ${barcode.rawValue}");
            
//             // Extract the account number from the barcode
//             String? accountNumber = barcode.rawValue;

//             if (accountNumber != null) {
//               // Fetch data from Firebase using the account number
//               await _fetchUserData(accountNumber, context);
//             }
//           }
//         },
//       ),
//     );
//   }

//   // Function to fetch data from Firebase using the account number
//   Future<void> _fetchUserData(String accountNumber, BuildContext context) async {
//     try {
//       // Fetch data from Firestore using the account number as the document ID or field
//       DocumentSnapshot userDoc = await firestore.collection('users').doc(accountNumber).get();

//       if (userDoc.exists) {
//         var userData = userDoc.data();
        
//         // Show fetched data in a dialog
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text("User Data for Account: $accountNumber"),
//               content: Text("Full Name: ${userData['fullName']}\nPhone: ${userData['phoneNumber']}"),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Close'),
//                 )
//               ],
//             );
//           },
//         );
//       } else {
//         log("User not found");
//         _showErrorDialog(context, "User not found for account number: $accountNumber");
//       }
//     } catch (e) {
//       log("Error fetching user data: $e");
//       _showErrorDialog(context, "Error fetching user data.");
//     }
//   }

//   // Error Dialog function
//   void _showErrorDialog(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Error"),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
