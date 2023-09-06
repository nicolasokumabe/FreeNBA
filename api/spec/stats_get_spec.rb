require_relative "routes/chave"

describe "Get All Stats" do
  context "obtendo status com a chave" do
    before(:all) do
      sleep 2.4
      @result = Chave.new.id_ok_key("stats", "")
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end
  end

  context "obtendo status sem a chave" do
    before(:all) do
      sleep 2.4
      @result = Chave.new.id_no_key("stats", "")
    end

    it "valida status code" do
      expect(@result.code).to eql 401
    end

    it "valida chave API" do
      expect(@result.parsed_response["message"]).to eql "Invalid API key. Go to https://docs.rapidapi.com/docs/keys for more info."
    end
  end
end
