
shared_examples_for "Configatron::Store" do

  it { should be_respond_to(:safe_mode?) }
  it { should be_respond_to(:safe!) }
  it { should be_respond_to(:unsafe!) }

end

