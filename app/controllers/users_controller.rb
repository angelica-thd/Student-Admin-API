class UsersController < ApplicationController
  # POST /signup
  #when signing up a user we dont need a token -> only user valid_credentials
  #so no request authentication for that
  skip_before_action :authorize_request, only: :create

  # return authenticated token upon signup
  def create
    userbyemail = User.where(email: params[:email]).exists?
    userbyusername = User.where(username: params[:username]).exists?

    if userbyemail || userbyusername
      response = {user: Message.user_exist}
      status = 422
    else
      user = User.create!(user_params)  #create! in case of an error  the exception will be handled instead of failing and returning 'false'
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      status = :created

    end
    json_response(response, status)
  end


  def update
    @current_user.update(user_params)
    response = {message: Message.basic_update,new_credentials: @current_user }
    json_response(response)
  end

  def destroy
    @current_user.destroy
    json_response(message: Message.basic_destroy)
  end

  def me
    if @current_user.students!=[]
      response = {user: Message.student,credentials: @current_user, student_info: @current_user.students.first}
    else
      response = {user: Message.basic, credentials: @current_user}
    end
    json_response(response)
  end

  private

  def user_params
    params.permit(
      :name,
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
