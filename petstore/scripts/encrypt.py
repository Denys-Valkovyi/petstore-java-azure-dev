from base64 import b64encode
from nacl import encoding, public
import sys

key=sys.argv[1]
text=sys.argv[2]

def encrypt(public_key: str, secret_value: str) -> str:
  public_key = public.PublicKey(public_key.encode("utf-8"), encoding.Base64Encoder())
  sealed_box = public.SealedBox(public_key)
  encrypted = sealed_box.encrypt(secret_value.encode("utf-8"))
  return b64encode(encrypted).decode("utf-8")

sealed = encrypt(key, text)
print(sealed)