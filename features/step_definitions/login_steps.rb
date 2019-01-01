When(/^Log in page is opened$/) do
  login_screen.wait_for_text("android.widget.TextView","Login")
end

Given(/^I write my email as "([^"]*)"$/) do |email|
  login_screen.write_email(email)
end

And(/^I write my password as "([^"]*)"$/) do |password|
  login_screen.write_password(password)
end

And(/^I click sign in button$/) do
  login_screen.click_sign_in
end
