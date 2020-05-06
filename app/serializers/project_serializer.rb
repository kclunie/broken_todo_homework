class ProjectSerializer < ActiveModel::Serializer
  attributes :title, :id
  has_many :items
end
