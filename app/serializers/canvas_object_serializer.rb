class CanvasObjectSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :width, :height
  belongs_to :board
end
