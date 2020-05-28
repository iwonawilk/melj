class Video < ApplicationRecord
  validates :title, presence: true
  # validates :url, presence: true, format: URI::regexp(/^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$/)
  validates :url,
            presence: true,
            format: {
              with: /(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+\z/,
              message: "should look like https://www.youtube.com/watch?v=W-nVrprMkvI or https://youtu.be/W-nVrprMkvI"
            }
end
