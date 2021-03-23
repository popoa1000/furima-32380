class RemoveItemIdIdFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :item_id_id, null: false, foreign_key: true
  end
end
