class Task {
  String name;
  int maxResult;
  int userResult;

  Task({
    required this.name,
    required this.maxResult,
    required this.userResult,
  });
}

class TextInputTask {
  String question;
  String rightAnswer;

  TextInputTask({
    required this.question,
    required this.rightAnswer,
  });

}
