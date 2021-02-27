// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `App Name`
  String get appName {
    return Intl.message(
      'App Name',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry.`
  String get page1Description {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      name: 'page1Description',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get page1Button {
    return Intl.message(
      'Get Started',
      name: 'page1Button',
      desc: '',
      args: [],
    );
  }

  /// `Select Option`
  String get page2Title {
    return Intl.message(
      'Select Option',
      name: 'page2Title',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry.`
  String get page2SubTitle {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      name: 'page2SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get page2User {
    return Intl.message(
      'User',
      name: 'page2User',
      desc: '',
      args: [],
    );
  }

  /// `Worker`
  String get page2Worker {
    return Intl.message(
      'Worker',
      name: 'page2Worker',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get page3Title {
    return Intl.message(
      'User',
      name: 'page3Title',
      desc: '',
      args: [],
    );
  }

  /// `Enter ypur mobile number`
  String get page3SubTile {
    return Intl.message(
      'Enter ypur mobile number',
      name: 'page3SubTile',
      desc: '',
      args: [],
    );
  }

  /// `SendSMS`
  String get page3Button {
    return Intl.message(
      'SendSMS',
      name: 'page3Button',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}