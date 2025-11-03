class {{CLASS_NAME}} < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "{{VERSION}}"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v{{VERSION}}/vllora-macos-aarch64"
      sha256 "{{MAC_ARM_SHA}}"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v{{VERSION}}/vllora-macos-x86_64"
      sha256 "{{MAC_X64_SHA}}"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v{{VERSION}}/vllora-linux-aarch64"
      sha256 "{{LINUX_ARM_SHA}}"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v{{VERSION}}/vllora-linux-x86_64"
      sha256 "{{LINUX_X64_SHA}}"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "{{BIN_NAME}}"
      else
        bin.install "vllora-macos-x86_64" => "{{BIN_NAME}}"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "{{BIN_NAME}}"
      else
        bin.install "vllora-linux-x86_64" => "{{BIN_NAME}}"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/{{BIN_NAME}}", "--version"
  end
end
