module TutorialMapsHelper
  def clear_img_url(url)
    url.gsub('$file:', '')
  end
end
