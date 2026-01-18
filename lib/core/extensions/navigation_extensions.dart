import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  void push(Widget page) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  Future<T?> pushReplacement<T, TO>(Widget page) => Navigator.of(
        this,
      ).pushReplacement(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.of(
        this,
      ).pushReplacementNamed<T, TO>(routeName, arguments: arguments);

  void back() => Navigator.of(this).pop();

  void popUntil(RoutePredicate predicate) =>
      Navigator.of(this).popUntil(predicate);

  Future<T?> popAndPushNamed<T, TO>(String routeName, {Object? arguments}) =>
      Navigator.of(
        this,
      ).popAndPushNamed<T, TO>(routeName, arguments: arguments);

  Future<T?> pushAndRemoveUntil<T>(Widget page, RoutePredicate predicate) =>
      Navigator.of(
        this,
      ).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), predicate);

  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil<T>(
        routeName,
        (route) => false,
        arguments: arguments,
      );

  Future<bool> maybePop() => Navigator.of(this).maybePop();

  Future<T?> replaceWithCustomRoute<T, TO>(Route<T> route) =>
      Navigator.of(this).pushReplacement(route);

  Future<T?> pushCustomRoute<T>(Route<T> route) =>
      Navigator.of(this).push(route);
}
