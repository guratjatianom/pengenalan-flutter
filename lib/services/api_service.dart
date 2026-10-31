import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/user.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  // a & b) Default timeout 10 detik
  static const Duration _defaultTimeout = Duration(seconds: 10);

  // GET /users dengan timeout yang dapat dikonfigurasi
  Future<List<User>> getUsers({Duration? timeoutDuration}) async {
    // Gunakan parameter timeout jika ada, jika tidak gunakan default 10 detik
    final duration = timeoutDuration ?? _defaultTimeout;

    try {
      print('Request GET: $_baseUrl/users (Timeout: ${duration.inSeconds}s)');
      final response = await http
          .get(Uri.parse('$_baseUrl/users'))
          .timeout(duration); // c) Gunakan .timeout(duration) pada request

      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw HttpException(
          'Gagal memuat data. Status: ${response.statusCode}',
        );
      }
    } on TimeoutException {
      // c) Tampilkan pesan error yang sesuai jika terjadi timeout
      throw Exception('Request timeout setelah ${duration.inSeconds} detik. Periksa koneksi internet Anda.');
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Periksa jaringan Anda.');
    } on FormatException {
      throw Exception('Format data tidak valid.');
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  // GET /users/{id}
  Future<User> getUserById(int id, {Duration? timeoutDuration}) async {
    final duration = timeoutDuration ?? _defaultTimeout;
    try {
      print('Request GET: $_baseUrl/users/$id');
      final response = await http
          .get(Uri.parse('$_baseUrl/users/$id'))
          .timeout(duration);
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        throw HttpException(
          'Gagal memuat data. Status: ${response.statusCode}',
        );
      }
    } on TimeoutException {
      throw Exception('Request timeout setelah ${duration.inSeconds} detik. Periksa koneksi internet Anda.');
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Periksa jaringan Anda.');
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  // GET /posts
  Future<List<Post>> getPosts({Duration? timeoutDuration}) async {
    final duration = timeoutDuration ?? _defaultTimeout;
    try {
      print('Request GET: $_baseUrl/posts');
      final response = await http
          .get(Uri.parse('$_baseUrl/posts'))
          .timeout(duration);
      
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw HttpException(
          'Gagal memuat data posts. Status: ${response.statusCode}',
        );
      }
    } on TimeoutException {
      throw Exception('Request timeout setelah ${duration.inSeconds} detik. Periksa koneksi internet Anda.');
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Periksa jaringan Anda.');
    } on FormatException {
      throw Exception('Format data tidak valid.');
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  // Simulasi login untuk mendapatkan token
  Future<String> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (email.isNotEmpty && password.isNotEmpty) {
        final token = 'dummy_token_${DateTime.now().millisecondsSinceEpoch}';
        print('Login berhasil untuk email: $email');
        return token;
      } else {
        throw Exception('Email dan password tidak boleh kosong');
      }
    } catch (e) {
      throw Exception('Login gagal: $e');
    }
  }
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);
  @override
  String toString() => message;
}