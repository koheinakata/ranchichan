class AddHeartToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :heart, :string
  end
end
