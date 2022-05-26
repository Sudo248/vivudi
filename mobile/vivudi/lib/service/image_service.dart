import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vivudi/resources/app_color.dart';

class ImageService {
  late final ImagePicker _imagePicker;
  ImageCropper? _imageCropper;
  Future<String?> Function(File image)? uploadImage;
  Future<String?> Function(File image)? storeImage;
  bool compress = false;

  ImageService() {
    _imagePicker = ImagePicker();
    _imageCropper = ImageCropper();
  }

  ///
  /// pick image with specific source [ImageSource.camera] or [ImageSource.gallery]
  /// [uploadImage] return url image after upload success and null if failed.
  /// [storeImage] return path image if store success and null if failed
  ///

  Future<File?> pickImage(
    ImageSource source, {
    bool crop = false,
    Future<String?> Function(File image)? uploadImage,
    Future<String?> Function(File image)? storeImage,
    bool compress = false,
  }) async {
    this.uploadImage = uploadImage;
    this.storeImage = storeImage;
    this.compress = compress;

    final pickImage = await _imagePicker.pickImage(source: source);

    if (pickImage == null) {
      return null;
    }

    File? image;

    if (crop) {
      image = await _cropImage(pickImage.path);
      if (image == null) {
        return null;
      }
    } else {
      image = File(pickImage.path);
    }

    if (storeImage != null) {
      storeImage(image);
    }

    print(image.path);
    if (uploadImage != null) {
      if (compress) {
        final imageCompress = await _compressImage(image.path, 35);
        uploadImage(imageCompress);
      } else {
        uploadImage(image);
      }
    }

    return image;
  }

  ///
  /// Image after crop is saved in NSTemporaryDirectory on iOS and application Cache directory on Android,
  /// so it can bo lost, must store it somewhere if need.
  ///
  Future<File?> _cropImage(String path) async {
    _imageCropper ??= ImageCropper();
    final CroppedFile? imageCropped = await _imageCropper!.cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      cropStyle: CropStyle.circle,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Vivudi',
          toolbarColor: AppColors.backgroundColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Vivudi',
        ),
      ],
    );

    if (imageCropped == null) {
      return null;
    }
    return File(imageCropped.path);
  }

  Future<File> _compressImage(String path, int quality) async {
    /// TODO: Compress here

    return File(path);
  }
}
