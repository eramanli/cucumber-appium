class CategoriesScreen < BaseScreen
  def wait_for_text(classname, text)
    wait_true {find_element(:class_name, "#{classname}").displayed?}
    current_text = find_element(:class_name, "#{classname}").text
    if current_text != text
      fail("#{text} does not exist")
    end
  end

  def wait_for_element(id)
    wait_true {find_element(:id, "#{id}").displayed?}
  end

  def select_category(selected_category)
    # categories which have id=category_name are not clickable and RelativeLayout is clickable.
    # So, I get RelativeLayout elements for clicking.
    wait_for_element("category_name")
    categories_layout = find_elements(:xpath, "//android.widget.RelativeLayout")
    #Deleted first element because of it is not visible element on the screen.
    categories_layout.drop(1).each do |layout|
      category = layout.find_element(:id, "category_name")
      category_name = category.text
      if category_name == selected_category
        layout.click
        break
      end
    end
  end

  def add_product(add_product)
    wait_for_element("product_name")
    product_layout = find_elements(:xpath, "//android.widget.LinearLayout")
    product_layout.each do |layout|
      product = layout.find_element(:id, "product_name")
      product_name = product.text
      if product_name == add_product
        layout.click
        break
      end
    end
  end

  def click_back_button
    back_button = find_element(:accessibility_id, "Navigate up")
    back_button.click
  end

  def go_to_basket
    basket = find_element(:id, "basket")
    basket.click
  end


  def delete_all_products
    delete_button = find_elements(:id, "imageview_remove")
    i = delete_button.size
    while i > 0
      find_element(:id, "imageview_remove").click
      i -= 1
    end
    find_element(:id, "empty_textview").displayed?
  end


  def check_products(table)
    expected_product = table.hashes
    expected_product.each do |product|
      #Get product elements in the cart
      products = find_elements(:id, "product_name")
      #Get product names from the cart
      product_list = []
      products.each {|name| product_text = name.text
      product_list << product_text
      }
      fail("Selected products are not in the cart") unless product_list.include? product[:product_1]
      fail("Selected products are not in the cart") unless  product_list.include? product[:product_2]
    end
  end

end

def categories_screen
  @categories_screen ||= CategoriesScreen.new
end