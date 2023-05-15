class SignInModel {
  final String status;
  final List<SignInData> data;

  SignInModel({
    required this.status,
    required this.data,
  });

}

class SignInData {
  final int userId;
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userPhone;
  final int userRole;
  final int userApprove;
  final int userVerifycode;

  SignInData({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhone,
    required this.userRole,
    required this.userApprove,
    required this.userVerifycode,
  });

}
