$: << 'cf_spec'
require "spec_helper"

describe 'deploying a go app', :go_buildpack do
  it "makes the homepage available" do
    Machete.deploy_app("go_app", :go) do |app|
      expect(app).to be_staged
      expect(app.homepage_html).to include "go, world"
    end
  end

  it 'deploys the heroku hello world' do
    Machete.deploy_app("go_heroku_example", :go) do |app|
      expect(app).to be_staged
      expect(app.homepage_html).to include "hello, heroku"
    end
  end

  it 'deploys the app with dependencies' do
    Machete.deploy_app("go_app_with_dependencies", :go) do |app|
      expect(app).to be_staged
      expect(app.logs).to include "Hello from foo!"
      expect(app.homepage_html).to include "hello, world"
    end
  end
end