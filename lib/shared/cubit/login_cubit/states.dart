abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class ChangeVisibilityPasswordState extends LoginStates {}

class UserRigesterLoadingState extends LoginStates{}

class UserRigesterSuccessState extends LoginStates{}

class UserRigesterErrorState extends LoginStates{
  final String error;

  UserRigesterErrorState(this.error);
}

class UserLoginLoadingState extends LoginStates{}

class UserLoginSuccessState extends LoginStates{}

class UserLoginErrorState extends LoginStates{
  final String error;

  UserLoginErrorState(this.error);
}
