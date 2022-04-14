cask "font-linja-pona" do
  version "4.9"
  sha256 :no_check

  url "https://drive.google.com/uc?export=download&id=1ukFvjXku_0Sdqq3u4oHlPLhTlR2J9b3I",
      verified: "drive.google.com"
  name "linja pona"
  desc "OpenType font for the sitelen pona script of the toki pona language"
  homepage "http://musilili.net/linja-pona/"

  font "linja-pona-#{version}.otf"
end
