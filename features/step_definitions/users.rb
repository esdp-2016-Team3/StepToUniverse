constants = {s_email: 'stud1@gmail.com', s_password: 'asdasd', t_email: 'teach1@gmail.com', t_password: 'asdasd', f_email: 'asd@asd.asd', f_password: 'asddsa'}
When(/^я как неавторизованный нахожусь на главной странице$/) do
  visit('/')
  page.assert_text('контентная информация')
end

When(/^я пытаюсь авторизоватья как Ученик1$/) do
  visit('/users/sign_in')
  within('#new_user') do
    fill_in('Email', with: constants[:s_email])
    fill_in('Пароль', with: constants[:s_password])
  end
  click_button('Войти')
end

When(/^авторизация ученика проходит успешно$/) do
  page.assert_text('Вход в систему выполнен.')
  page.assert_text('You are a student.')
end

When(/^я пытаюсь авторизоватья как Учитель1$/) do
  visit('/users/sign_in')
  within('#new_user') do
    fill_in('Email', with: constants[:t_email])
    fill_in('Пароль', with: constants[:t_password])
  end
  click_button('Войти')
end

When(/^авторизация учителя проходит успешно$/) do
  page.assert_text('Вход в систему выполнен.')
  page.assert_text('You are a teacher.')
end

When(/^я как ученик нахожусь на главной странице$/) do
  visit('/')
  page.assert_text('You are a student.')
end

When(/^я как учитель нахожусь на главной странице$/) do
  visit('/')
  page.assert_text('You are a teacher.')
end

When(/^я пытаюсь деавторизоватья как Ученик1$/) do
  click_on('Аккаунт')
  click_on('Выйти')
end

When(/^я пытаюсь деавторизоватья как Учитель1$/) do
  click_on('Аккаунт')
  click_on('Выйти')
end

When(/^деавторизация проходит успешно$/) do
  page.assert_text('контентная информация')
end

When(/^я пытаюсь авторизоватья как Незарегистрированный$/) do
  visit('/users/sign_in')
  within('#new_user') do
    fill_in('Email', with: constants[:f_email])
    fill_in('Пароль', with: constants[:f_password])
  end
  click_button('Войти')
end

When(/^авторизация не проходит$/) do
  page.assert_text('Неверный адрес эл. почты или пароль.')
end