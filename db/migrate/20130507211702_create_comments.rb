class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    t.integer  :postid
    t.string   :text
    t.string   :user
    t.integer   :rating, :null => false
    t.string   :users_voted, :default => '-1'

      t.timestamps
    end
  end
end
