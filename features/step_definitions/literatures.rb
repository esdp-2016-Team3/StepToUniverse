constants = {email: 'admin@example.com', password: 'password', t_email: 'teach1@gmail.com', t_password: 'asdasd', f_email: 'asd@asd.asd', f_password: 'asddsa'}
When(/^я как учитель1 логинюсь, добавляю книгу$/) do
  visit('/users/sign_in')
  sleep 2
  fill_in('Email', with: constants[:t_email])
  fill_in('Пароль', with: constants[:t_password])
  click_button('Войти')
  sleep 3
  page.assert_text('Вход в систему выполнен.')
  page.assert_text('You are a teacher.')
  click_on('Список литературы')
  sleep 1
  page.assert_text('Book2')
  sleep 1
  fill_in('library_file_name', :with => 'Литература от препода №1')
  sleep 2
  fill_in('library_file_description', :with => 'Супер пупер книга блин')
  sleep 5
  attach_file('library_file_literature', Rails.root + 'public/library_files/book1.pdf')
  sleep 5
  p Rails.root + 'public/library_files/book1.pdf'
  sleep 5
  find('input[name="commit"]').click
  sleep 5
  page.assert_text('Литература от препода №1')
  sleep 3
  page.assert_text('Супер пупер книга блин')
end
When(/^я залогинен как админ и удаляю книгу добавленная от препода №1$/) do
  visit('/admin/login')
  within('.inputs') do
    fill_in('Эл. почта*', with: constants[:email])
    fill_in('Пароль*', with: constants[:password])
  end
  click_button('Войти')
  page.assert_text('Вход в систему выполнен')
  click_on('Список литературы')
  page.assert_text('Список литературы')
  page.assert_text('Литература от препода №1')
  within(:xpath, '//tr[@id="library_file_3"]') do
    sleep 10
    click_on('Удалить')
    sleep 10
    page.driver.browser.switch_to.alert.accept
    sleep 10
  end
  sleep 10
  page.assert_text('Список литературы')
  page.assert_no_text('Литература от препода №1')
  click_on('Выйти')
  page.assert_text('Вам необходимо войти в систему или зарегистрироваться.')
end
When(/^я как учитель1 больше не вижу мою удаленную книгу админом$/) do
  visit('/users/sign_in')
  sleep 2
  fill_in('Email', with: constants[:t_email])
  fill_in('Пароль', with: constants[:t_password])
  click_button('Войти')
  sleep 3
  page.assert_text('Вход в систему выполнен.')
  page.assert_text('You are a teacher.')
  click_on('Список литературы')
  sleep 1
  page.assert_text('Book2')
  page.assert_no_text('Литература от препода №1')
end
