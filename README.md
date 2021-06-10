# Flutter Internationalization
Proyecto en flutter para cambiar el lenguaje de la aplicacion dependiendo de el lenguaje del dispositivo.
This code is based on (https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
Complement tutorial (https://www.youtube.com/watch?v=Zw4KoorVxgg)

## Getting Started

1. In pubspec.yaml the dependency is added:
    flutter_localizations: 
        sdk: flutter
    intl: ^0.17.0
    and In the pubspec.yaml in the flutter part the dependency is added:
    generate: true
2. In main.dart the supportedLocales is added in material app like this:
    supportedLocales: L10n.all, and we create the L10n class inside a folder inside lib called l10n, and in this class we will have all the languages ​​that the application will support.
3. Then we will create a file in the root of the application called "l10n.yaml" with the following lines:
    arb-dir: lib/l10n
    template-arb-file: app_en.arb
    output-localization-file: app_localizations.dart
4. Then we will create a file in the l10n folder for each language that the app supports, for example: "app_en.arb" with the following lines: {
    "language": "Español",
    "helloWorld": "Hola Mundo!",
    "hello": "Hola {username}"
}   

5. we run the app and then we enter the dart tool / flutter_gen / folder and there we will have the app_localizations_es.dart of each language that we are going to support

6. later in material app we are going to add the following lines with the loaclizationsDelegates:
localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

7. and when calling a text we will call it from appLocalizations like this:  AppLocalizations.of(context)!.helloWorld      
