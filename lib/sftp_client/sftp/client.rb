require 'net/sftp'


module SFtp
  class Client
    def initialize
      @host = '127.0.0.1'
      @username = 'itzhy'
      @password = 'gmy900925'
    end

    def send(file_name)
      create_connection do |sftp|
        # upload a file or directory to the remote host
        sftp.upload!("/home/itzhy/Backup/sender/#{file_name}", "/home/itzhy/Backup/receiver/#{file_name}")
      end
    end

    def receive(file_name)
      create_connection do |sftp|
        # create a directory
        sftp.mkdir! "/home/itzhy/Backup/receiver/new"

        # download a file or directory from the remote host
        sftp.download!("/home/itzhy/Backup/sender/#{file_name}", "/home/itzhy/Backup/receiver/new/#{file_name}")
      end
    end

    private
    def create_connection
      Net::SFTP.start(@host, @username, :password => @password) do |sftp|
        yield(sftp)
      end
    end
  end
end