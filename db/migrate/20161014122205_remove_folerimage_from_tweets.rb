class RemoveFolerimageFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :folerimage, :string
  end
end
