class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save!
      flash.now.notice = "You have made a comment"
      session[:employee_id] = @employee.id
    else
      flash.now.notice = "You have not added a comment"
      redirect_to new_employee_path
    end
    redirect_to employees_path
  end
private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
