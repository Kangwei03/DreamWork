import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('dd-MMM-yyyy');
DateFormat dateFormatLong = DateFormat('yyyy-MM-dd hh:mm:ss');
NumberFormat digitFormat = NumberFormat("#,##0.00", "en_US");
NumberFormat numberFormat = NumberFormat("##0.00", "en_US");
NumberFormat integerFormat = NumberFormat("###", "en_US");

/// @desc Convert date string to formatted date string
///
/// @format dd-MMM-yyyy
String dateFormatterFromString(String date){
  try{
    return dateFormat.format(dateFormatLong.parse(date));
  }catch(error){
    return '';
  }
}

/// @desc Convert date time to formatted date string
///
/// @format dd-MMM-yyyy
/// @param {DateTime} date
/// @returns {String} Returns the formatted date string
String dateFormatterFromDate(DateTime date){
  try{
    return dateFormat.format(date);
  }catch(error){
    return '';
  }
}

/// @desc Convert double to formatted double string
///
/// @format #,##0.00
String digitFormatterFromDouble(double digit){
  try{
    return digitFormat.format(digit);
  }catch(error){
    return '';
  }
}

/// @desc Convert double to formatted double string
///
/// @format #,##0.00
String digitFormatterFromString(String digit){
  try{
    return digitFormat.format(double.parse(digit));
  }catch(error){
    return '';
  }
}

/// @desc Convert double to formatted number string
///
/// @format ##0.00
String numberFormatterFromDouble(double number){
  try{
    return numberFormat.format(number);
  }catch(error){
    return '';
  }
}

/// @desc Convert double to formatted integer string
///
/// @format ###
String integerFormatterFromDouble(double number){
  try{
    return integerFormat.format(number);
  }catch(error){
    return '';
  }
}