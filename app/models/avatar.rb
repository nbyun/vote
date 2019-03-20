class Avatar
  include Mongoid::Document
  plugin Plug
  store_in collection: 'images', database: 'vote'
  
  field :nm, type: String
  attchment :image
end
