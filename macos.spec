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
print(a.binaries)
a.binaries = a.binaries - TOC([
 ('/usr/local/lib/libsodium.so', None, None),])
print(a.binaries)

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