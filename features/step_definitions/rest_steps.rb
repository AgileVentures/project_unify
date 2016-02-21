When(/^the Accept Type is (.*)/) do |accept_type|
  @accept_type = accept_type
end

When /^the client requests GET (.*)$/ do |path|
  @last_response = get path, headers: {'Accept' => @accept_type}
end

When /^I send a GET request for ([^\"]*)$/ do |path|
  get path
end

Then(/^a "([^"]*)" status code is returned$/) do |status|
  expect(@last_response.status).to eq status.to_i
end

Then /^the response should be: "(.*)"/ do |text|
  expect(@last_response.body).to eq text
end

Then /^the response should be JSON:$/ do |json|
  expect(JSON.parse(@last_response.body)).to eq JSON.parse(json)
end

Then /^the index JSON response should show info about:$/ do |table|
  objects = []
  table.hashes.each do |row|
    object = row.keys.first.titleize.constantize
    case
      when object == User
        user = User.find_by(user_name: row[:user])
        objects << {id: user.id,
                    user_name: user.user_name,
                    created_at: user.created_at,
                    profile: api_v1_user_url(user)}
    end
  end
  response_key = table.hashes.first.keys.first.pluralize.to_sym
  response = {response_key => objects}
  expect(@last_response.body).to eq (response.to_json)

end

