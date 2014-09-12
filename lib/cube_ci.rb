require 'cube_ci/listener'
require 'cube_ci/message'

module CubeCi

  def self.configure(&block)
    @config = OpenStruct.new(account: nil, token: nil, pro: false).tap(&block)
  end

  def self.account
    @config.account
  end

  def self.token
    @config.token
  end

  def self.pro?
    @config.pro
  end

  def self.start!
    Marlowe::Listener.listen_for_build_completions!
  end

end
