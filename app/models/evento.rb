class Evento < ActiveRecord::Base
  belongs_to :profile
  has_many :participacao_eventos, foreign_key:"evento_id"
  
 

  has_many :profiles, through: :participacao_eventos
  attr_accessible :nome, :data, :local, :desc
  validates_presence_of :nome, :local, :message => "esta em branco"
  validates_uniqueness_of :nome, :message => "ja existe"   
  
  
  
  
end
