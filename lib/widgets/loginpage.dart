import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/ApiMethodes.dart';
import 'package:recharge_retry/web/apiservices.dart';
import 'package:recharge_retry/widgets/native_prefs.dart';
import 'package:recharge_retry/widgets/service_dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  void _login() async {
    //userLoginForStaff.php
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // 🔹 Simulate API call


    Map<String,String>mp=new HashMap();
    mp['mobile']=_usernameController.text.trim();
    mp['password']=_passwordController.text.trim();

    ApiHelper apiHelper=new ApiHelper();

    String loginurl=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.userLoginForStaff+"?q="+apiHelper.getRandomnumber();

    String response=await apiHelper.postApiResponse(loginurl, mp);





    setState(() => _isLoading = false);
    var js=jsonDecode(response);

    if(js['status']==1)
      {

String data=js['data'].toString();
await NativePrefs.saveValue("Token", data);

Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => SaveAppServicesScreen()));

      }
    else{

      ApiHelper.showAlertDialog(context, "Login failed");
    }



    // 🔹 Navigate to Home Page
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock_outline, size: 80, color: Colors.blue),
                const SizedBox(height: 16),

                const Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                /// 🔹 Username
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Username is required" : null,
                ),
                const SizedBox(height: 16),

                /// 🔹 Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Password should not be empty" : null,
                ),
                const SizedBox(height: 24),

                /// 🔹 Login Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("LOGIN"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
