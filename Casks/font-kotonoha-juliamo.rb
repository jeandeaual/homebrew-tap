cask "font-kotonoha-juliamo" do
  version :latest
  sha256 :no_check

  url "http://uw1.gyutto.jp/sozai/kotonoha_juliamofont.zip",
      verified: "uw1.gyutto.jp"
  name "Juliamo Font"
  desc 'Juliamo font from the game "The Expression Amrilato" (Kotonoha Amrilato)'
  homepage "http://sukerasparo.com/amrilato/sp004/font.html"

  depends_on formula: "unar"
  container type: :generic_unar

  font "kotonoha_juliamofont/juliamo-print.ttf"

  caveats do
    license "http://sukerasparo.com/amrilato/sp004/font.html"
  end
end
