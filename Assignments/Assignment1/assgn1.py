import hashlib
import time
ref = time.time()
s = "MedianOhm"  # anagram of Moin Ahmed :p
num = 0
res = ""
while(True) :
    num += 1
    num_str = str(num)
    res = s + num_str
    res_x = res.encode() # now acceptable by hash function  (in hexadecimal form)


    hash = hashlib.sha256(res_x) # hash function
    # maxx = "000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
    tmp = hash.hexdigest() # Returns the encoded data in hexadecimal format
    hash_x = str(tmp) # Converting the hexadecimal into string
    flg = True


    for i in range(5) : #check for '0' in the first 5 positions
        if(hash_x[i] != '0') :
            flg = False


    if(flg == True) : 
        print(f'time : {time.time()-ref}')
        print(f'res : {res}')
        # print(f'final string = "{res_x}"')
        print(f'hash of res_x {hash_x}')
        break