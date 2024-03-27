int calculateAge(DateTime birthdate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthdate.year;
  return age;
}
