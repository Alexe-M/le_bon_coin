class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :stripe_customer_id
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.timestamps
    end
  end
end
