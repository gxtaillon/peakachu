module Paths_peakachu (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,3,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/gxt/.cabal/bin"
libdir     = "/home/gxt/.cabal/lib/x86_64-linux-ghc-7.6.3/peakachu-0.3.1"
datadir    = "/home/gxt/.cabal/share/x86_64-linux-ghc-7.6.3/peakachu-0.3.1"
libexecdir = "/home/gxt/.cabal/libexec"
sysconfdir = "/home/gxt/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "peakachu_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "peakachu_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "peakachu_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "peakachu_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "peakachu_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
