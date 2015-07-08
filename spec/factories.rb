FactoryGirl.define do
  factory(:user) do
    email('dolly@clone.com')
    password('blacksheep')
    password_confirmation('blacksheep')
  end
end
