import 'package:chat/application/auth/sign_in/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat/chat_overview/chat_overivew_page.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1b252f),
        title: Center(child: const Text('Log In')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              state.when(
                success: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatOverviewPage(),
                    ),
                  );
                },
                error: (errorMessage) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(errorMessage)),
                  );
                },
                initial: () {},
                loading: () {},
              );
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      // Logic to update email
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      // Logic to update password
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signInCubit.signIn('', ''); // Ваша логика входа
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1b252f),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Sign In'),
                  ),
                  // Other UI elements
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
