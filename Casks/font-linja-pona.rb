cask "font-linja-pona" do
  version "4.9"
  sha256 "c107d32b86ff4be37e60b74af3750289ed8baae4d03b8e05844e394c4b9725cb"

  url "https://drive.google.com/uc?export=download&id=1ukFvjXku_0Sdqq3u4oHlPLhTlR2J9b3I"
  name "linja pona"
  desc "OpenType font for the sitelen pona script of the toki pona language"
  homepage "http://musilili.net/linja-pona/"

  font "linja-pona-#{version}.otf"
end
