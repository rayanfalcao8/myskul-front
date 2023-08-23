import 'package:get/get.dart';
import 'En.dart';
import 'FR.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EN().messages ,
        'fr_FR': FR().messages
      };
}
