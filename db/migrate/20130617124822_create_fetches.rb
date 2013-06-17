class CreateFetches < ActiveRecord::Migration
  def change
    create_table :fetches do |t|
      t.integer :twitter_user_id
      t.timestamps
    end
  end
end
