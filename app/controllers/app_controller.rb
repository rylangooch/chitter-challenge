class ChitterChallenge < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, 'static') }
end
