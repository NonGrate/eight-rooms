class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    t.string   :user
    t.string   :title
    t.string   :text
    t.string   :tags
    t.integer   :rating, :null => false
    t.string   :users_voted, :default => '-1'

      t.timestamps
    end
  end
end
