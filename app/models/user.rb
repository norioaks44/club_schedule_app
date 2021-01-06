class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
  belongs_to :position
  has_many :events, foreign_key: :user_id
  has_many :reviews, foreign_key: :user_id

  has_many :sns_credentials

  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze # 全角
    validates :name, format: { with: NAME_REGEX, message: 'enter in full characters' }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze # 半角英数字
    validates :password, format: { with: PASSWORD_REGEX, message: 'include both letters and numbers' }, length: { minimum: 6 }
    validates :grade_id
    validates :position_id
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
