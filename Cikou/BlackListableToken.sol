pragma solidity ^0.5.0;

import "./SafeMath.sol";
import "./IBEP20.sol";
import "./Ownable.sol";
import "./BEP20Token.sol";

contract BlackListableToken is Ownable, BEP20Token {

    /////// Getters to allow the same blacklist to be used also by other contracts (including upgraded Tether) ///////
    function getBlackListStatus(address _maker) external view returns (bool) {
        return isBlackListed[_maker];
    }

    mapping (address => bool) public isBlackListed;

    function addBlackList(address _evilUser) public onlyOwner {
        require(!isBlackListed[_evilUser], "_evilUser is already in black list");

        isBlackListed[_evilUser] = true;
        emit AddedBlackList(_evilUser);
    }

    function removeBlackList(address _clearedUser) public onlyOwner {
        require(isBlackListed[_clearedUser], "_clearedUser isn't in black list");

        isBlackListed[_clearedUser] = false;
        emit RemovedBlackList(_clearedUser);
    }

    function destroyBlackFunds(address _blackListedUser) public onlyOwner {
        require(_blackListedUser != address(0x0), "_blackListedUser is the zero address");
        require(isBlackListed[_blackListedUser], "_blackListedUser isn't in black list");

        uint256 dirtyFunds = balanceOf(_blackListedUser);
        super._burn(_blackListedUser, dirtyFunds);
        emit DestroyedBlackFunds(_blackListedUser, dirtyFunds);
    }

    event DestroyedBlackFunds(address indexed _blackListedUser, uint256 _balance);

    event AddedBlackList(address indexed _user);

    event RemovedBlackList(address indexed _user);

}
