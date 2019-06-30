class Post
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  belongs_to :user
  has_many :comments

  field :body,              type: String, default: ""
end
