
class AvailableDates {
  AvailableDates({
      String? availableDates,}){
    _availableDates = availableDates;
}

  AvailableDates.fromJson(dynamic json) {
    _availableDates = json['available_dates'];
  }
  String? _availableDates;
  String? get availableDates => _availableDates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['available_dates'] = _availableDates;
    return map;
  }

}