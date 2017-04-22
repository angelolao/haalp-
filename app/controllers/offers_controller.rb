class OffersController < ApplicationController
  load_and_authorize_resource except: [:create]

  def create
    @offer = Offer.search(params[:offer]).first

    if @offer
      @offer.update_attribute(:make_offer, true)
      redirect_to task_path(@offer.task_id)
    else
      redirect_to Offer.create(permit_parameters).task
    end
  end

  def aktion
    @offer = Offer.find_by_id(params[:offer][:id])
    res = @offer.update_attribute(:status, aktion_status)
    flash[:notice] = (res ? "Offer #{aktion_status}!" : "Something went wrong!")
    redirect_to :back
  end

  def destroy
    @offer = Offer.find_by_id(params["id"])
    res = @offer.update_attribute(:make_offer, false)
    flash[:notice] = (res ? "Cancel Offer" : "Something went wrong!")
    redirect_to :back
  end

  private

  def aktion_status
    params[:commit] == "Decline" ? "declined" : "accepted"
  end

  def permit_parameters
    params[:offer][:make_offer] = true
    params.require(:offer).permit(:user_id, :task_id, :introduction, :make_offer)
  end
end
