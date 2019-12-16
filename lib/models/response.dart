class ResponseData {
  final int offline;
  final String session;
  final String status;
  final int statusCode;
  final dynamic data;
  final dynamic subscription;
  final dynamic subscriptionStatus;

  ResponseData(
      {this.offline,
      this.session,
      this.status,
      this.statusCode,
      this.data,
      this.subscription,
      this.subscriptionStatus});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      offline: json['OFFLINE_ACCESS'],
      session: json['SESS'],
      status: json['STATUS'],
      statusCode: json['STATUS_CODE'],
      data: json['USER_DATA'],
      subscription: json['USER_SUBSCRIPTION'],
      subscriptionStatus: json['USER_SUBSCRIPTION_STATUS'],
    );
  }

  Map<String, dynamic> toJson() { //covert to Map
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OFFLINE_ACCESS'] = this.offline;
    data['SESS'] = this.session;
    data['STATUS'] = this.status;
    data['STATUS_CODE'] = this.statusCode;
    data['USER_DATA'] = this.data;
    data['USER_SUBSCRIPTION'] = this.subscription;
    data['USER_SUBSCRIPTION_STATUS'] = this.subscriptionStatus;
    return data;
  }

}
