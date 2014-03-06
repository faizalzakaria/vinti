class AddUserIdAndQuoteInProfiles < ActiveRecord::Migration
  def up
    add_column :profiles, :quote, :string
    add_column :profiles, :user_id, :integer
  end

  def down
    remove_column :profiles, :quote
    remove_column :profiles, :user_id
  end
end
