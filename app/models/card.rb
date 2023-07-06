# frozen_string_literal: true

class Card < ApplicationRecord
	has_many :graded_cards

	validates :name, presence: true
end
