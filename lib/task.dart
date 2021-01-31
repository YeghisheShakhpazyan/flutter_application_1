class Task {
  String id = DateTime.now().toString();
  DateTime date;
  bool isImportant = false;
  bool isInMyDay = false;
  bool isScheduled = false;
  bool isSettedToMe = false;
  final String title;
  String description;

  Task({this.title});
}
