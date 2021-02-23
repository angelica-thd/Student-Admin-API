class StudentsController < ApplicationController
  def create
    if @current_user.students !=[] #if user already has a student -> if student is already a user in our app
      response = { message: Message.unauthorized }
    else
      @student = @current_user.students.create!(student_params)
      response = { message: Message.student_created}
    end
    json_response(response)
  end

  def show
    if @current_user.students!=[]
      response = {message: Message.unauthorized}
    else
      student = User.find_by!(email: params[:email]).students.first
      response = {message:Message.student_found, student: student}
    end
    json_response(response)
  end

  def update
    if @current_user.students!=[]
      student = @current_user.students.first
      student.update(student_params)
      response = {message: Message.student_update, edited_student: student}
    else
      response = {message: Message.unauthorized}
    end
    json_response(response)
  end

  def destroy
    if @current_user.students!=[]
      student = @current_user.students.first
      student.destroy
      response = {message: Message.student_destroy}
    else
      response = {message: Message.unauthorized}
    end
    json_response(response)
  end


  private

  def student_params
    params.permit(
      :name,
      :id_number,
      :university,
      :dept
    )
  end
end
