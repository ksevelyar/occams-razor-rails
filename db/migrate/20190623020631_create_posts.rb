# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.text :description, null: false
      t.references :user, null: false, foreign_key: true
      t.string :slug, null: false
      t.string :title, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_at

      t.timestamps
    end

    add_index :posts, :slug, unique: true
  end
end
