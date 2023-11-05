import 'package:mobx/mobx.dart';

import '../../../infra/cache/local_storage.dart';

part 'information_store.g.dart';

class InformationStore = InformationStoreBase with _$InformationStore;

abstract class InformationStoreBase with Store {
  InformationStoreBase(this._local) {
    initState();
  }

  final LocalStorage _local;

  @observable
  String? inputText;

  ObservableList<String> informations = ObservableList<String>.of([]);

  @action
  void setInputText(String value) => inputText = value;

  @action
  void setInformation(String value) => informations.add(value);

  @action
  void setInformations(List<String> values) {
    informations.clear();
    informations.addAll(values);
  }

  @action
  void removeInformations(int index) => informations.removeAt(index);

  @action
  void _editInformation(int index, String value) => informations[index] = value;

  String? get validationInput {
    if (inputText == null || inputText?.isEmpty == true) {
      return 'Escreva um texto válido';
    }
    return null;
  }

  Future<void> initState() async {
    final list = await _local.getAll();
    setInformations(list);
  }

  void deleteiInformation(int index) {
    removeInformations(index);
    saveLocal();
  }

  void editInformation(int index, String value) {
    _editInformation(index, value);
    saveLocal();
  }

  Future<void> saveLocal() async {
    await _local.setStorage(informations);
  }

  Future<String?> saveInformation() async {
    final validation = validationInput;
    if (validation != null) return validation;
    informations.add(inputText!);
    await saveLocal();
    return null;
  }
}
