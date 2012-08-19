class ParticipacaoEvento < ActiveRecord::Base
  attr_accessible :evento_id, :profile_id
  belongs_to :evento, class_name: "Evento"
  belongs_to :profile, class_name: "Profile"
end