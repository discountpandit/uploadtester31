# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Uploadtester::Application.initialize!

# for calculating paperclip asset names
SHA1_KEY = 'xC3eQYj9UL'

# maximum image size that can be uploaded
MAX_IMAGE_SIZE = 31457280
