cask "font-linja-pi-tomo-lipu" do
  version "0.7"
  sha256 "127af61cb4e3e1ac82d56c9e45a1ef63b64ba3eab408488ceff97373f7783b1b"

  url "https://github.com/pguimier/linjapitomolipu/releases/download/v#{version}/linjapitomolipu.#{version}.ttf"
  name "linja pi tomo lipu"
  desc "Monotype font to write texts in Toki Pona hieroglyphs"
  homepage "https://github.com/pguimier/linjapitomolipu"

  font "linjapitomolipu.#{version}.ttf"
end
