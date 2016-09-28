require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,    Serial
  property :text,  String
  property :created_at, Time

  belongs_to :user

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
