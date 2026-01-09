import 'package:quick_token_new/repository/auth_repo.dart';
import 'package:quick_token_new/services/local_storage_service.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthServices {
  final AuthRepo _authRepo;
  final LocalStorageServices _localStorage;

  AuthServices({required AuthRepo authRepo, required LocalStorageServices localStorage})
    : _authRepo = authRepo,
      _localStorage = localStorage;

  String? _authToken;
  String? _role;

  String? get authToken => _authToken;
  String? get role => _role;

  bool get isLoggedIn {
    if (_authToken == null) return false;
    try {
      return !Jwt.isExpired(_authToken!);
    } catch (_) {
      return false;
    }
  }

  /// ✅ Call on app start
  Future<void> initialize() async {
    _authToken = await _localStorage.read(key: LocalStorageKeys.authToken);
    _role = await _localStorage.read(key: LocalStorageKeys.userRole);
  }

  /// ✅ Save token + role after OTP verification
  Future<void> saveSession({required String token, required String role}) async {
    await _localStorage.write(key: LocalStorageKeys.authToken, value: token);

    await _localStorage.write(key: LocalStorageKeys.userRole, value: role);

    _authToken = token;
    _role = role;
  }

  /// ✅ Logout
  Future<void> logout() async {
    await _localStorage.deleteAll();
    _authToken = null;
    _role = null;
  }
}
