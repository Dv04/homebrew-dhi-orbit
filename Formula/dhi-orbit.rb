class DhiOrbit < Formula
  include Language::Python::Virtualenv

  desc "DHI Orbit: one local board for every Claude Code chat across your accounts"
  homepage "https://github.com/Dv04/dhi-orbit"
  url "https://github.com/Dv04/dhi-orbit/archive/refs/tags/v0.3.10.tar.gz"
  sha256 "9212161e5866d4da30fa6346a5bb0cf8d485e3c1292919a40c13a13cc547d326"
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
      then open http://127.0.0.1:8787/ and connect your Claude accounts in Settings > Accounts.
      Found a bug or have an idea? Settings > Report a bug or send feedback opens a prefilled GitHub issue.
      Requires Claude Code (`claude`) on your PATH.
    EOS
  end

  test do
    assert_match "usage: dhi-orbit", shell_output("#{bin}/dhi-orbit --help")
  end
end
