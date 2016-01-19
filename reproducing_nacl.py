import libnacl.sign
import sys
import base58

def _ensure_bytes(data):
    if isinstance(data, str):
        return bytes(data, 'utf-8')

    return data

if __name__ == '__main__':
    signer = libnacl.sign.Signer(b':\xcf\x9f\xc0\xd2\x9br\xf3\xa4\x18P-\x83\xd2\x83\xc9_\xf1\x04\xb8\xf7\x8c\x03\x94\x82e\xd2$\x047\r\x17')
    print(base58.b58encode(signer.vk))
    sys.exit()