class CreateCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    Category.create name: "Web development"
    Category.create name: "Databases"
    Category.create name: "Networking"
    Category.create name: "Information Systems"
    Category.create name: "Programming"
    Category.create name:"Emerging trends"
  end

  def down
    drop_table :categories
  end
end
