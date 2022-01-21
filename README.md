Gatekeeper One
Difficulty 5/10

Make it past the gatekeeper and register as an entrant to pass this level.

Things that might help:
Remember what you've learned from the Telephone and Token levels.
You can learn more about the special function gasleft(), in Solidity's documentation (see here and here).

# Solution

There is three gates to pass in order to pass the level.

## Gate 1

use another contract so that tx.origin != msg.sender

## Gate 2

Figure out the gas cost of running the function. To do that, we should use remix debugger and see how much gas it cost to run the function until the `require(gasleft() % 8191 == 0`

## Gate 3

In order to find the hash key we will use the byte masking method
1st require:
uint32 == unit16 => 0x11111111 == 0x1111. We will use the mask 0x0000FFFF
2nd require:
uint32 != uint64 => mask = 0xFFFFFFFF0000FFFF
3rd require:
`bytes8 key = bytes8(tx.origin) & mask`
