class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
    # Defines the required params for a sign up, in our case these are email,
    # user name, password and password confirmation
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation, :current_password)
    # Defines the required params to update a user account.  The required
    # params are the same as above.
  end

end

# The above is needed because we need to tell Rails 4+ what we'll be accepting
# in our submitted forms.  The above controller inherits from the original
# devise controller and adds two private methods to ensure the user name (which
# was a custom data item we added to devise) passes through to the databse.
