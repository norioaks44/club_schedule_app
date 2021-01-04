require 'rails_helper'

RSpec.describe Skill, type: :model do
  before do
    @skill = FactoryBot.build(:skill)
    @skill.image = fixture_file_upload('public/images/test_image.png')
    @skill.video = fixture_file_upload('public/images/test_video.mp4')
  end

  # describe do
    
    
  # end
end






