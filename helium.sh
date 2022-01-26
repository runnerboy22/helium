#!/bin/zsh

balance=`helium-wallet balance | awk 'NR==4{print $4}'`

if (($balance > 10))
then
    json -I -f wallets.json -e "this.amount=$balance/2-.035"
    helium-wallet pay multi --commit wallets.json
    # helium-wallet pay one --commit 14DJK27rfozqZ5MAwH73ZRHyp9HtBpizc5HoCEEeqFqScPweWff 1
    fi