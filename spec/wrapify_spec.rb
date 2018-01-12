#wrapify_spec.rb   spec file for gem
require 'spec_helper'

describe 'Wrapify' do
  doc1 = <<-DOC1HERE
line 1 contains a lot of         stuff
line 2 contains even more, which    we will wrap to a fixed short
line 3 boundry if we are lucky. Who knows    what will really     happen.
line 4
DOC1HERE

  doc2 = <<-DOC2HERE
line_1_is_too_long;it_should_flow_thru_too_long
DOC2HERE

  doc4 = <<-DOC4HERE
line1mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
line2nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
DOC4HERE

  doc1_justified = <<-RESULT
line 1 contains a 
lot of stuff line 
2 contains even 
more, which we 
will wrap to a 
fixed short line 3 
boundry if we are 
lucky. Who knows 
what will really 
happen. line 4
RESULT

  doc2_justified = <<-RESULT2
line_1_is_too_long;it_should_flow_thru_too_long
RESULT2

  describe '#process' do
    let(:input) { doc1 }
    let(:output) { input.wrap_to_limit(20) }

    it 'should pass' do
      puts doc1
      puts '-----'
      puts doc1_justified
      puts '-----'
      puts output
      expect(output).to eq doc1_justified
    end

    it 'should pass with single overlong string' do
      expect(doc2.wrap_to_limit(20)).to eq doc2_justified
    end

    it 'should return empty string with empty input' do
      expect(''.wrap_to_limit(20)).to eq ''
    end

    it 'should pass with two overlong string' do
      expect(doc4.wrap_to_limit(20)).to eq doc4
    end

  end
end
