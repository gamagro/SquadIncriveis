class AddFullNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :razaosocial, :string
    add_column :users, :pf_pj, :string
    add_column :users, :cpf, :string
    add_column :users, :cnpj, :string
    add_column :users, :rua, :string
    add_column :users, :cep, :string
    add_column :users, :bairro, :string
    add_column :users, :cidade, :string
    add_column :users, :estado, :string
    add_column :users, :numero, :string
    add_column :users, :adm, :boolean, default: false
  end
end
