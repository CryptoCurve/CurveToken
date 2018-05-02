pragma solidity ^0.4.11;
import "../zeppelin/contracts/token/MintableToken.sol";
import "../zeppelin/contracts/token/BurnableToken.sol";
import "../zeppelin/contracts/token/PausableToken.sol";
import "../zeppelin/contracts/math/SafeMath.sol";
import "./NotifyContract.sol";
import "./CrossChainToken.sol";

/**
 * @title OriginToken
 * Requirements: Token should be able to interact with third party contracts
 *               Token should be stakeable
 *               Token should allow for cross chain transfer without keeping an ever increasing supply
 *               Staked tokens should allow for voting
 *
 */
contract OriginToken is MintableToken, BurnableToken, PausableToken, CrossChainToken {

    string public constant name = "Origin";
    string public constant symbol = "ORI";
    uint8 public constant decimals = 18;
    
    // Lightweight implementation of ERC820 for basic third party contract interaction
    function transferAndNotify(address _to, uint256 _amount, bytes _data) public returns (bool) {
        require(super.transfer(_to, _value))
        require(NotifyContract(_to).notify(msg.sender, _amount, _data));
    }
}