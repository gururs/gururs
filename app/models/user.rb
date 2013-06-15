class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :authorizations, dependent: :destroy
  has_many :talks
  validates :name, presence: true

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session[:omniauth]
        user.email = auth.info.email if auth.info.email.present?
        user.name = auth.info.name
        user.image = auth.info.image
        user.github_username = auth.extra.raw_info.login if auth.extra and auth.extra.raw_info
        user.authorizations.build(provider: auth.provider, uid: auth.uid)
      end
    end
  end

  def avatar_url(size = 100)
    return image if image.present?
    host = "http://www.gururs.com"
    default_image = ActionController::Base.helpers.asset_path('default_avatar.png')
    "http://gravatar.com/avatar/#{Digest::MD5.new.update(email)}.jpg?s=#{size}&d=#{host}#{default_image}"
  end
end


