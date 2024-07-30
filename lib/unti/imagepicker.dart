import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerHelper {
  Future<File> uploadImage(String inputSource) async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );


    File imageFile = File(pickedImage!.path);
    return imageFile;
  }
}
