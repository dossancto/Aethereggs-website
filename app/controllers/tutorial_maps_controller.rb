class TutorialMapsController < ApplicationController
  before_action except: :public
  caches_action :index, layout: true, expires_in: 5.minutes

  API_URL = ENV['API_URL']

  def index
    url = '/allmaps/names'

    result_json = get_request(url)

    @mapnames = result_json
  end

  def map
    mapname = params[:mapname]
    url = "/tutoriais/#{mapname}"

    result_json = get_request(url)

    return unless result_json

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

    url = "/tutoriais/#{mapname}/#{tipo}"

    result_json = get_request(url)
    return unless result_json

    @subitems = parse_item(result_json)[id.to_i]
  end

  private

  def get_request(url)
    response = HTTParty.get(API_URL + url)

    JSON.parse(response.body)
  rescue Errno::ECONNREFUSED
    render 'apiError'
    false
  rescue URI::InvalidURIError
    render 'notfound'
    false
  end

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
