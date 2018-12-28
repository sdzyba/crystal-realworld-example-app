class ApplicationController < Amber::Controller::Base
  def json(content : String)
    respond_with { json content }
  end

  def error(code : Int32, errors : Hash(String, Array(String)))
    respond_with(code) { json({ "errors" => errors }.to_json) }
  end

  def params_for(key : String)
    json_params(params.json(key).as_h)
  end

  private def json_params(json : Hash(String, JSON::Any)) : Hash(String, String)
    params = {} of String => String
    json.each { |k, v| params[k] = v.to_s }
    params
  end
end
