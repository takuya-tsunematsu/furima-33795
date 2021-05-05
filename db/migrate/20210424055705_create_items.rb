class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                null: false
      t.integer    :price,               null: false
      t.text       :text,                null: false
      t.integer    :category_id,         null: false
      t.integer    :status_id,           null: false
      t.string     :delivery_charge_id,  null: false
      t.string     :prefecture_id,       null: false
      t.string     :shipping_date_id,    null: false
      t.references :user,                null: false
      t.timestamps
    end
  end
end
