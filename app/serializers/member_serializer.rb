class MemberSerializer < ActiveModel::Serializer
  attributes :id, :role, :username

  def username
    object.user.name
  end
end
