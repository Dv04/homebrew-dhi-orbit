class DhiOrbit < Formula
  include Language::Python::Virtualenv

  desc "DHI Orbit: one local board for every Claude Code chat across your accounts"
  homepage "https://github.com/Dv04/dhi-orbit"
  url "https://github.com/Dv04/dhi-orbit/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b5f5e2efdfb1478ed87c9fa479daf6f938344c7dfc8a31b2c97905ed8e163a28"
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
