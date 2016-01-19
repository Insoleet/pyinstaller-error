import pylibscrypt
import sys


SEED_LENGTH = 32  # Length of the key
crypto_sign_BYTES = 64
SCRYPT_PARAMS = {'N': 4096,
                 'r': 16,
                 'p': 1
                 }


def _ensure_bytes(data):
    if isinstance(data, str):
        return bytes(data, 'utf-8')

    return data

if __name__ == '__main__':
    seed = pylibscrypt.scrypt(_ensure_bytes("pass"), _ensure_bytes("salt"),
                    SCRYPT_PARAMS['N'], SCRYPT_PARAMS['r'], SCRYPT_PARAMS['p'],
                    SEED_LENGTH)
    print(seed)
    sys.exit()