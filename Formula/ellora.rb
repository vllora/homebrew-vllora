class Ellora < Formula
    desc "Ellora - Multi-provider AI gateway server"
    homepage "https://github.com/langdb/ellora"
    version "0.4.0-prerelease-3"  # Update this with your version

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-4/ai-gateway-macos-aarch64"
        sha256 "c3277a77bb2f85836929a889877df501397ac2577e74091b09e0d8356ba54089"  # Run: shasum -a 256 ai-gateway-aarch64  
      else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-4/ai-gateway-macos-x86_64"
        sha256 "9611fff61091d1eac52a11af613651d375d9a7347cb63c1701ac7dd51cfe57dd"  # Run: shasum -a 256 ai-gateway-x86_64
      end
    end

    on_linux do
    #   if Hardware::CPU.arm?
    #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
    #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
    #   else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-4/ai-gateway-linux-x86_64"
        sha256 "54b5ba413202a2a641156ffcd2076f262a719af74b93da20eed1a148c12ca32d"  # Run: shasum -a 256 ai-gateway-x86_64
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