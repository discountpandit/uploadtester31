Paperclip.interpolates(:sha1) do |attachment, style|
  Digest::SHA1.hexdigest("#{attachment.instance.id}#{style}#{attachment.instance_read(:asset_updated_at).to_i}#{SHA1_KEY}")
end
