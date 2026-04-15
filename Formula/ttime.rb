class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_darwin_arm64"
      sha256 "76530c2f4b7dccd8aab31076f180b403a5ae547fbadf687ea2656169cb05a62b"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_darwin_amd64"
      sha256 "600b9985d3a528a4706e95e645232f0797dc505ab8b56a057e61e9d947e9663b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_linux_arm64"
      sha256 "06ed5ec99d8b2ed86a8a45717be99b5b0774b58c427fe072199a5aff682f8874"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_linux_amd64"
      sha256 "cc8c51470c7ace076b21ab47e5b3778b06ab2b3172b1c7773e75bf546f397292"
    end
  end

  def install
    bin.install Dir.glob("ttime_*").first => "ttime"
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
