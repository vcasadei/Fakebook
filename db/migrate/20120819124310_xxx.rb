class Xxx < ActiveRecord::Migration
  def up
add_index "participacao_eventos", ["evento_id"], :name => "index_participacao_eventos_on_evento_id"
 add_index "participacao_eventos", ["profile_id"], :name => "index_relationships_on_profile_id"
 add_index "participacao_eventos", ["evento_id", "profile_id"], :name => "index_relationships_on_evento_id_and_profile_id", :unique => true
 

  end

  def down
  end
end
