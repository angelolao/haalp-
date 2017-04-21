class OffersController < ApplicationController
  load_and_authorize_resource except: [:create]

  def create
    redirect_to Offer.create(permit_parameters).task
  end

  def aktion
    @offer = Offer.find_by_id(params[:offer][:id])
    res = @offer.update_attribute(:status, aktion_status)
    redirect_to task_path(params[:task_id]), alert: (res ? "Successful!" : "Something went wrong!")
  end

  def destroy

  end

  private

  def aktion_status
    { "Decline" => "declined" }[params[:commit]] || "accepted"
  end

  def permit_parameters
    params.require(:offer).permit(:user_id, :task_id, :introduction)
  end
end
