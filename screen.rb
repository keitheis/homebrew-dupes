require 'formula'

class Screen < Formula
  homepage 'http://www.gnu.org/software/screen'
  url 'http://ftpmirror.gnu.org/screen/screen-4.0.3.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/screen/screen-4.0.3.tar.gz'
  md5 '8506fd205028a96c741e4037de6e3c42'
  version '4.00.03'

  head 'git://git.savannah.gnu.org/screen.git', :branch => 'master'

  def patches
    "http://trac.macports.org/raw-attachment/ticket/20862/screen-4.0.3-snowleopard.patch"
  end unless ARGV.build_head?

  def install
    if ARGV.build_head?
      cd 'src' do
        system "autoconf"
        system "autoheader"
      end
    end

    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--infodir=#{info}",
                          "--enable-colors256"
    system "make"
    system "make install"
  end
end
