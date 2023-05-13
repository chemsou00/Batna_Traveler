
import 'package:batna_traveler/core/class/status_request.dart';
import 'package:batna_traveler/core/functions/internetcheck.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:convert';


class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await internetCheck()) {
        var response = await http
            .post(Uri.parse(linkUrl), body: data)
            .timeout(const Duration(seconds: 10));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
