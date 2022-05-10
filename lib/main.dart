import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:uno/uno.dart';

const url = "https://pokeapi.co/api/v2/";
main() async {
  unoPackage();
}

//Usando Uno

void unoPackage() async {
  final uno = Uno();
  final response = await uno(
    url: url,
    method: 'get',
  );
  print(response.data);
}

// usando dio

void dioPackage() async {
  final response = await Dio().get(url);
  // vem como map
  print(response.data);
}

// usando http

void httpPackage() async {
  final response = await http.get(Uri.parse(url));
  final body = response.body;
  //precisa converter para json
  final json = jsonDecode(response.body);
  print(json);
}

// usando dart puro

void httpClient() async {
  var url = "https://jsonplaceholder.typicode.com/todos";
  // criar o cliente
  final client = HttpClient();
  // cria uma requisicao http
  final request = await client.openUrl('get', Uri.parse(url));
  // faz a requisicao para o servidor
  request.headers.set('content-type', 'aplication/json');

  //solicita o fechamento do servidor
  final response = await request.close();
  final buffer = StringBuffer();

  // criar um lista para adicionar os dados do Data
  final list = <String>[];

// Escuta a String
  await for (var data in response) {
    final string = utf8.decode(data);
    buffer.write(string);
  }

  final body = buffer.toString();
  print(body);
}
