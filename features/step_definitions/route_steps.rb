When(/^должен перейти на главную страницу$/) do
  visit root_path
  sleep(0.5)
end

When(/^я на рутовой странице$/) do
  visit root_path
  sleep(0.5)
end

When(/^перехожу на страницу почты Gmail$/) do
  visit('https://accounts.google.com')
  sleep(0.5)
end

When(/^перехожу на страницу писем Николая Петровича$/) do
  visit('https://mail.google.com/mail/')
  sleep(10)
end

When(/^кликаю на письмо через xpath$/) do
  find(:xpath, "//*[@id=':2']/div/div/div[7]").click
  sleep(2)
end

When(/^отмечаю через xpath все письма$/) do
  find(:xpath, "//*[@id=':3g']/div[1]/span/div").click
  sleep(2)
end

When(/^удаляю через xpath все письма$/) do
  find(:xpath, "//*[@id=':5']/div[2]/div[1]/div[1]/div/div/div[2]/div[3]/div/div").click
  sleep(2)
end