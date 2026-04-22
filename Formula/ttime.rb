class Ttime < Formula
  desc "Local heartbeat daemon client for ttime.ai"
  homepage "https://ttime.ai"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_arm64.zip"
      sha256 "e3211abfd0a5cb44aaa4d8519eaf5ed9f3ef1aa20b3288f4f3fc2e0a33b948a0"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Darwin_x86_64.zip"
      sha256 "ed9ee8044a3238566b3a558a0ee524dae33c1874842a080bfe52b7d52a8e8422"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_arm64.tar.gz"
      sha256 "9477442ca642e78d14e2e10a7fefdbab3f51ad6cb5e2dae2190db87ab63f2bcd"
    end
    on_intel do
      url "https://github.com/TokenTimeAI/client/releases/download/v#{version}/ttime_Linux_x86_64.tar.gz"
      sha256 "09fa3ca9d33294d86330ec8c0330c91beb4d7e0334bc2f9737d241a8e00f46bd"
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
