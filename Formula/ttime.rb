class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_arm64.tar.gz"
      sha256 "b66dcf3ce60cc556add6dd18de620c3126abf67326431eb5ef02d73a81ad61f8"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_x86_64.tar.gz"
      sha256 "1db1e537652e142bdf72f8170a6c9b02d66926dcfcb92a04fa6dcba8fabfa1a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_arm64.tar.gz"
      sha256 "c56283992923fa79876c0fd1fefc520d3448adb6c52cc866348d842dcef9e3f6"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_x86_64.tar.gz"
      sha256 "331099a5781e0711a74d8dfbfd4448bfd5bd41846e470f23afb374755faec1c0"
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
