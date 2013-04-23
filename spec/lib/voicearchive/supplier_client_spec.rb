require 'spec_helper'
require 'webmock/rspec'
require 'voicearchive/supplier_client'
describe Voicearchive::SupplierClient do
  describe "Basics" do
    it "accepts api key as parameter to constructor" do
      supplier_client = Voicearchive::SupplierClient.new 'elsdfuhvh'
    end
    it "accepts zero parameters to constructor" do
      supplier_client = Voicearchive::SupplierClient.new
    end
    it "sets the api_key to a readable instance variable" do
      supplier_client = Voicearchive::SupplierClient.new '1234abcd'
      supplier_client.api_key.should eq '1234abcd'
    end
  end

  describe 'Supplier handling' do
    it "returns array of suppliers" do
      stub_request(:get, "system.voicearchive.com/rest/v1/supplier/?includeRelations=1").to_return(:body => File.read('spec/fixtures/lib/voicearchive/supplier/suppliers_with_relations.json') , :status => 200)

      supplier_client = Voicearchive::SupplierClient.new
      suppliers = supplier_client.get_suppliers
    end
  end
end
