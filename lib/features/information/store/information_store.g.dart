// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationStore on InformationStoreBase, Store {
  late final _$inputTextAtom =
      Atom(name: 'InformationStoreBase.inputText', context: context);

  @override
  String? get inputText {
    _$inputTextAtom.reportRead();
    return super.inputText;
  }

  @override
  set inputText(String? value) {
    _$inputTextAtom.reportWrite(value, super.inputText, () {
      super.inputText = value;
    });
  }

  late final _$InformationStoreBaseActionController =
      ActionController(name: 'InformationStoreBase', context: context);

  @override
  void setInputText(String value) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.setInputText');
    try {
      return super.setInputText(value);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInformation(String value) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.setInformation');
    try {
      return super.setInformation(value);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInformations(List<String> values) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.setInformations');
    try {
      return super.setInformations(values);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInformations(int index) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.removeInformations');
    try {
      return super.removeInformations(index);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _editInformation(int index, String value) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase._editInformation');
    try {
      return super._editInformation(index, value);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inputText: ${inputText}
    ''';
  }
}
