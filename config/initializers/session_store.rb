# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_enchantee_session',
  :secret      => '0972b1e7f9ff2082ed70192f1281897d32ba59a02a0b898a8446e6f9936e2b3af5b6d65aa39d0d3a4320a71eb2f68581a5546f4df0b9cb660733302a1938b3ec'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
