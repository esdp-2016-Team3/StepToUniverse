constants = {email: 'admin@example.com', password: 'password', f_email: 'asd@asd.asd', f_password: 'asddsa'}
When(/^я нахожусь на странице авторизации админки$/) do
  visit('/admin/login')
  page.assert_text('Войти')
end
When(/^я пытаюсь авторизоватья как Незарегистрированный админ$/) do
  within('.inputs') do
    fill_in('Эл. почта*', with: constants[:f_email])
    fill_in('Пароль*', with: constants[:f_password])
  end
  click_button('Войти')
end
When(/^авторизация админа не проходит$/) do
  page.assert_text('Неверный адрес эл. почты или пароль.')
end

When(/^я пытаюсь авторизоватья как Админ$/) do
  within('.inputs') do
    fill_in('Эл. почта*', with: constants[:email])
    fill_in('Пароль*', with: constants[:password])
  end
  click_button('Войти')
end
When(/^авторизация проходит успешно$/) do
  page.assert_text('Вход в систему выполнен.')
end

When(/^я залогинен и нахожусь в корне админки$/) do
  visit('/admin/login')
  within('.inputs') do
    fill_in('Эл. почта*', with: constants[:email])
    fill_in('Пароль*', with: constants[:password])
  end
  click_button('Войти')
  page.assert_text('Вход в систему выполнен')
end
When(/^я захожу в раздел "Панель управления"$/) do
  click_on('Панель управления')
end
When(/^вижу панель управления$/) do
  page.assert_text('Панель управления')
  page.assert_text('Добро пожаловать в панель Администратора')
end

When(/^я захожу в раздел "Администратор"$/) do
  click_on('Администратор')
end
When(/^вижу раздел администратора$/) do
  page.assert_text('Администратор')
  page.assert_text('Создать Администратор')
end

When(/^я захожу в раздел "Вопросы"$/) do
  click_on('Вопросы')
end
When(/^я вижу список вопросов$/) do
  page.assert_text('Вопросы')
  page.assert_text('Создать Вопрос')
end

When(/^я захожу в раздел "Запросы на регистрацию"$/) do
  click_on('Запросы на регистрацию')
end
When(/^вижу список запросов на регистрацию$/) do
  page.assert_text('pend1')
end

When(/^я захожу в раздел "Комментарии"$/) do
  click_on('Комментарии')
end
When(/^вижу список комментариев$/) do
  page.assert_text('Комментарии')
end

When(/^я захожу в раздел "Отказанные"$/) do
  click_on('Отказанные')
end
When(/^вижу список отказанных$/) do
  page.assert_text('Отказанные')
  page.assert_text('Создать Отказанного')
end

When(/^я захожу в раздел "Преподаватели"$/) do
  click_on('Преподаватели')
end
When(/^вижу список преподавателей$/) do
  page.assert_text('teach1')
end

When(/^я захожу в раздел "Роли"$/) do
  click_on('Роли')
end
When(/^вижу список ролей$/) do
  page.assert_text('Роли')
  page.assert_text('Создать Роль')
end

When(/^я захожу в раздел "Содержание"$/) do
  click_on('Содержание')
end
When(/^вижу содержание$/) do
  page.assert_text('Содержание')
  page.assert_text('Создать Содержание')
end

When(/^я захожу в раздел "Список литературы"$/) do
  click_on('Список литературы')
end
When(/^вижу список литературы$/) do
  page.assert_text('Список литературы')
end

When(/^я захожу в раздел "Студенты"$/) do
  click_on('Студенты')
end
When(/^вижу список студентов$/) do
  page.assert_text('stud1')
end