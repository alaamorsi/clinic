abstract class PatientStates {}

class PatientInitialStates extends PatientStates {}

class GetPatientDataLoadingState extends PatientStates {}
class GetPatientDataSuccessState extends PatientStates {}
class GetPatientDataErrorState extends PatientStates {
  final String error;

  GetPatientDataErrorState(this.error);

}
class ChangeBottomNavState extends PatientStates {}
class ChangeTypeReservationState extends PatientStates {}
