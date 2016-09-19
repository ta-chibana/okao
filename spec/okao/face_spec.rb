require 'spec_helper'

describe Okao::Face do
  subject { Okao::Face.new(faces) }
  let(:faces) { { '0' => '(^-^)', '1' => '(-_-)' } }

  it { expect(subject.face_zero).to eq '(^-^)' }
  it { expect(subject.face_one).to eq '(-_-)' }
end
