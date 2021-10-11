pragma solidity ^0.5.0;

library SafeMath {

    function add(uint a, uint b) internal pure returns (uint) {
        require(a + b >= a);
        return a + b;
    }

    function sub(uint a, uint b) internal pure returns (uint) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }

    function mul(uint a, uint b) internal pure returns (uint) {
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b);
        return c;
    }

    function div(uint a, uint b) internal pure returns (uint) {
        require(b > 0);
        uint c = a / b;
        //require(a == b * c + a % b)
        return c;
    }

    function mod(uint a, uint b) internal pure returns (uint) {
        require(b != 0);
        return a % b;
    }
}
