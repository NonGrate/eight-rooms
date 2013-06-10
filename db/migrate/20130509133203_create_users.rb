class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.integer  :rating
    t.string   :name
    t.string   :surname
    t.string   :username
    t.string   :password
    t.string   :favorites
    t.string   :users_voted

      t.timestamps
    end
  end
end
