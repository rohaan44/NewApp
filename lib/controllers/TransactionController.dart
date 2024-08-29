import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paysense/controllers/EnteraccController.dart';
import 'package:paysense/controllers/SendingamountController.dart';
import 'package:paysense/controllers/UserController.dart';

class TransactionController extends GetxController {
  final recieverData = Get.find<EnterAccController>().userData;
  final senderData = Get.find<UserController>().userData;
  final sendingAmountController = Get.find<SendingAmountController>().textEdit;
  var status = false.obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void transaction() async {
    print("Receiver Data: ${recieverData}");
    print("Sender Data: ${senderData}");
    print("Sending Amount: ${sendingAmountController.text}");
    if (!recieverData.containsKey('amount')) {
      print("Receiver data does not contain 'amount'");
      Get.snackbar('Error', 'Receiver amount does not exist');
      return;
    }
    if (recieverData['amount'] == null) {
      print("Receiver amount is null");
      Get.snackbar('Error', 'Receiver amount is null');
      return;
    }
    if (!senderData.containsKey('amount')) {
      print("Sender data does not contain 'amount'");
      Get.snackbar('Error', 'Sender amount does not exist');
      return;
    }
    if (senderData['amount'] == null) {
      print("Sender amount is null");
      Get.snackbar('Error', 'Sender amount is null');
      return;
    }

    int? parseAmount(dynamic amount) {
      if (amount is int) {
        return amount;
      } else if (amount is String) {
        return int.tryParse(amount.replaceAll(',', ''));
      }
      return null;
    }

    int? receiverAmount = parseAmount(recieverData['amount']);
    int? senderAmount = parseAmount(senderData['amount']);
    int? sendingAmount = int.tryParse(sendingAmountController.text);
    print("Parsed Receiver Amount: $receiverAmount");
    print("Parsed Sender Amount: $senderAmount");
    print("Parsed Sending Amount: $sendingAmount");

    if (receiverAmount == null) {
      Get.snackbar('Error', 'Invalid receiver amount');
      return;
    }
    if (senderAmount == null) {
      Get.snackbar('Error', 'Invalid sender amount');
      return;
    }
    if (sendingAmount == null) {
      Get.snackbar('Error', 'Invalid sending amount');
      return;
    }
    log("Receiver Phone Number: ${recieverData['phoneNumber']}");
    log("Sender Phone Number: ${senderData['phoneNumber']}");

    try {
      QuerySnapshot receiverSnapshot = await firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: recieverData['phoneNumber'])
          .get();
      QuerySnapshot senderSnapshot = await firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: senderData['phoneNumber'])
          .get();
      if (receiverSnapshot.docs.isEmpty) {
        Get.snackbar('Error', 'Receiver document does not exist');
        return;
      }
      if (senderSnapshot.docs.isEmpty) {
        Get.snackbar('Error', 'Sender document does not exist');
        return;
      }
      DocumentReference receiverRef = receiverSnapshot.docs.first.reference;
      DocumentReference senderRef = senderSnapshot.docs.first.reference;
      if (senderAmount >= sendingAmount) {
        int updatedSenderAmount = senderAmount - sendingAmount;
        int updatedReceiverAmount = receiverAmount + sendingAmount;
        var formatter = NumberFormat('#,##0', 'en_US');
        String formattedUpdatedSenderAmount =
            formatter.format(updatedSenderAmount);
        String formattedUpdatedReceiverAmount =
            formatter.format(updatedReceiverAmount);
        try {
          WriteBatch batch = firestore.batch();
          batch.update(senderRef, {'amount': formattedUpdatedSenderAmount});
          batch
              .update(senderRef, {'totalTransaction': FieldValue.increment(1)});
          batch.update(receiverRef, {'amount': formattedUpdatedReceiverAmount});
          await batch.commit();
          senderData['amount'] = formattedUpdatedSenderAmount;
          recieverData['amount'] = formattedUpdatedReceiverAmount;

          Get.snackbar('Success', 'Transaction completed successfully');
          status.value = true;
          transactionData(
              senderData['phoneNumber'] ?? '',
              recieverData['phoneNumber'] ?? '',
              senderData['fullname'] ?? '',
              recieverData['fullname'] ?? '',
              sendingAmount?.toString() ?? '0',
              status.value);
        } catch (e) {
          Get.snackbar('Error', 'Transaction failed: ${e.toString()}');
        }
      } else {
        Get.snackbar('Error', 'Insufficient funds');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error fetching documents: ${e.toString()}');
    }
  }

  Future<void> transactionData(
      String senderId,
      String receiverId,
      String senderName,
      String receiverName,
      String sendingAmount,
      bool status) async {
    // Generate a unique document ID using current timestamp
    String transactionId = 'Paysense${DateTime.now().millisecondsSinceEpoch}';

    await FirebaseFirestore.instance
        .collection('transactions')
        .doc(transactionId)
        .set({
      'SenderId': senderId,
      'ReceiverId': receiverId,
      'SenderName': senderName,
      'ReceiverName': receiverName,
      'SendingAmount': sendingAmount,
      'Status': status,
      'Timestamp': FieldValue.serverTimestamp(), // Storing the server timestamp
    }).then((value) {
      log('Data saved in Firestore successfully');
    });
  }
}
