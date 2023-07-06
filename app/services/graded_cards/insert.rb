# frozen_string_literal: true

module GradedCards
  class Insert
    def initialize(card_id: Card.first.id, name: 'Task 2 with Sidekiq', qualifier: 'MB', grade: '10.0')
      @card_id = card_id
      @name = name
      @qualifier = qualifier
      @grade = grade
    end

    def call
      insert_graded_card
    rescue StandardError => e
      Rails.logger.info(e.message)
    end

    private

    attr_reader :card_id, :name, :qualifier, :grade

    def insert_graded_card
      graded_card = GradedCard.new

      graded_card.with_lock do
        graded_card.card_id = card_id
        graded_card.name = name
        graded_card.qualifier = qualifier
        graded_card.grade = grade
        graded_card.save!
      end
    end
  end
end
