When(/^кликаю на алерт "([^"]*)"$/) do |arg|
  page.driver.browser.switch_to.alert.accept
  sleep(0.5)
end

When(/^кликаю на ссылку "([^"]*)"$/) do |link|
  click_link link
  sleep(0.5)
end

When(/^кликаю на кнопку "([^"]*)"$/) do |button|
  click_button button
  sleep(0.5)
end

When(/^ввожу в поле "([^"]*)" текст "([^"]*)"$/) do |field, value|
  fill_in field, with:value
  sleep(0.5)
end

When(/^должен увидеть текст "([^"]*)"$/) do |text|
  page.assert_text(text)
  sleep(0.5)
end

When(/^выбираю из списка "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  page.select(value, :from => field)
  sleep(0.5)
end

When(/^выбираю в радио батон "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  choose(value)
  sleep(0.5)
end

When(/^должен не найти "([^"]*)"$/) do |text|
  page.assert_no_text(text)
  sleep(0.5)
end


When(/^кликаю на "([^"]*)"$/) do |arg|
  click_on(arg)
  sleep(0.5)
end

When(/^кликаю по html "([^"]*)"$/) do |arg|
  find('input[name="commit"]').click
  sleep(0.5)
end

When(/^кликаю на письмо "([^"]*)"$/) do |arg|
  find("//*[@id=':2']/div/div/div[7]").click
  sleep(2)
end