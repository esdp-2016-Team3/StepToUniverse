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

When(/^кликаю через xpath на логотип$/) do
  find(:xpath, "//*[@id='navbar-collapse']/ul[1]/a/img").click
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
  page.attach_file("library_file_literature", Rails.root + 'app/assets/images/books/Teplotehnika.pdf')
end

When(/^кликаю через xpath на Удалить$/) do
  find(:xpath, "/html/body/div/div[2]/a[2]").click
end