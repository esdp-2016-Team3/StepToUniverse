include SearchForAnswers
require 'pry'

When(/^я нахожусь на странице с тестом$/) do
  visit('/sample_test')
  xpath = "//li[contains(@class, 'list-group-item')]/span"
  questions = page.all(:xpath, xpath)
  @array_question_id =[]
  questions.each do |question|
    @array_question_id << question[:id].to_i
  end
end


Если(/^я отвечаю на (\d+) вопросов уровня "([^"]*)"$/) do |arg1, arg2|
  asd = levels(@array_question_id, arg1, arg2)
  asd.each do |elem|
  find(:xpath, "//div/span/input[@value='#{elem}']").click
  end
   click_on('Завершить')
end

When(/^я вижу "([^"]*)"$/) do |result|
  # table is a table.hashes.keys # => [:beginner, :elementary, :intermediate, :upper, :result]
  page.assert_text("#{result}")
end

