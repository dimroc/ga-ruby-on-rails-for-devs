module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:auth_token] = [user.id, user.cookie]
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
  end
  
  def signed_in?
    ! current_user.nil?
  end

  def current_user
    @current_user ||= user_from_cookie
  end

  private

    def user_from_cookie
      User.authenticate_with_cookie(* remember_token)
    end

    def remember_token
      cookies.signed[:auth_token] || [nil, nil]
    end

end
