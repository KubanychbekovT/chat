import 'package:chat/application/auth/sign_in/sign_in_cubit.dart';
import 'package:chat/presentation/chat/chat_overview/chat_overivew_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            state.when(
              success: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => ChatOverviewPage(),));
              },
              error: (errorMessage) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(errorMessage)),
                );
              },
             initial: () {  }, loading: () {  },
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
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    signInCubit.signIn('', '');
                  },
                  child: const Text('Sign In'),
                ),
                // Other UI elements
              ],
            );
          },
        ),
      ),
    );
  }
}
