require 'formula'

class Openssh < Formula
  url 'ftp://ftp.lambdaserver.com/pub/OpenBSD/OpenSSH/portable/openssh-5.9p1.tar.gz'
  homepage 'http://www.openssh.com/'
  sha1 'ac4e0055421e9543f0af5da607a72cf5922dcc56'
  version '5.9p1'

  def options
    [['--with-hpn', 'Use high performance patches']]
  end

  def patches
    if ARGV.include? '--with-hpn'
      'http://www.psc.edu/networking/projects/hpn-ssh/openssh-5.9p1-hpn13v12.diff.gz'
    end
  end

  def install
    system "./configure", "--with-libedit", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
