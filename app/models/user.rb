class User < ActiveRecord::Base
has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
     :trackable, :validatable,:omniauthable,:omniauth_providers => [:github,:linkedin]
     scope :online_users_list, -> {where(status: true)}
    # scope :ofline_users, -> {where(status: false)}
     validates :user_name, uniqueness: {message: "user name is already raken"}
     validates_presence_of :user_name
     enum role: [:admin]


     def self.from_omniauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.user_name = auth.info.name
          user.uid= auth.uid
      end
    end



    # def self.new_with_session(params, session)
    #    super.tap do |user|
    #      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
    #        user.email = data["email"] if user.email.blank?
    #      end
    #    end
    #  end
end
