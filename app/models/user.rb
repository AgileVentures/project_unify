class User < ActiveRecord::Base
  def to_s
    user_name
  end
end
