import 'package:Blobby/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

DataManager dataManager = DataManager();

class DataManager {
  List<Task> tasks = [
    Task(
        id: 0,
        name: 'Анаграммы',
        userResult: 0,
        hint:
            'Переставь буквы, чтобы получилось слово. Правильный ответ введи в поле.',
        tasks: [
          TextInputTask(question: 'лансипеь (фрукт)', rightAnswer: 'апельсин'),
          TextInputTask(
              question: 'лотьпа (предмет одежды)', rightAnswer: 'пальто'),
          TextInputTask(
              question: 'колечев (живое существо)', rightAnswer: 'человек'),
          TextInputTask(
              question: 'авеопр (часть света)', rightAnswer: 'европа'),
          TextInputTask(
              question: 'ниавд (предмет мебели)', rightAnswer: 'диван'),
          TextInputTask(
              question: 'коршун (относится к обуви)', rightAnswer: 'шнурок'),
          TextInputTask(question: 'атлас (блюдо)', rightAnswer: 'салат'),
          TextInputTask(
              question: 'кайма (предмет одежды)', rightAnswer: 'майка'),
          TextInputTask(
              question: 'колба (предмет сервиза)', rightAnswer: 'бокал'),
          TextInputTask(question: 'банка (животное)', rightAnswer: 'кабан'),
        ]),
    Task(
        id: 1,
        name: 'Синонимы',
        userResult: 0,
        hint:
            'Дан ряд слов. Вычеркни слово, которое не является синонимом к данному. Правильный ответ введи в поле.',
        tasks: [
          TextInputTask(
              question: 'красивый: изящный, дорогой, привлекательный, нарядный',
              rightAnswer: 'дорогой'),
          TextInputTask(
              question: 'злой: гневный, грозный, раздражительный, печальный',
              rightAnswer: 'печальный'),
          TextInputTask(
              question: 'жара: стужа, пекло, зной, тепло',
              rightAnswer: 'стужа'),
          TextInputTask(
              question: 'конь: конюшня, скакун, жеребец, лошадь',
              rightAnswer: 'конюшня'),
          TextInputTask(
              question: 'мечтать: фантазировать, воображать, грезить, видеть',
              rightAnswer: 'видеть'),
          TextInputTask(
              question: 'сильный: размеренный, могучий, мощный, крепкий',
              rightAnswer: 'размеренный'),
          TextInputTask(
              question: 'говорить: болтать, вещать, толковать, запинаться',
              rightAnswer: 'запинаться'),
          TextInputTask(
              question: 'блестеть: сверкать, отражать, сиять, мерцать',
              rightAnswer: 'отражать'),
          TextInputTask(
              question: 'боязливый: трусливый, пугливый, робкий, страшный',
              rightAnswer: 'страшный'),
          TextInputTask(
              question: 'одежда: наряд, украшение, костюм, форма',
              rightAnswer: 'украшение'),
        ]),
    Task(
        id: 2,
        name: 'Лишнее слово',
        userResult: 0,
        hint:
            'Дан ряд слов, в котором все кроме одного (или больше) связаны по смыслу. Вычеркни лишние слова (не соотносящиеся по смыслу или логике с другими). Правильный ответ введи в поле.',
        tasks: [
          TextInputTask(
              question: 'гвоздика, одуванчик, капуста, тюльпан',
              rightAnswer: 'капуста'),
          TextInputTask(
              question: 'лис, синица, бульдог, леопард', rightAnswer: 'синица'),
          TextInputTask(
              question: 'каштан, малина, калина, осина', rightAnswer: 'малина'),
          TextInputTask(
              question: 'яблоко, груша, слива, морковь',
              rightAnswer: 'морковь'),
          TextInputTask(
              question: 'дядя, племянник, мать, сын', rightAnswer: 'мать'),
          TextInputTask(
              question: 'такси, аэропорт, вертолет, автобус',
              rightAnswer: 'аэропорт'),
          TextInputTask(
              question: 'бриджи, футболка, куртка, платье',
              rightAnswer: 'бриджи'),
          TextInputTask(
              question: 'диван, сковорода, духовка, кастрюля',
              rightAnswer: 'диван'),
          TextInputTask(
              question: 'книга, журнал, оригами, учебник',
              rightAnswer: 'оригами'),
          TextInputTask(
              question: 'магнитофон, компьютер, провод, планшет',
              rightAnswer: 'провод '),
          TextInputTask(
              question: 'душ, раковина, лейка, ванная', rightAnswer: 'лейка'),
        ]),
  ];

  initializeUserResults() async {
    final prefs = await SharedPreferences.getInstance();
    for (var i = 0; i < tasks.length; i++) {
      tasks[i].userResult = prefs.getInt(tasks[i].id.toString()) ?? 0;
    }
  }

  saveUserResult(int id, int value) async {
    final prefs = await SharedPreferences.getInstance();
    tasks.asMap().forEach((index, element) {
      if (element.id == id) {
        tasks[index].userResult = value;
      }
    });
    prefs.setInt(id.toString(), value);
  }
}
