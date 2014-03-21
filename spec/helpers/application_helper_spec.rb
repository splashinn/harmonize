require 'spec_helper'

describe ApplicationHelper do
  
  describe 'Page Title' do
    it 'displays base title without page title' do
      expect(helper.base_title).to eql 'Harmonize'
    end
    
    it 'displays full title' do
      expect(helper.full_title 'Home').to eql 'Harmonize | Home'
    end
  end
end