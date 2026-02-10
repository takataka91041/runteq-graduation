class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :url
      t.text :learning_goal
      t.integer :status
      t.integer :priority
      t.integer :estimated_reading_minutes
      t.text :output_memo
      t.boolean :implemented, default: false

      t.timestamps
    end
  end
end
