# -*- mode: python -*-

block_cipher = None

a = Analysis(['reproducing_nacl.py'],
             pathex=['/Users/travis/build/Insoleet/pyinstaller-error'],
             binaries=None,
             datas=None,
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)

a.binaries = a.binaries - TOC([
 ('libsodium.so', None, None),])

a.binaries = a.binaries + TOC([
('libsodium.dylib',
os.path.join(get_homebrew_path( formula='libsodium' ), '1.0.8', 'lib, 'libsodium.dylib'),
 'BINARY'),])

pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)

exe = EXE(pyz,
          a.scripts,
          exclude_binaries=True,
          name='reproducing_nacl',
          debug=False,
          strip=False,
          upx=True,
          console=True )

coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=True,
               name='reproducing_nacl')