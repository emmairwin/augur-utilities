# README for Email Hasher
Purpose: Making Augur data available safely for https://github.com/oss-aspen/8Knot development. 

The script `hash-augur-email.py` takes an encryption key parameter of your choosing and uses it to encrypt email addresses stored in four columns in Augur's `commits` table. There is no automated decryption mechanism, though doing so would be straightforward given the same key used for encyrption. 

**This is not designed for use on Augur databases where data is being continuously collected**, because Augur expects the unencrypted email. 

A future Augur feature could handle encrpytion and decryption efficiently but is not yet on the road map. 