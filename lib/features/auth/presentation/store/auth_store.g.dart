// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  Computed<String?>? _$validationUserComputed;

  @override
  String? get validationUser => (_$validationUserComputed ??= Computed<String?>(
          () => super.validationUser,
          name: 'AuthStoreBase.validationUser'))
      .value;
  Computed<String?>? _$validationPasswordComputed;

  @override
  String? get validationPassword => (_$validationPasswordComputed ??=
          Computed<String?>(() => super.validationPassword,
              name: 'AuthStoreBase.validationPassword'))
      .value;
  Computed<bool>? _$validationFormComputed;

  @override
  bool get validationForm =>
      (_$validationFormComputed ??= Computed<bool>(() => super.validationForm,
              name: 'AuthStoreBase.validationForm'))
          .value;

  late final _$userAtom = Atom(name: 'AuthStoreBase.user', context: context);

  @override
  String? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'AuthStoreBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$AuthStoreBaseActionController =
      ActionController(name: 'AuthStoreBase', context: context);

  @override
  void setUser(String value) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password},
validationUser: ${validationUser},
validationPassword: ${validationPassword},
validationForm: ${validationForm}
    ''';
  }
}
