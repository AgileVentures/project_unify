class User < ActiveRecord::Base
  acts_as_taggable_on :skills

  def to_s
    user_name
  end
end
