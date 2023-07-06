# frozen_string_literal: true

class InsertGradedCardJob
  include Sidekiq::Job

  sidekiq_options retry: false

  def perform
    GradedCards::Insert.new.call
  end
end
