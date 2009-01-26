require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByCookieToken

  validates_format_of       :first,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :first,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def full_name
    "#{first} #{last}"
  end
  
  def self.find_or_create_from_cas(ticket)
    # Look for a user with this guid
    receipt = ticket.response
    guid = receipt.extra_attributes['ssoGuid']
    first_name = receipt.extra_attributes['firstName']
    last_name = receipt.extra_attributes['lastName']
    u = User.find(:first, :conditions => "guid = '#{guid}'")
    unless u
      # If we don't have a user we need to create one.
      u = User.create!(:email => receipt.user.downcase, :guid => guid, :first => first_name, :last => last_name)
    end            
    u.save(false)
    u
  end

  protected
    


end
