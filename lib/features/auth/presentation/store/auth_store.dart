import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @observable
  String? user;

  @observable
  String? password;

  @action
  void setUser(String value) {
    user = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @computed
  String? get validationUser {
    if (user == null || user?.isEmpty == true) {
      return 'Campo obrigatório';
    }
    if (user!.endsWith(' ')) {
      return 'O campo não pode conter espaço no final.';
    }
    if (regeMax(user ?? '')) {
      return 'O campo não pode ultrapassar 20 caracteres.';
    }

    return null;
  }

  bool regeMax(String value) {
    final conditionMax = RegExp(r'^.{1,20}$');
    if (conditionMax.hasMatch(value)) {
      return false;
    }
    return true;
  }

  @computed
  String? get validationPassword {
    if (password == null || password?.isEmpty == true) {
      return 'Campo obrigatório';
    }
    final conditionLength = RegExp(r'^.{2,}$');
    if (!conditionLength.hasMatch(password ?? '')) {
      return 'O campo não pode ter menos que dois caracteres.';
    }
    final conditionCaracter = RegExp(r'^[a-zA-Z0-9]{2,}$');
    if (!conditionCaracter.hasMatch(password ?? '')) {
      return "O campo não pode ter caracteres especiais.";
    }
    if (regeMax(password ?? '')) {
      return 'O campo não pode ultrapassar 20 caracteres.';
    }

    return null;
  }

  @computed
  bool get validationForm {
    if (validationUser == null && validationPassword == null) return true;
    return false;
  }
}
