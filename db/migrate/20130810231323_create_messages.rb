class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_body
      t.string :from_number

      t.timestamps
    end
  end
end
