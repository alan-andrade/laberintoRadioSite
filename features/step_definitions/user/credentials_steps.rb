Given /^An existent user$/ do
  @user = FactoryGirl.create(User, email: 'test@mail.com', password: 'myssecret')
  @user.should be_valid
end

When /^I go to "(\/\w*)"$/ do |url|
  visit(url)
  current_path.should == url
end

When /^I enter my credentials correctly$/ do
  fill_in 'Email',     with: @user.email
  fill_in 'Password',  with: @user.password
  click_on 'Entrar'
end

When /^I get redirected to "(\/\w*)"$/ do |url|
  current_path.should == url
end
