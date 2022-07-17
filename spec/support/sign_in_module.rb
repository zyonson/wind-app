module SignInModule
  def sign_in_as(user)
    visit new_user_session_path
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "Log in"
  end
end
