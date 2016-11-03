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
  sleep(0.5)
end

When(/^кликаю на письмо через xpath$/) do
  find(:xpath, "//*[@id=':2']/div/div[1]/div[7]").click
  sleep(0.5)
end