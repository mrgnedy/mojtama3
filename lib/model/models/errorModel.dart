class ErrorMessage {
  String msg;
  List<String> data;

  ErrorMessage({this.msg, this.data});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}