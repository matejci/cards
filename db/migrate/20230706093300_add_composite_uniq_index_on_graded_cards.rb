class AddCompositeUniqIndexOnGradedCards < ActiveRecord::Migration[7.0]
  def change
    add_index :graded_cards, [:card_id, :grade, :qualifier], unique: true
  end
end
