
class Cliente < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  acts_as_paranoid

  has_one :conta
  has_many :depositos

  enum tipo: {
    fisica: 0,
    juridica: 1
  }

  validates :tipo, :nome, :cpf, :endereco, presence: true, if: :fisica?
  validates :tipo, :razão_social, :cnpj, :endereco, presence: true, if: :juridica?
  validates :endereco, length: { maximum: 200 }
end
