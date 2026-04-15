class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_darwin_arm64"
      sha256 "7916597faf849f43baa613ad5c8dc1d8e601c7830dffac8e23e318d3b1644a87"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_darwin_amd64"
      sha256 "f49cc008698df20ad29ecedfbf522b22077aff5a5e88b2611adaa474da35c281"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_linux_arm64"
      sha256 "6ede915e91bf6fb86163feb0de843ae57820e4c8c71e977df40aaa74d4400eb1"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_linux_amd64"
      sha256 "a69a297da40748b25e3e947ba7e094024994658cef5e342b2fd200b5b6f77204"
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
