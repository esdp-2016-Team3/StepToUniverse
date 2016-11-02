When(/^я на странице "\/posts"$/) do
  visit posts_path
  sleep(0.5)
end

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

When(/^я на странице создания поста$/) do
  visit new_post_path
  sleep(0.5)
end

When(/^я на странице юзера "\/organizations\/new"$/) do
  visit new_organization_path
  sleep(0.5)
end

When(/^я на странице админ "\/admin\/organizations"$/) do
  visit admin_organizations_path
  sleep(0.5)
end

When(/^перехожу на "\/organizations\/list"$/) do
  visit ('/organizations/list')
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

When(/^перехожу "\/posts"$/) do
  visit ('/posts')
  sleep(0.5)
end


When(/^я на рутовой странице$/) do
  visit root_path
  sleep(0.5)
end