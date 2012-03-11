class Submission
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :first_name, :last_name, :email, :mobile_phone, :institute, :team_size, :venture_title, :definition, :website, :file

  validates :first_name, :last_name, :email, :mobile_phone, :institute, :team_size, :venture_title, :definition, :file, :presence => true
  validates :first_name, :last_name, :email, :mobile_phone, :institute, :team_size, :venture_title, :definition, :length => { :maximum => 255 }

  def initialize(attributes=nil)
    if attributes
      attributes.each do |key, value|
        send("#{key}=", value)
      end
    end
  end
  def method_missing(name, *args, &block); end
  def persisted?; false; end
end
