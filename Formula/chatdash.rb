class Chatdash < Formula
  include Language::Python::Virtualenv

  desc "One local board for every Claude Code chat across your accounts"
  homepage "https://github.com/Dv04/chatdash"
  url "https://github.com/Dv04/chatdash/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0859798f48a2462d162ecbaad862d1d064b32e9d72b6f77ee578e300fed891c9"
  license "MIT"

  depends_on "python-setuptools" => :build
  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Start it with:
        chatdash
      then open http://127.0.0.1:8787/v2/ and connect your Claude accounts in Settings > Accounts.
      Requires Claude Code (`claude`) on your PATH.
    EOS
  end

  test do
    assert_match "usage: chatdash", shell_output("#{bin}/chatdash --help")
  end
end
