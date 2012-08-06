Before do
  activate_authlogic
end

Given /^Im logged in$/ do
  @user = FactoryGirl.create(:user)
end

Given /^I go to '(\/\w*)'$/ do |url|
  UserSession.create(@user)
  visit url
  current_path.should == url
end

Then /^I see my profile data$/ do
  pending
end
