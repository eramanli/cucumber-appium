Then(/^Categories page is opened$/) do
  categories_screen.wait_for_element("basket")
end

When(/^I go to "([^"]*)" page$/) do |category|
  categories_screen.select_category(category)
end

Then(/^Kisisel Bakim page is opened$/) do
  categories_screen.wait_for_text("android.widget.TextView", "Kişisel Bakım")
end

Then(/^I add "([^"]*)" to my cart$/) do |product|
  categories_screen.add_product(product)
end

And(/^I go to previous page$/) do
  categories_screen.click_back_button
end

Then(/^Ev Bakımı page is opened$/) do
  categories_screen.wait_for_text("android.widget.TextView", "Ev Bakımı")
end

When(/^I go to my cart$/) do
  categories_screen.go_to_basket
end

Then(/^Shopping cart page is opened$/) do
  categories_screen.wait_for_text("android.widget.TextView", "Shopping Cart")
end


And(/^I delete all of products in my cart$/) do
  categories_screen.delete_all_products
end