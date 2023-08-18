import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'my-account': 'MY ACCOUNT',
          'my-lib': 'LIBRARY',
          'my-sub': 'SUBSCRIPTION',
          'history': 'HISTORY',
          'our-part': 'OURS PARTENERS',
          'sav': 'CUSTOMER SERVICE',
        },
        'fr_FR': {
          'my-account': 'MON COMPTE',
          'my-lib': 'MA BIBLIOTHEQUE',
          'my-sub': 'MON ABONNEMENT',
          'history': 'HISTORIQUE',
          'our-part': 'NOS PARTENAIRES',
          'sav': 'SERVICE CLIENT',
        }
      };
}