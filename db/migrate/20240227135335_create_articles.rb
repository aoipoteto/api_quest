class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :slug, null: false, unique: true
      t.string :title, null: false
      t.string :description, null: false, default: ''
      t.text :body, null: false, default: ''
      t.text :tag_list, null: false, default: ''

      t.timestamps
    end
  end
end
