When(/^я нахожусь на странице с тестом$/) do
  visit('/sample_test')
  page.assert_text('Пробное тестирование')
end

When(/^я отмечаю ответы и отправляю форму$/) do
  pending
end

When(/^я вижу результаты$/) do
  pending
end