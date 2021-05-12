class StudentsController < ApplicationController
  def create
    if @current_user.students !=[]   #if user already has a student -> if student is already a user in our app
      response = { message: Message.unauthorized }
    elsif Student.where(studentNumber: params[:studentNumber]).exists? 
      response = { message: Message.student_exists}
      status = 422
    else
      @student = @current_user.students.create!(student_params)
      response = { message: Message.student_created}
      status = :created
    end
    json_response(response, status)
  end

  def show
    if @current_user.students!=[]
      response = {message: Message.unauthorized}
    else
      student = Student.find_by!(studentNumber: params[:studentNumber])
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
      :greekFname,
      :greekLname,
      :latinFname,
      :latinLname,
      :address,
      :zipCode,
      :city,
      :prefecture,
      :institution,
      :school,
      :department,
      :academicAddress,
      :academicCity,
      :academicPrefecture,
      :academicZipCode,
      :studentshipType,
      :studentNumber,
      :studentAMKA,
    )
  end
end
