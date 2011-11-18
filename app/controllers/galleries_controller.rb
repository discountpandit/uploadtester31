class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end
  
  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      redirect_to @gallery, notice: 'Gallery was successfully created.'
    else
      render action: "new"
    end
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_path, notice: 'Gallery deleted.'
  end
  
  # handle uploadify 
  def add_image
    @gallery =Gallery.find(params[:id])
    images = @gallery.images
    newparams = coerce(params)
    image = images.build(newparams[:image])
    if image.save
      render :partial => 'galleries/thumbs.html.erb'
    else
      render :text => "An error occurred: #{image.errors.full_messages}"
    end
  end
  
  # delete one image
  def delete_image
    @gallery = Gallery.find(params[:id])
    img_id = params[:image_id].sub(/^del_(.+)$/, '\1')
    img = @gallery.images.find(img_id)
    img.destroy
    render :partial => 'galleries/thumbs.html.erb'
  end
  
  
  private
  
  def coerce(params)
    h = Hash.new
    h[:image] = Hash.new
    h[:image][:asset] = params[:Filedata]
    h[:image][:asset].content_type = MIME::Types.type_for(h[:image][:asset].original_filename).to_s
    h
  end
  

end

