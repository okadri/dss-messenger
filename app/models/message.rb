class Message < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  has_many :damages
  has_many :impacted_services, :through => :damages

  has_many :audiences
  has_many :recipients, :through => :audiences

  belongs_to :classification
  belongs_to :modifier

  has_many :logs, :class_name => "MessageLog"
  has_many :publishers, :through => :logs

  # Validations
  validates :subject, presence: true
  validates :impact_statement, presence: true
  validates_presence_of :recipients
  validates_presence_of :publishers, :on => :create

  def recipients=(recipient_list)
    recipient_list.each do |r|
      self.recipients << Recipient.find_or_create_by(r)
    end
  end
end
