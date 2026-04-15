class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_darwin_arm64"
      sha256 "16940c790614a958592c03b57d8e621b0992ca8b9191c13c20f89016e76cc6d7"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_darwin_amd64"
      sha256 "7a8ed7b25c10121e6f2cee8a32eb92982bd2b4c328625462e94310ee09f731fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_linux_arm64"
      sha256 "31c75b92c6f9036c3d617e9180cf4a6eabc25a92d7d82c0904357e4878ab2177"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_linux_amd64"
      sha256 "b132ac77b631a33733cdfc68ee5b2b9c9546894caba8eaebea43f3fe402fb0c6"
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
