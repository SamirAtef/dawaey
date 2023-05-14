// import 'package:bloc/bloc.dart';
// import 'package:dawaey/api_service.dart';
// import 'package:dawaey/models/medicin_model/medicin_model.dart';
// import 'package:dawaey/services/all_medicin.dart';
// import 'package:equatable/equatable.dart';

// class MedicineState extends Equatable {
//   final List<MedicinModel> medicines;

//   const MedicineState({this.medicines = const []});

//   @override
//   List<Object> get props => [medicines];

//   static initial() {}
// }

// class MedicineCubit extends Cubit<MedicineState> {
//   final ApiService apiService;

//   MedicineCubit(this.apiService) : super(const MedicineState());

//   Future<void> getAllMedicines() async {
//     try {
//       final medicines = await AllMedicine(apiService).getAllMedicines();
//       emit(MedicineState(medicines: medicines));
//     } catch (e) {
//       print('Error fetching medicines: $e');
//     }
//   }
// }
