// ignore: file_names
import 'package:flutter/material.dart';
import '../widget/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          decoration: const BoxDecoration(
            // color: Colors.black.withOpacity(0.5),
            image: DecorationImage(
              image: AssetImage(
                  'asset/images/restaurant4.jpeg'), // Update the path if needed
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.4), // Overlay with opacity
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SignUp',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        controller: nameController,
                        labelText: 'Name',
                        keyboardType: TextInputType.text,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        inputTextColor: Theme.of(context).colorScheme.secondary,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        inputTextColor: Theme.of(context).colorScheme.secondary,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: phoneController,
                        labelText: 'Phone',
                        keyboardType: TextInputType.phone,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        inputTextColor: Theme.of(context).colorScheme.secondary,textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: addressController,
                        labelText: 'Address',
                        keyboardType: TextInputType.text,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        inputTextColor: Theme.of(context).colorScheme.secondary,textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 45,
                        width: 350,
                        child: TextField(
                          controller: passwordController,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 45,
                        width: 350,
                        child: TextField(
                          controller: confirmPasswordController,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 70),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            String email = emailController.text;
                            String password = passwordController.text;
                            print('Email: $email, Password: $password');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text('SignUp',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('LogIn'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
