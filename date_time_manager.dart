class DateTimeManger{
  static String currentDate(){
    DateTime _dateTime=DateTime.now();
    return '${_dateTime.day}/${_dateTime.month}${_dateTime.year}${_dateTime.hour}:${_dateTime.minute}';
  }
}