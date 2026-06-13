class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_arm64.tar.gz"
      sha256 "3773d6fc740c12fe5d305e3e5b37f970a2041507ae13261c68c275f7f6cda713"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_x86_64.tar.gz"
      sha256 "51bbd15ea90d9d0419bf2d780eea1d2c22194e00b62ea9575d8824844f2a239b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_arm64.tar.gz"
      sha256 "b6f6baf7ff0f03a3ffc43697f80dfd8e46db5bcfb51a091ee3b2dc7088d7a4dd"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_x86_64.tar.gz"
      sha256 "05d41f2551cd3ff4ffee8b997547c10d6260d60b3ba98f22f9366bfd6801e411"
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
