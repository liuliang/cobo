module Cobo
  module Utils
    def self.check_required_params(params, names)
      missing_params = names.map(&:to_s) - params.keys.map(&:to_s)
      warn("Warn: missing required option: #{missing_params.join(',')}") if missing_params.size > 0
    end
  end
end
