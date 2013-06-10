class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    t.integer  :postid
    t.string   :text
    t.string   :user
    t.string   :rating
    t.string   :users_voted

      t.timestamps
    end
  end
end
