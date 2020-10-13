class MakeTagString < ActiveRecord::Migration[5.2]
  def change
    change_column :faucets, :number_customer_tag, :string

  end
end
