class AddTrackingToGradedCards < ActiveRecord::Migration[7.0]
  def change
    add_column :graded_cards, :tracking, :boolean, default: false, null: false
  end
end
