# encoding: utf-8
module Cobo
  class Custody
    
    def self.org_info
      Request.get format_command("org_info")
    end
  
    def self.new_address(params = {})
      Utils.check_required_params(params, %w(coin))
      Request.post format_command("new_address"), params
    end
  
    def self.address_info(params = {})
      Utils.check_required_params(params, %w(coin address))
      Request.get format_command("address_info"), params
    end
  
    def self.address_history(params = {})
      Utils.check_required_params(params, %w(coin))
      Request.get format_command("address_history"), params
    end
  
    def self.transaction(params = {})
      Utils.check_required_params(params, %w(id))
      Request.get format_command("transaction"), params
    end
  
    def self.transaction_history(params = {})
      Request.get format_command("transaction_history"), params
    end
  
    def self.deposit_info(params = {})
      Utils.check_required_params(params, %w(id))
      Request.get format_command("deposit_info"), params
    end
  
    def self.new_withdraw_request(params = {})
      Utils.check_required_params(params, %w(coin request_id address amount))
      Request.post format_command("new_withdraw_request"), params
    end
  
    def self.withdraw_info_by_request_id(params = {})
      Utils.check_required_params(params, %w(request_id))
      Request.get format_command("withdraw_info_by_request_id"), params
    end
  
    def self.faucet_test_coin(params = {})
      Utils.check_required_params(params, %w(coin address))
      Request.post format_command("faucet_test_coin"), params
    end
    
    def self.format_command(command)
      "/v1/custody/#{command}/"
    end
  end
end