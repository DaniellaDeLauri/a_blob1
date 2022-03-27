class Task {
  int id;
  String name;
  List<TextInputTask> tasks;
  String hint;
  int userResult;

  Task(
      {required this.id,
      required this.name,
      required this.tasks,
      required this.hint,
      this.userResult = 0});
}

class TextInputTask {
  String question;
  String rightAnswer;

  TextInputTask({
    required this.question,
    required this.rightAnswer,
  });
}
