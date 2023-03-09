import 'package:get/get.dart';

class GetxLanguage extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //English>>>>>>>>>>>>>>>>>>>>>>>
        'en_US': {'hello': 'HELLO WORLD', 'Change Language': "Change Language"},

        ////////////////////
        'hi_IN': {
          'hello': 'हैलो वर्ल्ड',
          'Change Language': "डुजो में आपका स्वागत है",
          'SCIPRO': "डुजो में आपका स्वागत है"
        },

        'kn_IN': {
          'hello': 'ಹಲೋ ವರ್ಲ್ಡ್',
          'Change Language': "DUJO ಗೆ ಸುಸ್ವಾಗತ"
        },

        'ml_IN': {
          'hello': 'ഹലോಡ್',
         'Change Language': "ഹലോ"
         }
      };
}
