class User < ActiveRecord::Base
  include Scopes
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
