# -*- coding: utf-8 -*-

require 'spec_helper'

describe Configatron::Store do

  include_examples "Configatron::Store"

end

describe Configatron::Store, "after safe!" do

  let!(:object) { Configatron::Store.new }

  before do
    object.aaa = "aaa"
    object.bbb.aaa = "bbb.aaa"
    object.safe!
  end

  after do
    object.unsafe!
  end

  subject { object }

  its(:aaa) { should be_eql "aaa" }
  its(:safe_mode?) { should be_true }

  describe "undefined parameter" do
    it do
      expect { object.undefined }.to raise_error(Configatron::UndefinedParameterError)
    end
  end

end

describe Configatron::Store, "after unsafe!" do

  let!(:object) { Configatron::Store.new }

  before do
    object.aaa = "aaa"
    object.bbb.aaa = "bbb.aaa"
    object.safe!

    object.unsafe!
  end

  subject { object }

  its(:aaa) { should be_eql "aaa" }
  its(:safe_mode?) { should be_false }
  its(:undefined_parameter) { should be_an_instance_of Configatron::Store }

end

describe Configatron::Store, "with Temporary Configurations" do

  let(:object) { Configatron::Store.new }

  before do
    object.one = 1
    object.letters.a = 'A'
    object.letters.b = 'B'

    object.temp do
      object.letters.b = 'bb'
      object.letters.c = 'c'
    end
  end

  subject { object }

  its(:one) { should be_eql 1 }

  context :letters do

    subject { object.letters }

    its(:a) { should be_eql 'A' }
    its(:b) { should be_eql 'B' }

    its(:b) { should_not be_eql 'bb' }
    its(:c) { should_not be_eql 'c' }
    its(:c) { should be_an_instance_of Configatron::Store }
  end

end

