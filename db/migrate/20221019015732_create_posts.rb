class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.string :title
      t.text :content
      t.boolean :visible

      t.timestamps
    end
  end
end
