import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:prova_flutter/features/auth/presentation/store/auth_store.dart';
import 'package:prova_flutter/features/auth/presentation/widgets/custom_textfield.dart';

import '../../../../core/widgets/background.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthStoreBase store = AuthStore();
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            CustomTextField(
              key: const Key('userTextField'),
              label: 'Usuário',
              prefixIcon: Icons.person,
              onChanged: store.setUser,
              validator: (value) => store.validationUser,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              key: const Key('passwordTextField'),
              label: 'Senha',
              prefixIcon: Icons.lock,
              onChanged: store.setPassword,
              validator: (value) => store.validationPassword,
            ),
            const SizedBox(height: 25),
            Observer(builder: (context) {
              return ElevatedButton(
                key: const Key('enterButton'),
                onPressed: store.validationForm
                    ? () {
                        context.push('/information');
                      }
                    : null,
                child: const Text("Entrar"),
              );
            })
          ],
        ),
      ),
    );
  }
}
