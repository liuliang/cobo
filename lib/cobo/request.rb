module Cobo
  class Request

    def self.get(command, params = {} )
      url = host + command
      headers = headers(command, 'GET', params)
      result = RestClient::Request.execute(method: :get, url: url, headers: headers.merge({params: params}))
      JSON.parse result
    end

    def self.post( command, params = {} )
      url = host + command
      headers = headers(command, 'POST', params)
      result = RestClient::Request.execute(method: :post, url: url, payload: params, headers: headers)
      JSON.parse result
    end

    def self.host
      Cobo.sandbox ? "https://api.sandbox.cobo.com" : "https://api.custody.cobo.com"
    end

    def self.headers(command, method = 'GET', params = {})
      nonce = (Time.zone.now.to_f * 1000).to_i.to_s
      params_str = params.stringify_keys.sort.map{|array| "#{array.first}=#{array.last}" }.join("&")
      content = [method, command, nonce, params_str].join("|")
      digest = OpenSSL::Digest.new('sha256')
      sign = OpenSSL::HMAC.hexdigest(digest, Cobo.secret, content)
      {"BIZ-API-KEY" => Cobo.key, "BIZ-API-SIGNATURE" => sign, "BIZ-API-NONCE" => nonce}
    end

  end
end