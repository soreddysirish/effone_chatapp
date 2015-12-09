class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
     :trackable, :validatable
     validates_uniqueness_of  :user_name
     validates_presence_of :user_name
end
