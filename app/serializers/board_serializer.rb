class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :members
  has_many :canvas_objects, if: -> { instance_options[:include_canvas_objects] }
end
