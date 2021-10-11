pragma solidity ^0.5.0;

import "./SafeMath.sol";
import "./IBEP20.sol";
import "./Ownable.sol";
import "./BEP20Token.sol";
import "./BEP20Detailed.sol";
import "./BlackListableToken.sol";


contract Cikou is BEP20Token, BEP20Detailed, BlackListableToken {

    string public constant TokenName = "Cikou";
    string public constant TokenSymbol = "CKU";
    uint8 public constant TokenDecimals = 18;

    constructor () public BEP20Detailed(TokenName, TokenSymbol, TokenDecimals) {
        _mint(msg.sender, 100000000000 * (10 ** uint256(decimals())));
    }
}
