class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  acts_as_list :scope => :imageable
  
  # defaults for paperclip for testing/development
  settings = {
    :styles => { 
      :square_thumb => '160x160#', 
      :large => '600x600>', 
    },
    :convert_options => { :all => '-strip' },
    :default_url => '/images/pixel.gif',
    :path => "public/system/images/:style/:id-:sha1.:extension",
    :url => "/system/images/:style/:id-:sha1.:extension"
  }
  
  if Rails.env == 'production'
    options = {
      :storage => 's3',
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      },
      :bucket => ENV['S3_BUCKET'],
      :s3_host_alias => ENV['S3_ALIAS_URL'],
      :url => ':s3_alias_url',
      :path => "images/testing/:style/:id-:sha1.:extension",
      :s3_headers => { 'Expires' => 1.year.from_now.httpdate }
    }
  else
    options = {}
  end

  has_attached_file :asset, settings.merge(options)
      
  validates_attachment_content_type :asset, :content_type => %r{image/.*}
  validates_attachment_presence :asset
  
end
