// import 'package:bloc/bloc.dart';
// import 'package:dawaey/api_service.dart';
// import 'package:dawaey/models/medicin_model/medicin_model.dart';
// import 'package:dawaey/services/all_medicin.dart';
// import 'package:equatable/equatable.dart';

// part 'home_cubit_state.dart';

// class HomeCubit extends Cubit<HomeCubitState> {
//   final ApiService apiService;
// final AllMedicine allMedicine;
//   HomeCubit(this.allMedicine, this.apiService) : super(HomeCubitInitial(medicines: const []));

//   Future<void> fetchAllMedicine() async {
//     emit(MedicineLoading());
//     try {
//       List<dynamic> medicines = await allMedicine.getAllMedicines();
//       emit(MedicineLoaded(medicines: medicines));
//     } catch (e) {
//       emit(MedicineError(error: e.toString()));
//     }
//   }
// }
