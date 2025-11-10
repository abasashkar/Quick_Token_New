import 'package:flutter/material.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class LaboratoryLogin extends StatefulWidget {
  const LaboratoryLogin({super.key});

  @override
  State<LaboratoryLogin> createState() => _PatientLoginState();
}

class _PatientLoginState extends State<LaboratoryLogin> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: CustomAppBar(
        icon: const Icon(Icons.menu, color: Colors.white),
        title: ExtraSmallText(
          text: 'Laboratory Login',
          size: 20,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 10, 0),
              child: ExtraSmallText(
                text: 'Please Enter Your Email Address',
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
            child: ExtraSmallText(
              text:
                  'We need to verify your Email Address,We will send a OTP(One Time Password)to the email account you enter below',
              size: 16,
              color: Colors.black,
              maxLines: 3,
              overFlow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 50),
          Column(
            children: [
              Container(
                width: 335,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.email, size: 30),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                    child: ExtraSmallText(
                      text: "If you don't have an account?",
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text('Create Account')),
                ],
              ),
              SizedBox(height: 20),

              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF4F8BFF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.navigate_next, size: 60, color: Colors.white),
              ),
              SizedBox(height: 10),
              Center(
                child: ExtraSmallText(
                  text: 'Next',
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
