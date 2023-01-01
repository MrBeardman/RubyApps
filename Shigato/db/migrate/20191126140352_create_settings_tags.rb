class CreateSettingsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :settings_tags do |t|
      t.string :title
      t.string :color
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
