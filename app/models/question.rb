class Question < ActiveRecord::Base
  belongs_to :user
  has_many :choices, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :choices, :reject_if => lambda { |a| a[:content].blank? }
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true
  validates :user_id, presence: true

  # Returns questions from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
