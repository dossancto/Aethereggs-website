class TutorialMapsController < ApplicationController
  before_action except: :public
  caches_action :index, layout: true, expires_in: 5.minutes

  API_URL = ENV['API_URL']

  def index
    url = '/allmaps/names'
    response = HTTParty.get(API_URL + url)
    result_json = JSON.parse(response.body)
    @mapnames = result_json
  end

  def map
    mapname = params[:mapname]
    url = "#{API_URL}/tutoriais/#{mapname}"
    response = HTTParty.get(url)
    result_json = JSON.parse(response.body)

    map = Map.new('', '', [], [], [], [])

    map.name = result_json['name']

    map.ee = parse_item(result_json['ee'])
    map.ww = parse_item(result_json['ww'])
    map.uww = parse_item(result_json['uww'])
    map.extras = parse_item(result_json['extras'])

    @map = map
  end

  def steps
    mapname = params[:mapname]
    tipo = params[:type]
    id = params[:id]

    is_dig = /\A[-+]?\d+\z/ === id

    render 'notfound' unless is_dig

    url = "#{API_URL}/tutoriais/#{mapname}/#{tipo}"

    response = HTTParty.get(url)
    result_json = JSON.parse(response.body)

    @subitems = parse_item(result_json)[id.to_i]
  end

  private

  def parse_item(result_json)
    i = -1
    result_json.map do |e|
      Subitem.new(
        i += 1,
        e['mapName'],
        e['name'],
        e['steps']
      )
    end
  end
end
