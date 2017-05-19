#Segmento de Empresa
class Segment
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  has n,:companies, :through => Resource
end
