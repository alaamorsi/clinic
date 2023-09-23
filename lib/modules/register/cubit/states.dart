abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}
class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class CreateDoctorSuccessState extends RegisterStates {}
class CreateDoctorErrorState extends RegisterStates {
  final String error;
  CreateDoctorErrorState(this.error);
}
class CreatePatientSuccessState extends RegisterStates {}
class CreatePatientErrorState extends RegisterStates {
  final String error;
  CreatePatientErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}
