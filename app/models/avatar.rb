class Avatar
  include Mongoid::Document
  include Plug
  store_in collection: 'images', database: 'vote'
  
  field :nm, type: String
  attachment :image
end
