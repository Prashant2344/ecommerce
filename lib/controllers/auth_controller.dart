import 'package:ecom/consts/consts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthController extends GetxController{
  var isLoading = false.obs;

  var isLoggedIn = false.obs;
  var token = ''.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final _baseUrl = 'http://10.0.2.2:8000/api';
  //login method
  Future<bool> loginMethod({context}) async {
    try {
      var response = await http.post(
        Uri.parse('$_baseUrl/login'),
        body: {'email': emailController.text, 'password': passwordController.text},
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        token.value = jsonResponse['token'];
        isLoggedIn.value = true;
        // Store access token in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token.value);
      } else {
        throw Exception('Failed to login');
      }
      return isLoggedIn.value;
    } catch (e) {
      print(e);
      VxToast.show(context, msg: e.toString());
      return false;
    }
  }

  //signup method
  Future<bool> signupMethod({name,email,password,context}) async {
    try {
      var response = await http.post(
        Uri.parse('$_baseUrl/register'),
        body: {'name':name, 'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        token.value = jsonResponse['token'];
        isLoggedIn.value = true;
        // Store access token in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token.value);
      } else {
        VxToast.show(context, msg: 'Failed to Signup');
        // throw Exception('Failed to Signup');
      }
      return isLoggedIn.value ? true : false;
    } catch (e) {
      print(e);
      VxToast.show(context, msg: e.toString());
      return false;
    }
  }

  //signout method
  signoutMethod(context) async {
    try{
      token.value = '';
      isLoggedIn.value = false;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}