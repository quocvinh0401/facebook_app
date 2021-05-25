import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Account {
  final String id;
  final String password;

  const Account({
    @required this.id,
    @required this.password
  });
}
