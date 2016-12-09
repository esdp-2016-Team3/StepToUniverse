# language: ru

Функционал: Проверка тестов
  Как незарегистрированный пользователей
  Я могу пройти пробный тест
#  И увидеть результаты

  Структура сценария: Прохождение теста
#    Допустим я гость
    Если я нахожусь на странице с тестом
    И я отвечаю на <beginner> вопросов уровня "Beginner"
    И я отвечаю на <elementary> вопросов уровня "Elementary"
    И я отвечаю на <intermediate> вопросов уровня "Intermediate"
    И я отвечаю на <upper> вопросов уровня "Upper-Intermediate"
    То я вижу <result>
    Примеры:
      | beginner | elementary | intermediate | upper | result               |
      | 5        | 0          | 0            | 0     | "Beginner"           |
      | 5        | 5          | 0            | 0     | "Elementary"         |
      | 5        | 5          | 5            | 0     | "Intermediate"       |
      | 5        | 5          | 5            | 5     | "Upper-Intermediate" |