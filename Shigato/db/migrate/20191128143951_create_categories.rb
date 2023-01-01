class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :Title
      t.string :Color
      t.belongs_to :User, foreign_key: true

      t.timestamps
    end
  end
end
