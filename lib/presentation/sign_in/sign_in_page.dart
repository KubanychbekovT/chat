import 'package:chat/application/auth/sign_in/sign_in_cubit.dart';
import 'package:chat/presentation/core/main_page.dart';
import 'package:chat/presentation/sign_in/forgot_password.dart';
import 'package:chat/presentation/sign_in/sign_up_page.dart';
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
                      builder: (context) => MainPage(),
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
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
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
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                          },
                          child: Text('Sign Up', style: TextStyle(color: Colors.blue, fontSize: 16),)),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword(),));
                          },
                          child: Text('Forgot password?', style: TextStyle(color: Colors.blue, fontSize: 16),)),
                    ],
                  ),

                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signInCubit.signIn('', '');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1b252f),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: BlocBuilder<SignInCubit, SignInState>(
                      builder: (context, state) {
                        return state.maybeMap(loading: (_)=>const Center(child:  CircularProgressIndicator(),),orElse: ()=>const Text('Sign In'));
                      },
                    ),
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
