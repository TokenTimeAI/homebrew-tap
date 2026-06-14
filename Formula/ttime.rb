class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_arm64.tar.gz"
      sha256 "681fecbeac825b252f07acc27972a21b0ab8b8a8e56fc9911fca7ea36bc4ef6d"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_x86_64.tar.gz"
      sha256 "54eb3ba23d23beda7f8403b124be6b17c0cb3f9b394a39b1d000ad3564472969"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_arm64.tar.gz"
      sha256 "f0ff9c0e7f6ab6e0edc32423d1686783b5c44a7486f634b26df82921cce7cf2b"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_x86_64.tar.gz"
      sha256 "2b30232b990c711bf68c1fd505fd85e8418171a1e814e8900e6d1a1c7c7049c4"
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
