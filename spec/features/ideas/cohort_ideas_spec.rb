require 'spec_helper'

RSpec.describe 'Upvote landing page' do
  it 'displays idea cards' do
    visit '/'

    expect(page).to have_content('Great')
  end
end
