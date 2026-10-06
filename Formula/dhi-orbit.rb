class DhiOrbit < Formula
  include Language::Python::Virtualenv

  desc "DHI Orbit: one local board for every Claude Code chat across your accounts"
  homepage "https://github.com/Dv04/dhi-orbit"
  url "https://github.com/Dv04/dhi-orbit/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "a145805d7d33104d6b193129ce34825758d8979964c9c89ec9fa84062f008077"
  license "MIT"

  depends_on "python-setuptools" => :build
  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Start it with:
        dhi-orbit
      then open http://127.0.0.1:8787/v2/ and connect your Claude accounts in Settings > Accounts.
      Requires Claude Code (`claude`) on your PATH.
    EOS
  end

  test do
    assert_match "usage: dhi-orbit", shell_output("#{bin}/dhi-orbit --help")
  end
end
