import 'dart:core';

class ApiRoutes
{
  static String baseurl="https://uis.sataware.dev/api";

  static String login="$baseurl/login";
  static String register="$baseurl/register";
  static String checkUserStatus="$baseurl/user/status";
  static String user="$baseurl/user/updateProfile";
  static String history="$baseurl/forms";
  static String singleform ="$baseurl/forms/single";
  static String getupdate ="$baseurl/user/getProfile";
  static String updateform ="$baseurl/forms/update";
  static String country ="$baseurl/countries";
  static String state ="$baseurl/states";
  static String cities ="$baseurl/cities";
}