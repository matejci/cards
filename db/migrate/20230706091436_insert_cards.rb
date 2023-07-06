class InsertCards < ActiveRecord::Migration[7.0]
  def up
    query = 'COPY cards(name, created_at, updated_at) FROM STDIN'
    data = ''

    current_time = Time.current

    100_000.times do
      name = Faker::Fantasy::Tolkien.character
      data << "#{name}\t#{current_time}\t#{current_time}\n"
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
    Card.delete_all
  end
end
