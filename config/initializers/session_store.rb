# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lp2pt_session',
  :secret      => '7152132994ebb14306303b6c68c9001c222ee83ccbf582f3628b27284de45242ec08fb24c6d837ca5ce460101f572b8aaa3bdce7cd4a2c2e8f800180cdf81f7b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
