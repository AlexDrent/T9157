class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  # before_create :set_default_role
  # or
  before_validation :set_default_role

  private
  def set_default_role
    self.role ||= Role.find_by_name('unregistered')
    Rails.logger.debug "-------------------------------Default Role: #{default_role.inspect}-------------------------------------" if default_role.nil?
    self.role ||= default_role
  end
end

