class CommentsController < ApplicationController
  def create
    create_comment
    redirect_to task_path(params[:comment][:task_id])
  end

  private

  def create_comment
    offers = Offer.search(task_id: params[:comment][:task_id], status: "accepted")
    offers.each do |offer|
      Comment.create(permit_parameters(offer.user_id))
    end
  end

  def permit_parameters(user_id)
    params[:comment][:user_id] = user_id
    params.require(:comment).permit(
      :user_id,
      :task_id,
      :note,
      :rating,
      :poster_user_id
    )
  end
end
