class User {
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  String? role;
  int? status;
  String? verificationCode;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? averageRating;
  int? orderNumbers;

  User(
      {this.firstName,
        this.lastName,
        this.email,
        this.contactNumber,
        this.role,
        this.status,
        this.verificationCode,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.averageRating,
        this.orderNumbers});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    role = json['role'];
    status = json['status'];
    verificationCode = json['verification_code'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    averageRating = json['average_rating'];
    orderNumbers = json['order_numbers'];
  }

}