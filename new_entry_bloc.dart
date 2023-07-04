
import 'package:rxdart/rxdart.dart';

import '../models/error.dart';
import '../models/medicine_type.dart';

class NewEntryBloc {
  BehaviorSubject<MedicineType>? _selectMedicineType$;
  ValueStream<MedicineType>? get selectedMedicineType =>
      _selectMedicineType$!.stream;

  BehaviorSubject<int>? _selectedIntervals$;
  BehaviorSubject<int>? get selectedIntevals => _selectedIntervals$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay => _selectedTimeOfDay$;

  BehaviorSubject<EntryError>? _errorState$;
  BehaviorSubject<EntryError>? get errorState$ => _errorState$;

  NewEntryBloc() {
    _selectMedicineType$ =
        BehaviorSubject<MedicineType>.seeded(MedicineType.none);
    _selectedTimeOfDay$ = BehaviorSubject<String>.seeded("none");
    _selectedIntervals$ = BehaviorSubject<int>.seeded(0);
    _errorState$ = BehaviorSubject<EntryError>();
  }
  void dispose() {
    _selectMedicineType$!.close();
    _selectedTimeOfDay$!.close();
    _selectedIntervals$!.close();
  }

  void submitError(EntryError error) {
    _errorState$!.add(error);
  }

  void updateInterval(int interval) {
    _selectedIntervals$!.add(interval);
  }

  void updateTime(String time) {
    _selectedTimeOfDay$!.add(time);
  }

  void updateSelectedMedicine(MedicineType type) {
    MedicineType _tempType = _selectMedicineType$!.value;
    if (type == _tempType) {
      _selectMedicineType$!.add(MedicineType.none);
    } else {
      _selectMedicineType$!.add(type);
    }
  }
}
