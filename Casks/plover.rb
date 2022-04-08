cask "plover" do
  version "4.0.0.dev10"
  sha256 "a19c59ec874569e6f5a765d15627bcf439664148859360a805305d985baaf193"

  url "https://github.com/openstenoproject/plover/releases/download/v#{version}/plover-#{version}-macosx_10_13_x86_64.dmg",
      verified: "github.com/openstenoproject/plover/"
  name "Plover"
  desc "Stenotype engine"
  homepage "https://www.openstenoproject.org/plover/"

  app "Plover.app"

  zap trash: "~/Library/Application Support/plover/"
end