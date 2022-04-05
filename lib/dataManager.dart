import 'package:a_blob/resources/models.dart';
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
          TextInputTask(
              question: 'Анаграммы',
              rightAnswer: 'Слова, в которых перепутаны буквы.'),
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
            'Дан ряд слов. Найди слово, которое не является синонимом к данному. Правильный ответ введи в поле.',
        tasks: [
          TextInputTask(
              question: 'Синонимы',
              rightAnswer: 'Слова, схожие по смыслу, но различные по написанию.'),
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
            'Дан ряд слов, в котором все слова кроме одного связаны по смыслу. Найди лишнее слово. Правильный ответ введи в поле.',
        tasks: [
          TextInputTask(
              question: 'Лишнее слова',
              rightAnswer: 'Слова, смысл которых никак не связан с исходным списком слов.'),
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
        ]),
    Task(
        id: 3,
        name: 'Слово по формуле',
        userResult: 0,
        hint:
        'Дан словесный пример. Вычитай и прибавляй слоги, чтобы получить слово. Правильный ответ введи в поле.',
        tasks: [
          TextInputTask(
              question: 'Формула',
              rightAnswer: 'Набор математических операций.'),
          TextInputTask(question: 'норка - ка + мама - ма + тив + ный', rightAnswer: 'нормативный'),
          TextInputTask(
              question: 'с + равнина - на + вата - а + ь', rightAnswer: 'сравнивать'),
          TextInputTask(
              question: 'вы + тачка - чка + ски + ванна - нна + ть', rightAnswer: 'вытаскивать'),
          TextInputTask(
              question: 'спор - р + сова - ва + б + ство + валик - лик', rightAnswer: 'способствовать'),
          TextInputTask(
              question: 'п + код - к + арка - ка + ить', rightAnswer: 'подарить'),
          TextInputTask(
              question: 'стоп - оп + рой - й + итель + сок - ок + тво', rightAnswer: 'строительство'),
          TextInputTask(question: 'веник - еник + ир + усы - ы + ный', rightAnswer: 'вирусный'),
          TextInputTask(
              question: 'ухо - хо + валенки - ленки + жар - р + емый', rightAnswer: 'уважаемый'),
          TextInputTask(
              question: 'бляха - яха + аго + дом - ом + а + рис - с + ть', rightAnswer: 'благодарить'),
          TextInputTask(question: 'идол - ол + еда - да + аль + низ - из + ый', rightAnswer: 'идеальный'),
        ]),
    Task(
        id: 4,
        name: 'Антонимы',
        userResult: 0,
        hint:
        'Найди антоним к данному слову. Правильный ответ введи в поле.',
        tasks: [
          TextInputTask(
              question: 'Антонимы',
              rightAnswer: 'Слова, противоположные по смыслу.'),
          TextInputTask(question: 'сердечный', rightAnswer: 'злой'),
          TextInputTask(
              question: 'законный', rightAnswer: 'преступный'),
          TextInputTask(
              question: 'искренний', rightAnswer: 'фальшивый'),
          TextInputTask(
              question: 'натуральный', rightAnswer: 'искуственный'),
          TextInputTask(
              question: 'суровый', rightAnswer: 'мягкий'),
          TextInputTask(
              question: 'бывший', rightAnswer: 'будущий'),
          TextInputTask(question: 'банальный', rightAnswer: 'оригинальный'),
          TextInputTask(
              question: 'вечерний', rightAnswer: 'утренний'),
          TextInputTask(
              question: 'усталый', rightAnswer: 'бодрый'),
          TextInputTask(question: 'веселый', rightAnswer: 'грустный'),
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
