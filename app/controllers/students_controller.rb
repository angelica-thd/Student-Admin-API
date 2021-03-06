class StudentsController < ApplicationController
  def create
    if @current_user.students !=[]   #if user already has a student -> if student is already a user in our app
      response = { message: Message.unauthorized }
    elsif Student.where(studentNumber: params[:studentNumber]).exists? 
      response = { message: Message.student_exists}
      status = 422
      @current_user.destroy
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
      if Student.where(studentNumber: params[:identifier]).exists? 
        response = {message:Message.student_found, student_token: Student.where(studentNumber: params[:identifier])[0]}
        satus = 200    
      elsif Student.where(srtoken: params[:identifier]).exists?
        response = {message:Message.student_found, student_token: Student.where(srtoken: params[:identifier])[0]}
        satus = 200  
      else
        response = {message:Message.student_not_found} 
        status = 422
      end
    end
    json_response(response,status)
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
      @current_user.destroy
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
      :city,
      :institution,
      :school,
      :department,
      :academicAddress,
      :academicCity,    
      :studentshipType,
      :studentNumber,
      :entryDate,
      :photo
    )
  end
end
