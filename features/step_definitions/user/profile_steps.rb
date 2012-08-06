Before do
  activate_authlogic
end

Given /^Im logged in$/ do
  @user = FactoryGirl.create(:user)
  UserSession.create(@user)
end

Given /^I go to '(\/mi_cuenta)'$/ do |url|
  visit url
  current_path.should == url
end

Then /^I see my profile data$/ do
  pending
end
