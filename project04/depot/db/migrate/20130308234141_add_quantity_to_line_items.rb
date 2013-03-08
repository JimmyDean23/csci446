class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quantitiy, :integer, default: 1
  end
end
