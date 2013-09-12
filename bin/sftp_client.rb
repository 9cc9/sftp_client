#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'sftp_client'

client = SFtp::Client.new
client.send('background.sh')
client.receive('background.sh')
