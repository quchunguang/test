from Crypto.PublicKey import RSA
from Crypto import Random
import ast

random_generator = Random.new().read
key = RSA.generate(1024, random_generator)  # generate pub and priv key

publickey = key.publickey()  # pub key export for exchange

# encrypt
encrypted = publickey.encrypt('clear text message', 32)
print 'encrypted message:', encrypted  # ciphertext
f = open('encryption.txt', 'w')
f.write(str(encrypted))  # write ciphertext to file
f.close()

# decrypt
f = open('encryption.txt', 'r')
message = f.read()
f.close()
decrypted = key.decrypt(ast.literal_eval(message))
print 'decrypted message:', decrypted
