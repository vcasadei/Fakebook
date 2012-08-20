class Mensagem < ActiveRecord::Base
  attr_accessible :mensagem, :dest, :remet, :dono
  
  belongs_to :owner, class_name: "Profile", :foreign_key => "full_name"
  belongs_to :from, class_name: "Profile", :foreign_key => "full_name"
  belongs_to :to, class_name: "Profile", :foreign_key => "full_name"
  
  validates_presence_of :dest, :mensagem => "esta em branco"
end
