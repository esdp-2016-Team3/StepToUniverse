When(/^я нахожусь на странице с тестом$/) do
  visit('/sample_test')
  page.assert_text('1.')
end

When(/^я отмечаю ответы и отправляю форму$/) do
  cnt = 1
  20.times do
    within('#answer_'+cnt.to_s) do
      choose(count: 1)
    end
    cnt += 4
  end
  click_on('Завершить')
end

When(/^я вижу результаты$/) do
  page.assert_text('Ваш приблизительный уровень')
end