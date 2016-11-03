When(/^я на странице "\/admin\/login"$/) do
  visit new_admin_user_session_path
  sleep(0.5)
end

When(/^я на странице "\/users\/sign_in"$/) do
  visit new_user_session_path
  sleep(0.5)
end

When(/^должен перейти на главную страницу$/) do
  visit root_path
  sleep(0.5)
end

When(/^я на странице "\/users\/sign_up"$/) do
  visit new_user_registration_path
  sleep(0.5)
end

When /^кликаю через xpath1 "([^"]*)" для "([^"]*)"$/ do |link, person|
  # Use capybara to find row based on 'person' text... no need for the additional 'find'
  # the '.,' sets the scope to the current node, that is the tr in question
  within(:xpath, "//tbody/tr[@id='#{person}']") do
    click_link(link)
  end
  sleep(0.5)
end

When(/^я на рутовой странице$/) do
  visit root_path
  sleep(0.5)
end

When(/^перехожу на страницу почты$/) do
  visit('https://accounts.google.com')
  sleep(3)
end

When(/^перехожу на страницу visit\('https:\/\/mail\.google\.com\/mail\/'\)$/) do
  visit('https://mail.google.com/mail/')
  sleep(15)
end

When(/^кликаю на письмо$/) do
  find(:xpath, "//div[@class='Cp']/div/table/tbody/tr[1]/td[2]").click
  sleep(20)
end