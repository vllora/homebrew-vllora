class Ellora < Formula
    desc "Ellora - Multi-provider AI gateway server"
    homepage "https://github.com/langdb/ellora"
    version "0.4.0-prerelease-8"  # Update this with your version

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-8/ai-gateway-macos-aarch64"
        sha256 "b42c03cc42824ed79687ae6ad18f19b0d1c8ba440dcaa85eb201950353e92c5b"  # Run: shasum -a 256 ai-gateway-aarch64  
      else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-8/ai-gateway-macos-x86_64"
        sha256 "1bc52ce9de8a3dcac2f3b7ef99c282996039e7b37da28922d3955777582c07e0"  # Run: shasum -a 256 ai-gateway-x86_64
      end
    end

    on_linux do
    #   if Hardware::CPU.arm?
    #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
    #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
    #   else
    url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-8/ai-gateway-linux-x86_64"
    sha256 "05e02916f95cfc9f99618a8d15c8d06532252b27705ad3141daf54074830c25b"  # Run: shasum -a 256 ai-gateway-x86_64
    #   end
    end

    def install
      if OS.mac?
        if Hardware::CPU.arm?
          bin.install "ai-gateway-macos-aarch64" => "ellora"
        else
          bin.install "ai-gateway-macos-x86_64" => "ellora"
        end
      elsif OS.linux?
        bin.install "ai-gateway-linux-x86_64" => "ellora"
      end
    end

    def caveats
      <<~EOS
        After starting, server will be running on port http://localhost:8080 and UI can be accessed at http://localhost:8084
      EOS
    end

    test do
      system "#{bin}/ai-gateway", "--version"
    end
  end