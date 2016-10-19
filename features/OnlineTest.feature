# language: ru

Функционал: Проверка тестов
  Как незарегистрированный пользователей
  Я могу пройти пробный тест
  И увидеть результаты

  Структура сценария: Прохождение теста
    Допустим я нахожусь на странице с тестом
    Если я отвечаю на <beginner> вопросов уровня "Beginner"
    И я отвечаю <elementary> вопросов уровня "Elementary"
    И я отвечаю <intermediate> вопросов уровня "Intermediate"
    И я отвечаю <upper> вопросов уровня "Upper"
    То я вижу <result>
    Примеры:
      | beginner | elementary | intermediate | upper | result               |
      | 5        | 0          | 0            | 0     | "Beginner"           |
      | 5        | 5          | 0            | 0     | "Elementary"         |
      | 5        | 5          | 4            | 0     | "Intermediate"       |
      | 5        | 5          | 5            | 4     | "Upper-Intermediate" |