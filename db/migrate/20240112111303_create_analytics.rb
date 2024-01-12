class CreateAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :analytics do |t|
      t.text :query, null: false
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
