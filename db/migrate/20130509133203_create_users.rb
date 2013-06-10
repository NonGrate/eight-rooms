class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.integer   :rating, :null => false
    t.string   :name
    t.string   :surname
    t.string   :username
    t.string   :password
    t.string   :favorites
    t.string   :users_voted, :default => '-1'

      t.timestamps
    end
  end
end
