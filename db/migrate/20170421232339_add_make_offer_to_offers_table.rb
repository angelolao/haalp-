class AddMakeOfferToOffersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :make_offer, :boolean, default: false, after: :status
  end
end
