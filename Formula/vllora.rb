class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.15"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15/vllora-macos-aarch64"
      sha256 "b3f3b57756c6b3758c815a10da740e37e91ff971a7b5e2a5d4690cd684bfe82e"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15/vllora-macos-x86_64"
      sha256 "8bf6203ad4ea2ef44979ec8520f9fd746903baf92e3a420ba2931599fb6a0cf6"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15/vllora-linux-aarch64"
      sha256 "5eb258250c54ea1b5d65e9c643db4bad1c67365d58624cc3f64098abaf47c0a5"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15/vllora-linux-x86_64"
      sha256 "897cc35447084722f023c8f31f832d3358889b7907bd5f037389d7082d020129"  # Run: shasum -a 256 ai-gateway-x86_64
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
