class AddDomainToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :domain, :string
  end
end
