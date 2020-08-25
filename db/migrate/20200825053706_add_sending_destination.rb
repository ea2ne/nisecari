class AddSendingDestination < ActiveRecord::Migration[6.0]
  def change
    add_column :sending_destinations, :roomnumber, :string
  end
end
