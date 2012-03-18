require 'formula'

class Openssl < Formula
  homepage 'http://www.openssl.org'
  url 'http://www.openssl.org/source/openssl-1.0.1.tar.gz'
  sha1 'a6476d33fd38c2e7dfb438d1e3be178cc242c907'

  keg_only :provided_by_osx,
    "The OpenSSL provided by Leopard (0.9.7) is too old for some software."

  def options
    [['--64-bit', 'Build for the x86_64 architecture.']]
  end

  def install
    args = %W[./Configure
              --prefix=#{prefix}
              --openssldir=#{etc}/openssl
              zlib-dynamic
              shared]

    args << if ARGV.include? '--64-bit'
      'darwin64-x86_64-cc'
    else
      'darwin-i386-cc'
    end

    system "perl", *args
    ENV.deparallelize # Parallel compilation fails
    system "make"
    system "make test"
    system "make", "MANDIR=#{man}", "MANSUFFIX=ssl", "install"
  end
end
