class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :main_picture
      t.string :sub_picture1
      t.string :sub_picture_2
      t.string :sub_picture3
      t.string :sub_picture4
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
