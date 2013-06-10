class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    t.string   :user
    t.string   :title
    t.string   :text
    t.string   :tags
    t.integer   :rating
    t.string   :users_voted

      t.timestamps
    end
  end
end
