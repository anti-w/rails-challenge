# frozen_string_literal: true

class User < ActiveRecord::Base

  extend Devise::Models

  include UserQuery

  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :name, :kind, :password, :password_confirmation, presence: true, on: :create
  validates :password, length: { minimum: 8 }, on: :create

  include DeviseTokenAuth::Concerns::User

  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all

end
