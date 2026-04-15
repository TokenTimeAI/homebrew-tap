class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_darwin_arm64"
      sha256 "ea5831a92ced7d851f042d4d5c8bec3cded7c7cf3bf0d2f62133b11c4c0e22e8"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_darwin_amd64"
      sha256 "d43eb6207cfc6d77ba6f58617b93034a5c9f9d9d0d5cb258b864c012c667a0b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_linux_arm64"
      sha256 "d95308198b64233b938aa11dcba7c8b422ee0439074ee4eb75ee45be20d10cde"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_linux_amd64"
      sha256 "282981260308c2acdc1b0aac93cfe043d39baf3d9d6c29938f0bc30b008d2e8e"
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
