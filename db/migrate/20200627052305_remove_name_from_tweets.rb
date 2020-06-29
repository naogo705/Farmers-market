class RemoveNameFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :name, :string
  end
end
