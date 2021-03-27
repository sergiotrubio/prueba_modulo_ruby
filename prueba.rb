require "uri"
require "net/http"
require "json"

def request(address)
    url = URI(address)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Cookie"] = "__cfduid=d8259993ba5542b24e13d88b44bb2546d1616782609"

    response = https.request(request)
    JSON.parse response.read_body
end

def build_web_page
    body = request('https://jsonplaceholder.typicode.com/photos')[0..4]
    photos = body.map{|x| x['url']}
    lista = ""
    photos.each do |photo|
        lista += "<li><img src=\"#{photo}\"></li>\n"
    end
result = "<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<ul>\n#{lista}</ul>\n</body>\n</html>"
end

pagina = build_web_page

File.write('index.html',pagina)


#HOLA! Intenté por todos los medios Obtener el Api de la Nasa pero era imposible, en realidad consulté con varios compañeros y todos me dijeron que en la clase hicieron el ejercicio PERO PERO en esa fue la que me conecté y desconecté cada 1 minuto. Además al momento de hoy aún no está disponible la grabación en Vimeo. Logro obtener el Hash probandolo en a terminal (almenos se que es un Hash porque pregunto la clase y me aparece.)

#Debido a todo lo anterior decidí hacerlo con una api que si estaba resultando que eran la de los ejercicios de práctica (la de Oxford tampoco servia, al parece el PDF está desactualizado porque cuando pedía el codigo de Postman (con lo que probé lo de arriba) tampoco resultaba, en este caso no era el SSL si no un nill que me resultaba)

#Le puse todo el empeño para hacer el modulo completo en 3 días.

=begin
require 'uri'
require 'net/http'
require 'json'

def get_data(endpoint)

    url = URI(endpoint)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl =true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = http.request(request)

    return JSON.parse(response.read_body)
    
end

data = get_data("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=Mf9aVKVm5rmaUiVG23ZHDkxlMVVXsEKDLsadpWWM")
photos = data.map{|x| x["img_src:"]}

---===!!! NO PARA DE SALIRME ESTE ERROR QUE NO ME DEJA PROBAR EL PROGRAMA !!! === ---

Traceback (most recent call last):
        1: from prueba.rb:18:in `<main>'
prueba.rb:11:in `get_data': uninitialized constant OpenSSL (NameError)
Did you mean?  OpenStruct

=end



