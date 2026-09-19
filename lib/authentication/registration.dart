import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _firstNameController =
      TextEditingController();

  final _surnameController =
      TextEditingController();

  final _usernameController =
      TextEditingController();

  final _emailController =
      TextEditingController();

  final _passwordController =
      TextEditingController();

  final _cellphoneController =
      TextEditingController();

  bool _obscure = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _surnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cellphoneController.dispose();

    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _attemptRegister() {
    final firstName =
        _firstNameController.text.trim();

    final surname =
        _surnameController.text.trim();

    final username =
        _usernameController.text.trim();

    final email =
        _emailController.text.trim();

    final password =
        _passwordController.text;

    final cellphone =
        _cellphoneController.text.trim();

    if (
      firstName.isEmpty ||
      surname.isEmpty ||
      username.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      cellphone.isEmpty
    ) {
      _showSnack(
        "Please complete all registration fields",
      );

      return;
    }

    if (
      !email.contains("@") ||
      !email.contains(".")
    ) {
      _showSnack(
        "Please enter a valid email address",
      );

      return;
    }

    final fullPhoneNumber =
        "+27$cellphone";

    debugPrint(
      "Registered phone number: $fullPhoneNumber",
    );

    _showSnack(
      "Registration successful",
    );

    Navigator.pushReplacementNamed(
      context,
      "/home",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1B0B2A),
              Color(0xFF3C0F73),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 36,
                  ),

              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.map,
                        color: Colors.white,
                        size: 28,
                      ),

                      SizedBox(width: 8),

                      Text(
                        "MyGuide",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Container(
                    padding:
                        const EdgeInsets.all(20),

                    decoration:
                        BoxDecoration(
                      color:
                          const Color(0xFF2B153F),

                      borderRadius:
                          BorderRadius.circular(16),
                    ),

                    child: Column(
                      children: [
                        Align(
                          alignment:
                              Alignment.centerLeft,

                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),

                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),

                        const Text(
                          "Create account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        _field(
                          "First Name",
                          _firstNameController,
                        ),

                        _field(
                          "Surname",
                          _surnameController,
                        ),

                        _field(
                          "Username",
                          _usernameController,
                        ),

                        _field(
                          "Email",
                          _emailController,
                        ),

                        TextField(
                          controller:
                              _passwordController,

                          obscureText:
                              _obscure,

                          style:
                              const TextStyle(
                            color: Colors.white,
                          ),

                          decoration:
                              _decoration(
                            "Password",
                          ).copyWith(
                            suffixIcon:
                                IconButton(
                              icon: Icon(
                                _obscure
                                    ? Icons.visibility
                                    : Icons
                                        .visibility_off,

                                color:
                                    Colors.white70,
                              ),

                              onPressed: () {
                                setState(() {
                                  _obscure =
                                      !_obscure;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Cellphone Number
                        Row(
                          children: [
                            Container(
                              height: 56,

                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 14,
                              ),

                              decoration:
                                  BoxDecoration(
                                color:
                                    const Color(
                                  0xFF321F4A,
                                ),

                                borderRadius:
                                    BorderRadius
                                        .circular(12),
                              ),

                              alignment:
                                  Alignment.center,

                              child: const Text(
                                "+27",

                                style:
                                    TextStyle(
                                  color:
                                      Colors.white,
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.w500,
                                ),
                              ),
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: TextField(
                                controller:
                                    _cellphoneController,

                                keyboardType:
                                    TextInputType.phone,

                                style:
                                    const TextStyle(
                                  color:
                                      Colors.white,
                                ),

                                decoration:
                                    _decoration(
                                  "Cellphone Number",
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width:
                              double.infinity,

                          child:
                              ElevatedButton(
                            onPressed:
                                _attemptRegister,

                            style:
                                ElevatedButton
                                    .styleFrom(
                              backgroundColor:
                                  const Color(
                                0xFF8A3BFF,
                              ),
                            ),

                            child:
                                const Text(
                              "Register",
                            ),
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    const LoginScreen(),
                              ),
                            );
                          },

                          child:
                              const Text(
                            "Already have an account? Login",

                            style:
                                TextStyle(
                              color: Color(
                                0xFFBDA4FF,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller,
  ) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 12),

      child: TextField(
        controller: controller,

        style:
            const TextStyle(
          color: Colors.white,
        ),

        decoration:
            _decoration(label),
      ),
    );
  }

  InputDecoration _decoration(
    String label,
  ) {
    return InputDecoration(
      labelText: label,

      labelStyle:
          const TextStyle(
        color: Colors.white70,
      ),

      filled: true,

      fillColor:
          const Color(0xFF321F4A),

      border:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(12),

        borderSide:
            BorderSide.none,
      ),
    );
  }
}