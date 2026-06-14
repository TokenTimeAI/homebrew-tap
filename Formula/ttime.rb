class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_arm64.tar.gz"
      sha256 "4baceafdda2694fe342b1f866a4362f5b425dbbc016b52170815e73265737c39"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_x86_64.tar.gz"
      sha256 "6c503a13ffdc0162eb4ee0c0efe61df950de758978a712ac4632e1bbe9f4bcb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_arm64.tar.gz"
      sha256 "a11772d169d29e6a7717bf2ca9dfb1c8164ce2215660427b8eb4429a54a1610b"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_x86_64.tar.gz"
      sha256 "ab2883b02b70164bf6c9416656e9503977a02fd47fc92ada7f681ff51bc72505"
    end
  end

  def install
    bin.install "ttime"
  end

  service do
    run [opt_bin/"ttime", "daemon"]
    keep_alive true
    working_dir var
  end

  test do
    system "#{bin}/ttime", "help"
  end
end
