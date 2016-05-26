import "std.sol";
import "whuffie.storage.sol";

/* TODO:
 *    should be stored in some kind of NameReg (for updatability)
 *    should be mortal
 *    should point to WhuffieStorage
 */

/**
 * @title WhuffieAPI
 * @author Sunny Gonnabathula @sunny-g
 */
contract WhuffieAPI is named("WhuffieAPI"), owned {
  
  // string public constant name = "WhuffieAPI";
  // WhuffieStorage public Graph;
  
  // TODO: there's a bug with setting a ledger up for a user by default
    // if one is set up for a user, they could be set an unfavorable exchange rate
    // fix:
      // allow directSend and directMaxFlow to work on one OR two ledgers fully
  
  // only creates one of the ledgers
  function create(
    address source,
    address target,
    uint limitAmount,
    uint[2] exchangeRate
  ) {}
  
  function destroy() {}
  
  function _directSend() internal {}
  
  function _directTrade(
    address sellAddr,
    address buyAddr,
    uint amount,
    uint maxAmount,
    uint[2] exchangeRate
  ) internal {}
}