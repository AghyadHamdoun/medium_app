
class User {
  int? id;
  String? firstName;
  String? lastName;
  String? description;
  String? profilePicture;
  String? email;
  String? emailVerifiedAt;
  String? contactNumber;
  String? role;
  String? status;
  String? balance;
  String? verificationCode;
  String? mblConfirmationCode;
  String? createdAt;
  String? updatedAt;
  String? averageRating;
  int? orderNumbers;

  User(
      {required this.id,
        required this.firstName,
        required this.lastName,
        required  this.description,
        required this.profilePicture,
        required  this.email,
        required this.emailVerifiedAt,
        required  this.contactNumber,
        required  this.role,
        required  this.status,
        required  this.balance,
        required  this.verificationCode,
        required this.mblConfirmationCode,
        required this.createdAt,
        required this.updatedAt,
        required  this.averageRating,
        required this.orderNumbers});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    description = json['description'];
    profilePicture = json['profile_picture']??'';
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    contactNumber = json['contact_number'];
    role = json['role'];
    status = json['status'];
    balance = json['balance'];
    verificationCode = json['verification_code'];
    mblConfirmationCode = json['mbl_confirmation_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    averageRating = json['average_rating'];
    orderNumbers = json['order_numbers'];
  }

}