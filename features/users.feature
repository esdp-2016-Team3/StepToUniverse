# language: ru

  Функционал: Авторизация пользователей разных категорий
    Как зарегистрированный пользователь
    Я имею возможность
    Авторизоваться
    И деавторизоваться на сайте

    Сценарий: Действия ученика
      Допустим я как неавторизованный нахожусь на главной странице
      Если я пытаюсь авторизоватья как Ученик1
      То авторизация ученика проходит успешно

      Допустим я как ученик нахожусь на главной странице
      Если я пытаюсь деавторизоватья как Ученик1
      То деавторизация проходит успешно

    Сценарий: Действия учителя
      Допустим я как неавторизованный нахожусь на главной странице
      Если я пытаюсь авторизоватья как Учитель1
      То авторизация учителя проходит успешно

      Допустим я как учитель нахожусь на главной странице
      Если я пытаюсь деавторизоватья как Учитель1
      То деавторизация проходит успешно

    Сценарий: Действия незарегистрированного
      Допустим я как неавторизованный нахожусь на главной странице
      Если я пытаюсь авторизоватья как Незарегистрированный
      То авторизация не проходит
