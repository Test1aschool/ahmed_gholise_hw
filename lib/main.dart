// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'localization.dart';
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => LanguageProvider(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class LanguageProvider with ChangeNotifier {
//   Locale _locale = Locale('ar');
//
//   Locale get locale => _locale;
//
//   void changeLanguage(String languageCode) {
//     _locale = Locale(languageCode);
//     notifyListeners();
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       locale: Provider.of<LanguageProvider>(context).locale,
//       theme: ThemeData(
//         primaryColor: Colors.blueAccent,
//         scaffoldBackgroundColor: Colors.grey[100],
//         colorScheme: ColorScheme.light(
//           primary: Colors.blueAccent,
//           secondary: Colors.orangeAccent,
//         ),
//         cardColor: Colors.white,
//         textTheme: TextTheme(
//           // لا تستخدم bodyText1 و bodyText2
//         ),
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.blueAccent,
//           textTheme: ButtonTextTheme.primary,
//         ),
//       ),
//       home: LoginPage(),
//     );
//   }
// }
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   String? emailValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'يرجى إدخال البريد الإلكتروني';
//     }
//     final RegExp emailRegex = RegExp(
//       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
//     );
//     if (!emailRegex.hasMatch(value)) {
//       return 'يرجى إدخال بريد إلكتروني صحيح';
//     }
//     return null;
//   }
//
//   String? passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'يرجى إدخال كلمة المرور';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(Localization.getTranslation('login', Provider.of<LanguageProvider>(context).locale.languageCode)),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Card(
//             elevation: 8,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextFormField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         labelText: Localization.getTranslation('email', Provider.of<LanguageProvider>(context).locale.languageCode),
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                       ),
//                       validator: emailValidator,
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       controller: passwordController,
//                       decoration: InputDecoration(
//                         labelText: Localization.getTranslation('password', Provider.of<LanguageProvider>(context).locale.languageCode),
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                       ),
//                       obscureText: true,
//                       validator: passwordValidator,
//                     ),
//                     SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(email: emailController.text)));
//                         }
//                       },
//                       child: Text(Localization.getTranslation('confirm', Provider.of<LanguageProvider>(context).locale.languageCode)),
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final String email;
//
//   HomePage({required this.email});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(Localization.getTranslation('home', Provider.of<LanguageProvider>(context).locale.languageCode)),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Card(
//             elevation: 8,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     Localization.getTranslation('welcome', Provider.of<LanguageProvider>(context).locale.languageCode) + ': $email',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 32),
//                   ElevatedButton(
//                     onPressed: () {
//                       Provider.of<LanguageProvider>(context, listen: false).changeLanguage('en');
//                     },
//                     child: Text(Localization.getTranslation('to_english', Provider.of<LanguageProvider>(context).locale.languageCode)),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       Provider.of<LanguageProvider>(context, listen: false).changeLanguage('ar');
//                     },
//                     child: Text(Localization.getTranslation('to_arabic', Provider.of<LanguageProvider>(context).locale.languageCode)),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'localization.dart';

void main() {
  runApp(MyApp());
}

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        theme: themeController.isDarkMode.value
            ? ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            primary: Colors.teal,
            secondary: Colors.tealAccent,
          ),
          scaffoldBackgroundColor: Colors.black,
          cardColor: Colors.grey[850],
        )
            : ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.teal,
            secondary: Colors.tealAccent,
          ),
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.white,
        ),
        home: LoginPage(),
      );
    });
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'يرجى إدخال بريد إلكتروني صحيح';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.getTranslation('login', Get.locale?.languageCode ?? 'ar')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: Localization.getTranslation('email', Get.locale?.languageCode ?? 'ar'),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                      ),
                      validator: emailValidator,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: Localization.getTranslation('password', Get.locale?.languageCode ?? 'ar'),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال كلمة المرور';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.to(HomePage(email: emailController.text));
                        }
                      },
                      child: Text(
                        Localization.getTranslation('confirm', Get.locale?.languageCode ?? 'ar'),
                        style: TextStyle(color: Colors.white), // لون النص
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String email;

  HomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text(Localization.getTranslation('home', Get.locale?.languageCode ?? 'ar'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Localization.getTranslation('welcome', Get.locale?.languageCode ?? 'ar') + ': $email',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      themeController.toggleTheme();
                    },
                    child: Text(
                      themeController.isDarkMode.value ? 'تغيير إلى الوضع النهاري' : 'تغيير إلى الوضع الليلي',
                      style: TextStyle(color: Colors.white), // لون النص
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}