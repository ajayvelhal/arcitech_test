class AuthResponse {
  int? status;
  String? message;
  String? refresh;
  String? access;

  AuthResponse({this.status, this.message, this.refresh, this.access});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    status = json['status'];
    message = json['message'];
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}