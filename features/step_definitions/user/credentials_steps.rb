When /^I go to (\/\w*)$/ do |url|
  visit(url)
  current_path.should == url
end

When /^I fill the (.*) with (.*)$/ do |field, value|
  fill_in field, with: value
end

When /^I click (\w*)$/ do |link_name|
  click_on link_name
end
