class InsertGradedCards < ActiveRecord::Migration[7.0]
  def up
    query = 'COPY graded_cards(name, card_id, grade, qualifier, created_at, updated_at) FROM STDIN'
    data = ''

    current_time = Time.current
    hash_data = {}

    Card.find_each do |card|
      graded_cards_pair = 0

      while graded_cards_pair < 2
        name = Faker::Fantasy::Tolkien.character
        qualifier = GradedCard::QUALIFIER_VALUES.sample
        grade = GradedCard::GRADES.sample
        key = "#{card.id}-#{qualifier}-#{grade}".gsub(" ", "_")

        if !hash_data.key?(key)
          value = "#{name}\t#{card.id}\t#{grade}\t#{qualifier}\t#{current_time}\t#{current_time}\n"
          hash_data[key] = value
          data << value
          graded_cards_pair += 1
        end
      end
    end

    conn = ActiveRecord::Base.connection_pool.checkout
    raw = conn.raw_connection
    raw.exec(query)
    raw.put_copy_data(data)
    raw.put_copy_end
    while raw.get_result; end
    ActiveRecord::Base.connection_pool.checkin(conn)
  end

  def down
    GradedCard.delete_all
  end
end
