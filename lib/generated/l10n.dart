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

  static S _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance;
  }

  static S maybeOf(BuildContext context) {
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

  /// `Enter your mobile number`
  String get page3SubTile {
    return Intl.message(
      'Enter your mobile number',
      name: 'page3SubTile',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get page3HintText {
    return Intl.message(
      'Phone number',
      name: 'page3HintText',
      desc: '',
      args: [],
    );
  }

  /// `Send SMS`
  String get page3Button {
    return Intl.message(
      'Send SMS',
      name: 'page3Button',
      desc: '',
      args: [],
    );
  }

  /// `Enter code`
  String get page4Title {
    return Intl.message(
      'Enter code',
      name: 'page4Title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your received code:`
  String get page4Subtitle {
    return Intl.message(
      'Enter your received code:',
      name: 'page4Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Validate`
  String get page4Button {
    return Intl.message(
      'Validate',
      name: 'page4Button',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get page5Title {
    return Intl.message(
      'Sign Up',
      name: 'page5Title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get page5Name {
    return Intl.message(
      'Name',
      name: 'page5Name',
      desc: '',
      args: [],
    );
  }

  /// `Lastname`
  String get page5lastName {
    return Intl.message(
      'Lastname',
      name: 'page5lastName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get page5Pass {
    return Intl.message(
      'Password',
      name: 'page5Pass',
      desc: '',
      args: [],
    );
  }

  /// `Validate password`
  String get page5RepeatPass {
    return Intl.message(
      'Validate password',
      name: 'page5RepeatPass',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get page5Button {
    return Intl.message(
      'Create Account',
      name: 'page5Button',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get page6Title {
    return Intl.message(
      'Interests',
      name: 'page6Title',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get page6Button {
    return Intl.message(
      'Done',
      name: 'page6Button',
      desc: '',
      args: [],
    );
  }

  /// `Available jobs`
  String get mainPage30 {
    return Intl.message(
      'Available jobs',
      name: 'mainPage30',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get mainPage31 {
    return Intl.message(
      'Notifications',
      name: 'mainPage31',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get mainPage32 {
    return Intl.message(
      'Message',
      name: 'mainPage32',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get mainPage33 {
    return Intl.message(
      'Contact',
      name: 'mainPage33',
      desc: '',
      args: [],
    );
  }

  /// `See more about`
  String get mainPage34 {
    return Intl.message(
      'See more about',
      name: 'mainPage34',
      desc: '',
      args: [],
    );
  }

  /// `Jobs`
  String get moreAboutPage0 {
    return Intl.message(
      'Jobs',
      name: 'moreAboutPage0',
      desc: '',
      args: [],
    );
  }

  /// `Studies`
  String get moreAboutPage1 {
    return Intl.message(
      'Studies',
      name: 'moreAboutPage1',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get moreAboutPage2 {
    return Intl.message(
      'Skills',
      name: 'moreAboutPage2',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get moreAboutPage3 {
    return Intl.message(
      'Contact',
      name: 'moreAboutPage3',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get mainPage50 {
    return Intl.message(
      'Search',
      name: 'mainPage50',
      desc: '',
      args: [],
    );
  }

  /// `Write message`
  String get chatPage0 {
    return Intl.message(
      'Write message',
      name: 'chatPage0',
      desc: '',
      args: [],
    );
  }

  /// `Take on`
  String get chatPage1 {
    return Intl.message(
      'Take on',
      name: 'chatPage1',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
