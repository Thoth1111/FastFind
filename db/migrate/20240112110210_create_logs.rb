class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.inet :ip_address, null: false
      t.string :query, null: false
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
