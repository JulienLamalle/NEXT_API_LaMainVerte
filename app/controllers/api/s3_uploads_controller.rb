class Api::S3UploadsController < ApplicationController
  def set_s3_direct_post
    filename = params[:filename]
    file_type = params[:fileType]
    directory = params[:directory]
    random_path = SecureRandom.uuid
    key = "uploads/#{directory}/#{random_path}/#{filename}"
    
    signer = Aws::S3::Presigner.new
    post_url = signer.presigned_url(:put_object, bucket: "la-main-verte", key: key, acl: 'public-read', content_type: file_type)
    get_url = "https://la-main-verte.s3-eu-west-3.amazonaws.com/#{key}"
    json_response(
      {
        post_url: post_url,
        get_url: get_url,
      }
    )
  end

  private
  
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end