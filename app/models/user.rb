class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates_with ::IncriveisValidator


  validates :cpf, uniqueness: true, if: :cpf_is_true?
  validates :cnpj, uniqueness: true, if: :cnpj_is_true?

  def cpf_is_true?
    pf_pj == "PF"
  end

  def cnpj_is_true?
    pf_pj== "PJ"
  end

  def self.search_by(attribute, value)
    where("#{attribute} = ?", value).first
  end
end
