import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _travelStyleController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _travelStyleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //Groups the fields so Flutter can validate them together.
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //Creates a text input with built-in validation support.
              TextFormField(
                //Gives us access to the text entered in that field.
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: Validators.validateName,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: Validators.validateEmail,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: Validators.validatePhone,
              ),
              TextFormField(
                controller: _travelStyleController,
                decoration: const InputDecoration(labelText: 'Travel style'),
                validator: Validators.validateTravelStyle,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text.trim();
                    context.push('/welcome/${Uri.encodeComponent(name)}');
                  }
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
