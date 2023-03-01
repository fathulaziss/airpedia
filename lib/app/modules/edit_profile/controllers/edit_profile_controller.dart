import 'dart:io';

import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/models/user_model.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:airpedia/utils/format_date_time.dart';
import 'package:airpedia/widgets/others/show_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  RxString photoProfileEdited = ''.obs;
  RxBool isPhotoEdited = false.obs;

  final cFullName = TextEditingController();
  RxString fullName = ''.obs;
  bool isValidFullName = false;

  final cEmail = TextEditingController();

  final cDateOfBirth = TextEditingController();
  RxString dateOfBirth = ''.obs;
  bool isValidDateOfBirth = false;

  RxBool isValidForm = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    photoProfileEdited(cUserInfo.dataUser.value.imageProfile);
    cFullName.text = cUserInfo.dataUser.value.fullName;
    cEmail.text = cUserInfo.dataUser.value.email;
    cDateOfBirth.text = FormatDateTime.format(
      value: DateTime.parse(cUserInfo.dataUser.value.dateOfBirth),
      format: DateFormat('dd/MM/yyyy'),
    );
    setFullName(cUserInfo.dataUser.value.fullName);
    setDateOfBirth(DateTime.parse(cUserInfo.dataUser.value.dateOfBirth));
  }

  Future<void> checkPermission(ImageSource source) async {
    final isCameraGranted = await Permission.camera.isGranted;
    if (isCameraGranted) {
      await changePhotoProfile(source);
    } else {
      showPopUpInfo(
        title: 'requestPermission'.tr,
        description: 'requestPermissionCamera'.tr,
        onPress: () async {
          Get.back();
          await requestCameraPermission(source);
        },
      );
    }
  }

  Future<void> requestCameraPermission(ImageSource source) async {
    final cameraStatus = await Permission.camera.request();
    if (cameraStatus.isGranted) {
      if (cameraStatus.isGranted) {
        await changePhotoProfile(source);
      }
    } else if (cameraStatus.isPermanentlyDenied || cameraStatus.isRestricted) {
      showPopUpInfo(
        title: 'information'.tr,
        description: 'requestPermissionCameraDenyPermanent'.tr,
        labelButton: 'OK',
        onPress: () async {
          Get.back();
          await openAppSettings();
        },
      );
    } else {
      showToast(message: 'requestPermissionCameraDeny'.tr);
    }
  }

  void setFullName(String value) {
    fullName(value);
    if (fullName.value.isNotEmpty) {
      isValidFullName = true;
    } else {
      isValidFullName = false;
    }
    validateForm();
  }

  void setDateOfBirth(DateTime value) {
    dateOfBirth(value.toString());
    if (dateOfBirth.value.isNotEmpty) {
      isValidDateOfBirth = true;
    } else {
      isValidDateOfBirth = false;
    }
    validateForm();
  }

  void validateForm() {
    if (isValidFullName && isValidDateOfBirth) {
      isValidForm(true);
    } else {
      isValidForm(false);
    }
  }

  Future<void> changePhotoProfile(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    photoProfileEdited(file!.path);
    isPhotoEdited(true);
  }

  void removePhotoProfile() {
    photoProfileEdited('');
    isPhotoEdited(true);
    Get.back();
  }

  Future<String> uploadPhoto() async {
    final fileName = basename(photoProfileEdited.value);

    final ref = FirebaseStorage.instance.ref().child(fileName);
    final task = ref.putFile(File(photoProfileEdited.value));
    final snapshot = await task;
    final url = await snapshot.ref.getDownloadURL();
    logSys('cek url : $url');
    return url;
  }

  Future<void> submit() async {
    try {
      AppUtils.dismissKeyboard();

      isLoading(true);

      var url = '';

      if (photoProfileEdited.isNotEmpty) {
        url = await uploadPhoto();
      }

      final dataUser = UserModel(
        balance: cUserInfo.dataUser.value.balance,
        dateOfBirth: dateOfBirth.value,
        email: cUserInfo.dataUser.value.email,
        fullName: fullName.value,
        imageProfile: url,
        pinTransaction: cUserInfo.dataUser.value.pinTransaction,
        userId: cUserInfo.dataUser.value.userId,
      );

      await cUserInfo.updateDataUser(data: dataUser);
      await cUserInfo.getDataUser();

      await Future.delayed(const Duration(seconds: 1));

      isLoading(false);

      await Future.delayed(const Duration(milliseconds: 220));

      showPopUpInfo(
        title: 'success'.tr,
        description: 'updateProfileSuccess'.tr,
        onPress: () {
          Get
            ..back()
            ..back();
        },
      );
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
