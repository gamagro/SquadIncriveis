class CpfCnpj < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :cpf, unique: true
    add_index :users, :cnpj, unique: true
  end
end
