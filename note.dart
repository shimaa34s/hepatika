import 'constants2.dart';

class Note {
  int? id;
  String? text;
  String? date;
  String? updateDate;

  Note({this.id, required this.text, this.date, this.updateDate});
  Map<String, dynamic> toMap() {
    return {
      COL_ID: id,
      COL_TEXT: text,
      COL_DATE: date,
      COL_UPDATE_DATE: updateDate
    };
  }

  Note.fromMap(Map<String, dynamic> map) {
    id = map[COL_ID];
    text = map[COL_TEXT];
    date = map[COL_DATE];
    updateDate = map[COL_UPDATE_DATE];
  }
}
