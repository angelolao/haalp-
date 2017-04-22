module ApplicationHelper
  def get_params
    params[:search] || {}
  end
end
