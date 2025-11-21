class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.9"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.9/vllora-macos-aarch64"
      sha256 "70ea42d9c41de9649634c240780632e703ba0fdebd519657fb251f414b1916a2"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.9/vllora-macos-x86_64"
      sha256 "3aedb79782d8ded04d1d1ef4779fc1a83fd9114613b39a659e793fa621b17a8b"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.9/vllora-linux-aarch64"
      sha256 "7f2e8cbfb6686cd3ed3767af0258cb6d05243315193f2eb943e07cba1ef12924"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.9/vllora-linux-x86_64"
      sha256 "9d1a37a8f6e68159e367f597d072861858dba8ed45ad85dd9b430f9e329baf0c"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "vllora"
      else
        bin.install "vllora-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "vllora"
      else
        bin.install "vllora-linux-x86_64" => "vllora"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/vllora", "--version"
  end
end
