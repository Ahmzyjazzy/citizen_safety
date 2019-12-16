class User {
  final int subId;
  final String subName;
  final String subCountry;
  final int userId;
  final String fullName;
  final String userName;
  final String role;
  final int companyId;
  final String email;
  final String phone;
  final String company;
  final String geolocation;
  final int offlineAccess;
  final int roleSecurity;
  final String sessionId;

  User({
    this.subId,
    this.subName,
    this.subCountry,
    this.userId,
    this.fullName,
    this.userName,
    this.role,
    this.companyId,
    this.email,
    this.phone,
    this.company,
    this.geolocation,
    this.offlineAccess,
    this.roleSecurity,
    this.sessionId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      subId: json['SUBSCRIBER_ID'],
      subName: json['SUBSCRIBER'],
      subCountry: json['SUBSCRIBER_COUNTRY'],
      userId: json['USER_ID'],
      fullName: json['USER_FULL_NAME'],
      userName: json['USER_NAME'],
      role: json['USER_ROLE'],
      companyId: json['USER_COMPANY_ID'],
      email: json['USER_EMAIL'],
      phone: json['USER_PHONE_NUMBER'],
      company: json['USER_COMPANY'],
      geolocation: json['USE_GEOLOCATION'],
      offlineAccess: json['OFFLINE_ACCESS'],
      roleSecurity: json['ROLE_SECURITY_LEVEL'],
      sessionId: json['SESS'],
    );
  }

  Map<String, dynamic> toJson() { //covert to Map
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SUBSCRIBER_ID'] = this.subId;
    data['SUBSCRIBER'] = this.subName;
    data['SUBSCRIBER_COUNTRY'] = this.subCountry;
    data['USER_ID'] = this.userId;
    data['USER_FULL_NAME'] = this.fullName;
    data['USER_NAME'] = this.userName;
    data['USER_ROLE'] = this.role;
    data['USER_COMPANY_ID'] = this.companyId;
    data['USER_EMAIL'] = this.email;
    data['USER_PHONE_NUMBER'] = this.phone;
    data['USER_COMPANY'] = this.company;
    data['USE_GEOLOCATION'] = this.geolocation;
    data['OFFLINE_ACCESS'] = this.offlineAccess;
    data['ROLE_SECURITY_LEVEL'] = this.roleSecurity;
    data['SESS'] = this.sessionId;
    return data;
  }
}
