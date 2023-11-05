import 'package:flutter/material.dart';
import 'package:prova_flutter/core/widgets/background.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
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
                                "Texto digitado 1",
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
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {},
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
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
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
}
