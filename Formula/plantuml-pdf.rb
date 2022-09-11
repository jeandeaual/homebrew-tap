# Most of the code is from
# https://raw.githubusercontent.com/Homebrew/homebrew-core/master/Formula/plantuml.rb.
# Unfortunately, we can't write to Formula["plantuml"].libexec, so we have to
# create an separate formula also providing PlantUML.
class PlantumlPdf < Formula
  desc "Draw UML diagrams - PDF and JLaTeXMath support"
  homepage "https://plantuml.com/"
  url "https://downloads.sourceforge.net/project/plantuml/1.2022.7/plantuml.1.2022.7.jar"
  sha256 "e30d9c8bc68b285590f9ec00ce88870270eb83d86aadd167d2ee2717ec4cb787"
  license "GPL-3.0-or-later"
  version_scheme 1

  livecheck do
    url :stable
    regex(%r{url=.*?/plantuml[._-]v?(\d+(?:\.\d+)+)\.t}i)
  end

  depends_on "graphviz"
  depends_on "openjdk"

  conflicts_with "plantuml", because: "both packages provide the same executable"

  # https://plantuml.com/pdf
  resource "batik_fop" do
    url "http://beta.plantuml.net/batikAndFop.zip"
    sha256 "c1f328a9aacfd954c6cd90650cefd924baea358d6e27520de7ccf9b30a681877"
    version "1"
  end

  # https://plantuml.com/ascii-math
  resource "jlatexmath" do
    url "http://beta.plantuml.net/plantuml-jlatexmath.zip"
    sha256 "e041164c6dce5dec3377242a0664c1855d863094dd51c28880888f59820fc7e2"
    version "1.0.3"
  end

  def install
    jar = "plantuml.jar"

    libexec.install "plantuml.#{version}.jar" => jar

    (bin/"plantuml").write <<~EOS
      #!/bin/bash
      if [[ "$*" != *"-gui"* ]]; then
        VMARGS="-Djava.awt.headless=true"
      fi
      GRAPHVIZ_DOT="#{Formula["graphviz"].opt_bin}/dot" exec "#{Formula["openjdk"].opt_bin}/java" $VMARGS -jar #{libexec}/#{jar} "$@"
    EOS

    chmod 0755, bin/"plantuml"

    resource("batik_fop").stage do
      libexec.install "ant.jar",
        "avalon-framework-4.2.0.jar",
        "batik-all-1.7.jar",
        "commons-io-1.3.1.jar",
        "commons-logging-1.0.4.jar",
        "fop.jar",
        "xml-apis-ext-1.3.04.jar",
        "xmlgraphics-commons-1.4.jar"
    end

    resource("jlatexmath").stage do
      libexec.install "jlatexmath-minimal-1.0.3.jar",
        "jlm_cyrillic.jar",
        "jlm_greek.jar"
    end
  end

  test do
    system bin/"plantuml", "-testdot"
  end
end
