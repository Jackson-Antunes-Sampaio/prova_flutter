import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/core/widgets/background.dart';

import '../../../infra/cache/local_storage_adapter.dart';
import '../store/information_store.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  late final InformationStoreBase store;
  @override
  void initState() {
    super.initState();
    store = InformationStore(LocalStorageSharedPreferenceAdapter());
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  child: Observer(builder: (context) {
                    return ListView.builder(
                      itemCount: store.informations.length,
                      itemBuilder: (context, index) {
                        final information = store.informations[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  information,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final resp = await _dialogEdit(information);
                                  if (resp != null ||
                                      resp?.isNotEmpty == true) {
                                    store.editInformation(index, resp!);
                                  }
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final resp = await _dialogDelete();
                                  if (resp == true) {
                                    store.deleteiInformation(index);
                                  }
                                },
                                icon: const CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                onFieldSubmitted: (value) async {
                  await store.saveInformation().then((value) {
                    if (value != null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    }
                  });
                },
                onChanged: store.setInputText,
                decoration: const InputDecoration(
                    label: Center(
                      child: Text(
                        "Digite seu texto",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> _dialogDelete() {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: const Text('Deseja Excluir esse item?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Sim'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<String?> _dialogEdit(String information) {
    return showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: TextFormField(
            autofocus: true,
            initialValue: information,
            decoration: const InputDecoration(
                filled: true, fillColor: Colors.transparent),
            onChanged: (value) => information = value,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Sim'),
              onPressed: () {
                Navigator.of(context).pop(information);
              },
            ),
          ],
        );
      },
    );
  }
}
