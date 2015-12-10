class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
     :trackable, :validatable

     scope :online_users, -> {where(status: true)}
    # scope :ofline_users, -> {where(status: false)}



     validates :user_name, uniqueness: {message: "user name is already raken"}
     validates_presence_of :user_name
     #after_initialize :defaults 

     private
     def defaults
       self.status ||= false
     end
end
