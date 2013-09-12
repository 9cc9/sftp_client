require "sftp_client/version"

module SftpClient
  require "sftp_client/sftp/client"

  LIBDIR = File.expand_path(File.dirname(__FILE__))
end

$LOAD_PATH.unshift SftpClient::LIBDIR unless $LOAD_PATH.include? SftpClient::LIBDIR
