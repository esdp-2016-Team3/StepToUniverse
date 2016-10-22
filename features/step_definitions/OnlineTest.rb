include SearchForAnswers

Допустим(/^я гость$/) do
 visit('localhost:3000') 
 page.assert_text('контентная информация')
end

When(/^я нахожусь на странице с тестом$/) do
  visit('/sample_test')
  xpath = "//li[contains(@class, 'list-group-item')]/span"
  questions = page.all(:xpath, xpath)
  @array_question_id =[]
  questions.each do |question|
    @array_question_id << question[:id].to_i
  end
end

When(/^я отвечаю на (\d+) вопросов уровня "([^"]*)"$/) do |arg1, arg2|
  level = levels(@array_question_id, arg1, arg2)
  level.each do |elem|
    find(:xpath, "//div/span/input[@value='#{elem}']").click
  end
end

То(/^я вижу "([^"]*)"$/) do |arg1|
  click_on('Завершить')
  sleep 4
  page.assert_text(arg1)
end

