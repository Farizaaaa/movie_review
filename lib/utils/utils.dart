import 'dart:math';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class Utils {
  String getUid() {
    return (100000 + Random().nextInt(10000)).toString();
  }

  Future<Uint8List?> pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file!.readAsBytes();
  }
}
