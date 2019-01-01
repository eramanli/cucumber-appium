class LoginScreen < BaseScreen
  def wait_for_text(classname, text)
    wait_true {find_element(:class_name, "#{classname}").displayed?}
    current_text = find_element(:class_name, "#{classname}").text
    if current_text != text
      fail("#{text} does not exist")
    end
  end

  def write_email(email)
    email_field = find_element(:id, "email")
    email_field.send_keys(email)
  end

  def write_password(password)
    password_field = find_element(:id, "password")
    password_field.send_keys(password)
  end

  def click_sign_in
    find_element(:id, "email_sign_in_button").click
  end
end

def login_screen
  @login_screen ||= LoginScreen.new
end