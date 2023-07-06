# frozen_string_literal: true

namespace :graded_cards do
  desc 'Simulate 100 concurrent inserts using threads'
  task inserts_using_threads: :environment do
    threads = []

    100.times do
      threads << Thread.new do
        GradedCards::Insert.new(card_id: Card.last.id,
                               name: 'Task 2 with threads',
                               qualifier: 'OD',
                               grade: '1.0').call
      end
    end

    threads.each(&:join)
  end
end
