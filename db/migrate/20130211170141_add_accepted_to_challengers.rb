class AddAcceptedToChallengers < ActiveRecord::Migration
  def change
    add_column :challengers, :accepted, :boolean
  end
end
