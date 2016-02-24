Given(/^the following users exist$/) do |table|
  table.hashes.each do |hash|
    user = FactoryGirl.create(:user, user_name: hash[:user_name])
    add_skills(user, hash[:skills]) if hash[:skills]
  end
end

def add_skills(user, skills)
  binding.pry
  user.skill_list.add(skills, parse: true)
  user.save
end

Given(/^the admin account is set up$/) do
  AdminUser.create!(email: 'admin@admin.com', password: 'password')
end

Given(/^I am logged in as admin$/) do
  visit root_path
  fill_in 'Email', with: 'admin@admin.com'
  fill_in 'Password', with: 'password'
  click_link_or_button 'Sign in'
end

Given(/^I visit the "([^"]*)" page$/) do |url|
  case url
    when 'api-doc'
      visit '/api-doc'
  end

end

Given(/^I click on "([^"]*)"$/) do |link|
  click_link_or_button link
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end


And(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

And(/^I should see ([^"]*) instances of ([^"]*)$/) do |count, model|
  expect(Object.const_get(model).count).to eq count.to_i
end

And(/^I click on "([^"]*)" for "([^"]*)"$/) do |link, name|
  @resource = User.find_by(user_name: name)
  section = find("tr[data-resource-id=\"#{@resource.id}\"]")
  within section do
    click_link_or_button link
  end
end

And(/^the updated users username is "([^"]*)"$/) do |name|
  @resource.reload
  expect(@resource.user_name).to eq name
end

Then(/^the updated users skills should be "([^"]*)"$/) do |skills|
  @resource ? @resource.reload : @resource = User.last
  skills.split do |skill|
    expect(@resource.skill_list).to include skill
  end
end

Given(/^"([^"]*)" skills are "([^"]*)"$/) do |name, skills|
  user = User.find_by(user_name: name)
  user.skill_list.add(skills, parse: true)
end