class OffersController < ApplicationController
  load_and_authorize_resource except: [:create]

  def create
    redirect_to Offer.create(permit_parameters).task
  end

  def aktion
    @offer = Offer.find_by_id(params[:offer][:id])
    res = @offer.update_attribute(:status, aktion_status)
    flash[:notice] = res ? "Offer #{aktion_status}!" : "Something went wrong!"
    redirect_to :back
  end

  def destroy
    #@offer = Offer.find_by_id(params[])
  end

  private

  def aktion_status
    { "Decline" => "declined" }[params[:commit]] || "accepted"
  end

  def permit_parameters
    params.require(:offer).permit(:user_id, :task_id, :introduction)
  end
end
