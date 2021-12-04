#!/bin/zsh
# curl -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (K HTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36" https://api.helium.io/v1/vars
# curl --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (K HTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36" https://api.helium.io/v1/accounts/14Q1XrF6CM1yKmVkqqVHD2Naoi9ghZ9adXCxY4hdbMb42sFkzX2
#    https://api.helium.io/v1/accounts/14Q1XrF6CM1yKmVkqqVHD2Naoi9ghZ9adXCxY4hdbMb42sFkzX2
# https://api.helium.io/v1/blocks
# curl --user-agent "ReqBin/1.0" https://reqbin.com/echo"

balance=`helium-wallet balance | awk 'NR==4{print $4}'`

while true; do
if (($balance > 10))
then
    # timestamp=`date`
    json -I -f wallets.json -e "this.amount=$balance/2-.035"
    # or hardcore amount to = 5 and manually put in burn for 35000 DC = .35 cents of HNT?
    # json -I -f wallets.json -e "this.memo='$timestamp'"
    helium-wallet pay multi --commit wallets.json
    # helium-wallet pay one --commit 14DJK27rfozqZ5MAwH73ZRHyp9HtBpizc5HoCEEeqFqScPweWff 1
    fi
#sleep 864000
done

# final command: caffeinate ./helium.exp
