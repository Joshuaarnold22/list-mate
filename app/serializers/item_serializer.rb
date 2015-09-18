class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at

  def title
    object.title
  end

  def body
    object.body
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
