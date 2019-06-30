class Comment
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  belongs_to :user
  belongs_to :post

  field :body,              type: String, default: ""
end
