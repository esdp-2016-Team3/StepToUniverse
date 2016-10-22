constants = {s_email: 'stud1@gmail.com', s_password: 'asdasd', t_email: 'teach1@gmail.com', t_password: 'asdasd', f_email: 'asd@asd.asd', f_password: 'asddsa'}

When(/^я пытаюсь перейти в личный кабинет$/) do
  visit('/cabinet')
end

When(/^успешно перехожу в личный кабинет$/) do
  page.assert_text('Кабинет преподавателя')
end
