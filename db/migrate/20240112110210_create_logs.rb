class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.text :ip_address, null: false
      t.string :query, null: false

      t.timestamps
    end
  end
end
