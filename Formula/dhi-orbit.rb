class DhiOrbit < Formula
  include Language::Python::Virtualenv

  desc "DHI Orbit: one local board for every Claude Code chat across your accounts"
  homepage "https://github.com/Dv04/dhi-orbit"
  url "https://github.com/Dv04/dhi-orbit/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "78d8442e711f6e84db7b68dd56ad411a2ae4340614e8c1b6c219dc87abbc4132"
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
