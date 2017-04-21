class OffersController < ApplicationController
  load_and_authorize_resource

  def index
    @offers = Offer.search(params.slice(:task_id))
  end

  def aktion
    @offer = Offer.find_by_id(params[:offer][:id])
    res = @offer.update_attribute(:status, aktion_status)
    redirect_to task_offers_path(@offer.task_id), alert: (res ? "Successful!" : "Something went wrong")
  end

  private

  def aktion_status
    { "Decline" => "declined" }[params[:commit]] || "accepted"
  end

end
