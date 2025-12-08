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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To`
  String get welcome {
    return Intl.message('Welcome To', name: 'welcome', desc: '', args: []);
  }

  /// `Welcome `
  String get welcomeName {
    return Intl.message('Welcome ', name: 'welcomeName', desc: '', args: []);
  }

  /// `Fruit`
  String get fruit {
    return Intl.message('Fruit', name: 'fruit', desc: '', args: []);
  }

  /// `HUB`
  String get hub {
    return Intl.message('HUB', name: 'hub', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Start Now!`
  String get startNow {
    return Intl.message('Start Now!', name: 'startNow', desc: '', args: []);
  }

  /// `Search and shop`
  String get searchAndShop {
    return Intl.message(
      'Search and shop',
      name: 'searchAndShop',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `password`
  String get password {
    return Intl.message('password', name: 'password', desc: '', args: []);
  }

  /// `forget password ?`
  String get forgetPassword {
    return Intl.message(
      'forget password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create account.`
  String get createAccount {
    return Intl.message(
      'Create account.',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `login with Facebook`
  String get loginWithFacebook {
    return Intl.message(
      'login with Facebook',
      name: 'loginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `login with Apple`
  String get loginWithApple {
    return Intl.message(
      'login with Apple',
      name: 'loginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Create account`
  String get createNewAccount {
    return Intl.message(
      'Create account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to`
  String get byCreatingAnAccountYouAgreeTo {
    return Intl.message(
      'By creating an account, you agree to',
      name: 'byCreatingAnAccountYouAgreeTo',
      desc: '',
      args: [],
    );
  }

  /// `our Terms and Conditions.`
  String get OurTermsAndConditions {
    return Intl.message(
      'our Terms and Conditions.',
      name: 'OurTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address.`
  String get invalidEmail {
    return Intl.message(
      'Invalid email address.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'The account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `This user account has been disabled.`
  String get userDisabled {
    return Intl.message(
      'This user account has been disabled.',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get userNotFound {
    return Intl.message(
      'No user found for that email.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password.`
  String get wrongPassword {
    return Intl.message(
      'Incorrect password.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your internet connection.`
  String get networkRequestFailed {
    return Intl.message(
      'Network error. Please check your internet connection.',
      name: 'networkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please try again later.`
  String get tooManyRequests {
    return Intl.message(
      'Too many attempts. Please try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Sign up failed. Please try again.`
  String get SignupFailed {
    return Intl.message(
      'Sign up failed. Please try again.',
      name: 'SignupFailed',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed. Please try again.`
  String get SigninFailed {
    return Intl.message(
      'Sign in failed. Please try again.',
      name: 'SigninFailed',
      desc: '',
      args: [],
    );
  }

  /// `Facebook login cancelled.`
  String get FacebookLoginCancelled {
    return Intl.message(
      'Facebook login cancelled.',
      name: 'FacebookLoginCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Facebook login operation in progress`
  String get FacebookLoginOperationInProgress {
    return Intl.message(
      'Facebook login operation in progress',
      name: 'FacebookLoginOperationInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Facebook login operation in progress`
  String get unexpected {
    return Intl.message(
      'Facebook login operation in progress',
      name: 'unexpected',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Best Seller`
  String get bestSeller {
    return Intl.message('Best Seller', name: 'bestSeller', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Good Morning`
  String get goodMorning {
    return Intl.message(
      'Good Morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodEvening {
    return Intl.message(
      'Good Evening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message('Search...', name: 'search', desc: '', args: []);
  }

  /// `Shop now`
  String get shopNow {
    return Intl.message('Shop now', name: 'shopNow', desc: '', args: []);
  }

  /// `EG`
  String get eg {
    return Intl.message('EG', name: 'eg', desc: '', args: []);
  }

  /// `KG`
  String get kg {
    return Intl.message('KG', name: 'kg', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Result`
  String get result {
    return Intl.message('Result', name: 'result', desc: '', args: []);
  }

  /// `you have`
  String get you_have {
    return Intl.message('you have', name: 'you_have', desc: '', args: []);
  }

  /// `products in your shopping cart`
  String get products_in_your_shopping_cart {
    return Intl.message(
      'products in your shopping cart',
      name: 'products_in_your_shopping_cart',
      desc: '',
      args: [],
    );
  }

  /// `add success`
  String get add_success {
    return Intl.message('add success', name: 'add_success', desc: '', args: []);
  }

  /// `delete success`
  String get delete_success {
    return Intl.message(
      'delete success',
      name: 'delete_success',
      desc: '',
      args: [],
    );
  }

  /// `shipping`
  String get shipping {
    return Intl.message('shipping', name: 'shipping', desc: '', args: []);
  }

  /// `payment`
  String get payment {
    return Intl.message('payment', name: 'payment', desc: '', args: []);
  }

  /// `address`
  String get address {
    return Intl.message('address', name: 'address', desc: '', args: []);
  }

  /// `review`
  String get review {
    return Intl.message('review', name: 'review', desc: '', args: []);
  }

  /// `continue`
  String get next {
    return Intl.message('continue', name: 'next', desc: '', args: []);
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Delivery from the location`
  String get delivery_from_the_location {
    return Intl.message(
      'Delivery from the location',
      name: 'delivery_from_the_location',
      desc: '',
      args: [],
    );
  }

  /// `Buy now, pay later`
  String get buy_now_pay_later {
    return Intl.message(
      'Buy now, pay later',
      name: 'buy_now_pay_later',
      desc: '',
      args: [],
    );
  }

  /// `Please specify your payment method.`
  String get please_specify_your_payment_method {
    return Intl.message(
      'Please specify your payment method.',
      name: 'please_specify_your_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `free`
  String get free {
    return Intl.message('free', name: 'free', desc: '', args: []);
  }

  /// `city`
  String get city {
    return Intl.message('city', name: 'city', desc: '', args: []);
  }

  /// `Floor number, apartment number...`
  String get apartment_number {
    return Intl.message(
      'Floor number, apartment number...',
      name: 'apartment_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Request summary :`
  String get summary {
    return Intl.message(
      'Request summary :',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal :`
  String get subtotal {
    return Intl.message('Subtotal :', name: 'subtotal', desc: '', args: []);
  }

  /// `Delivery :`
  String get delivery {
    return Intl.message('Delivery :', name: 'delivery', desc: '', args: []);
  }

  /// `total :`
  String get total {
    return Intl.message('total :', name: 'total', desc: '', args: []);
  }

  /// `confirm`
  String get confirm {
    return Intl.message('confirm', name: 'confirm', desc: '', args: []);
  }

  /// `online`
  String get online {
    return Intl.message('online', name: 'online', desc: '', args: []);
  }

  /// `There are no products in the basket.`
  String get there_are_no_products_in_the_basket {
    return Intl.message(
      'There are no products in the basket.',
      name: 'there_are_no_products_in_the_basket',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get delivery_address {
    return Intl.message(
      'Delivery Address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best deals and highest quality.`
  String get subTitlePageViewOne {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best deals and highest quality.',
      name: 'subTitlePageViewOne',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest, carefully selected fruits. Check out the details, photos, and reviews to make sure you're choosing the perfect fruit.`
  String get subTitlePageViewTwo {
    return Intl.message(
      'We offer you the finest, carefully selected fruits. Check out the details, photos, and reviews to make sure you\'re choosing the perfect fruit.',
      name: 'subTitlePageViewTwo',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
