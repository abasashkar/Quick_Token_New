import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/settings/user_profile.dart';
import 'package:quick_token_new/widgets/arrow_back.dart';
import 'package:quick_token_new/widgets/big_text.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/small_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      navigator!.pop();
                    },
                    child: ArrowBackButton(
                      onTap: () {
                        navigator!.push(
                          MaterialPageRoute(
                            builder: (context) => UserProfile(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/dentist.png'),
                    ),
                    borderRadius: BorderRadius.circular(85),
                    color: const Color.fromARGB(255, 189, 189, 189),
                  ),
                ),
                const SizedBox(height: 10),
                BigText(
                  text: 'Abas Ashkar S A',
                  overflow: TextOverflow.ellipsis,
                  size: 18,
                ),
                const SizedBox(height: 8),
                const ExtraSmallText(
                  text: '_____________________________________________________',
                ),
                const SizedBox(height: 20),

                /// USER ID
                _buildFieldLabelAndInput('User ID'),

                /// LOCATION
                _buildFieldLabelAndInput('Location'),

                /// PHONE NUMBER
                _buildFieldLabelAndInput('Phone Number'),

                /// EMAIL ID
                _buildFieldLabelAndInput('Email ID'),

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process and save form
                      _formKey.currentState!.save();
                      // You can call a controller or API here
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabelAndInput(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(text: label, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your $label';
              }
              return null;
            },
            onSaved: (value) {
              // Save to variables or controller
            },
          ),
        ],
      ),
    );
  }
}
