
class ReactFormat

  def for(keyword)
    '{"kind":"books","totalItems":2,"items":[' +
        '{"title":"' + keyword + '","authors":["Jean-Pierre Serre"],"ISBN":"9783540442370","image":"'+ image_link() +'"},' +
        '{"title":"Big ' + keyword + '","authors":["Jon-Pierre Serre"],"ISBN":"9783540442371","image":"'+ image_link() +'"}' +
        ']}'
  end

  def image_link
    "http://books.google.com/books/content?id=MOAqeoYlBMQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
  end

end
