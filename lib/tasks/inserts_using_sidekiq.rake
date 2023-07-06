# frozen_string_literal: true

namespace :graded_cards do
  desc 'Simulate 200 concurrent inserts using Sidekiq'
  task inserts_using_sidekiq: :environment do
    200.times do
      InsertGradedCardJob.perform_async
    end
  end
end
