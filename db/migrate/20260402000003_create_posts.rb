class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :character, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end

    add_index :posts, :created_at
  end
end
