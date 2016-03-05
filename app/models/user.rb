class User < ActiveRecord::Base
  acts_as_token_authenticatable
  acts_as_taggable_on :skills

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  default_scope { where(private: false) }
  scope :private_profiles, -> { unscoped.where(private: true) }
  scope :all_profiles, -> { unscoped }
  scope :mentors, -> { where(mentor: true) }
  scope :mentorees, -> { where(mentor: false) }

  def to_s
    user_name
  end

  def unify
    self.mentor ? self.find_related_skills.mentorees : self.find_related_skills
  end

  def reset_authentication_token
    self.update_attribute(:authentication_token, nil)
  end
end
