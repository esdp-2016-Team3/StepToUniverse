When(/^я на рутовой странице$/) do
  visit root_path
  sleep(0.5)
end

When(/^перехожу на страницу почты mailcatcher$/) do
  visit('http://127.0.0.1:1080')
  sleep(0.5)
end

When(/^кликаю на письмо через xpath$/) do
  find(:xpath, "//*[@id='messages']/table/tbody/tr[1]/td[2]").click
  sleep(0.5)
end

When(/^кликаю через xpath "([^"]*)"$/) do |arg|
  find(:xpath, "//*[@id='user_7']/td[7]/a").click
  sleep(0.5)
end

When(/^перехожу на страницу письма для подтверждения$/) do
  visit 'http://127.0.0.1:1080/messages/1.html'
  sleep(0.5)
end

When(/^перехожу на страницу письма уведомления для админа$/) do
  visit 'http://127.0.0.1:1080/messages/2.html'
  sleep(0.5)
end

When(/^перехожу в админку$/) do
  visit "http://localhost:3000/admin"
  sleep(0.5)
end

When(/^перехожу на страницу письма уведомления для юзера$/) do
  visit 'http://127.0.0.1:1080/messages/3.html'
  sleep(0.5)
end

When(/^кликаю по html "([^"]*)"$/) do |arg|
  find('input[name="commit"]').click
  sleep(0.5)
end

When(/^прикрепляю книгу$/) do
  page.attach_file("library_file_literature", Rails.root + 'app/assets/library_files/Teplotehnika.pdf')
  sleep(0.5)
end

When(/^прикрепляю книгу к домашнему заданию$/) do
  page.attach_file("homework_result[file]", Rails.root + 'app/assets/library_files/Teplotehnika.pdf')
  sleep(0.5)
end

When(/^кликаю через tr на Удалить$/) do
  find('tr', text: 'Книга Максима' ).click_link("Удалить")
  sleep(0.5)
end

When(/^кликаю по xpath на Скачать$/) do
  find('tr', text: 'Book1' ).click_link("Скачать")
  sleep(0.5)
end

When(/^кликаю на Удалить через tr$/) do
  find('tr', text: 'Book2' ).click_link("Удалить")
  sleep(0.5)
end

When(/^кликаю через xpath на книгу Изменить$/) do
  find(:xpath, "//*[@id='library_file_1']/td[4]/div/a[2]").click
  sleep(0.5)
end

When(/^я на странице логина админа$/) do
  visit 'http://localhost:3000/admin/login'
  sleep(0.5)
end

When(/^кликаю через xpath на Удалить ДЗ$/) do
  find('tr', text: 'Homework1' ).click_link("Удалить")
  sleep(0.5)
end

When(/^кликаю на кнопку через xpath "([^"]*)"$/) do |arg|
  find(:xpath, "//*[@id='new_user']/div[4]/input").click
  sleep(0.5)
end

When(/^кликаю на "([^"]*)" через хpath$/) do |arg|
  find(:xpath, "/html/body/div/table[1]/tbody/tr[2]/td[2]/a").click
  sleep(0.5)
end

When(/^по студенту "([^"]*)" нажимаю на "([^"]*)"$/) do |arg1, arg2|
  find('tr', text: arg1 ).click_link(arg2)
  sleep(0.5)
end

When(/^прикрепляю книгу к новому домашнему заданию$/) do
  page.attach_file("homework[homework_files_attributes][0][file]", Rails.root + 'app/assets/library_files/Teplotehnika.pdf')
  # homework[homework_files_attributes][0][file]
  sleep(0.5)
end