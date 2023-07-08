class LoginModel {
  LoginModel({
    required this.token,
  });
  late final String? token;
  String? error;

  LoginModel.fromJson(Map<String, dynamic> json){
    token = json['token'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['error'] = error;
    return _data;
  }
}