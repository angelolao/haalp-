class CommentsController < ApplicationController
  def create
    if Comment.create(permit_parameters)
      flash[:notice] = "Comment sent"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to task_path(params[:comment][:task_id])
  end

  private

  def permit_parameters
    params.require(:comment).permit(
      :user_id,
      :task_id,
      :note,
      :rating,
      :poster_user_id
    )
  end
end
