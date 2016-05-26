import "std.sol";

/* TODO:
 *    should only be called by WhuffieAPI
 *    should allow for updating WhuffieAPI address
 *    should be mortal
 *    should be stored in some kind of NameReg
 *
 *    should be IMMUTABLE (i.e. non-updateable, since that would require a state migration)
 *      this means that all methods and state mutations will be set
 *      in stone for the life of the contract
 */

/** 
 * @title WhuffieStorage
 * @author Sunny Gonnabathula @sunny-g
 * @notice 
 * @dev
 */
contract WhuffieStorage is named("WhuffieStorage") {
  /********************************************************//**
   * @struct Ledger
   * @notice An open ledger tracking the exchange of the source's and target's credits
   ***********************************************************/
  struct Ledger {
    bool exists;                /**< whether or not the Ledger exists */
    address prev;               /**< pointer to previous Ledger of linked-list */
    address next;               /**< pointer to next Ledger of linked-list */
    
    address targetAddr;         /**< address of Ledger target */
    uint limit;                 /**< maximum target credit to hold */
    uint[2] exchangeRate;       /**< exchange rate between target's and source's credit */
    uint sourceBalance;         /**< balance of source's credit */
    uint targetBalance;         /**< balance of target's credit */
    uint lockedSourceBalance;   /**< immovable balance of source's credit */
    uint lockedTargetBalance;   /**< immovable balance of target's credit */
  }
  
  // public Ledger getters and setters
  
  /** 
   * @notice
   * @dev
   * @param
   * @return
   */
  function getLimit(
    address source,
    address target
  ) public constant returns (uint limit) {}
  function setLimit(
    address source,
    address target,
    uint amount
  ) public returns (bool success) {}
  
  function getSourceBalance(
    address source,
    address target
  ) public constant returns (uint balance) {}
  function setSourceBalance(
    address source,
    address target,
    uint amount
  ) public returns (bool success) {}
  
  function getTargetBalance(
    address source,
    address target
  ) public constant returns (uint balance) {}
  function setTargetBalance(
    address source,
    address target,
    uint amount
  ) public returns (bool success) {}
  
  function getExchangeRate(
    address source,
    address target
  ) public constant returns (uint[2] exchangeRate) {}
  function setExchangeRate(
    address source,
    address target,
    uint[2] rate
  ) public returns (bool success) {}
  
  function getLockedSourceBalance(
    address source,
    address target
  ) public constant returns (uint lockedBalance) {}
  function setLockedSourceBalance(
    address source,
    address target,
    uint newLockedBalance
  ) public returns (bool success) {}
  
  function getLockedTargetBalance(
    address source,
    address target
  ) public constant returns (uint lockedBalance) {}
  function setLockedTargetBalance(
    address source,
    address target,
    uint newLockedBalance
  ) public returns (bool success) {}
  
  /********************************************************//**
   * @struct LedgerMap
   * @notice A doubly-linked list containing all of a User's open Ledgers,
   *  sorted by ???
   * @dev O(1) get, add, remove, swap
   ***********************************************************/
  struct LedgerMap {
    uint size;            /**< length of the linked-list */
    address head;         /**< pointer to the first Ledger of linked-list */
    address tail;         /**< pointer to the last Ledger of linked-list */
    mapping (
      address => Ledger   /**< hashmap of Ledgers by target address */
    ) ledgers;
  }
  
  // internal helpers
  function _getLedger(
    LedgerMap storage self,
    address addr
  ) internal constant returns (Ledger) {}
  
  // public LedgerMap getters and setters
  function getLedger(
    address source,
    address target
  ) public constant returns () {}
  function ledgerExists(
    address source,
    address target
  ) public constant returns (bool exists) {}
  function createLedger(
    address source,
    address target
  ) public returns () {}
  
  // public iterators
    // TODO: add remaining linked list iterators
  function iter_getLedgerMapLength(
    address source,
    address target
  ) public constant returns () {}
  function iter_getLedgerByIndex(
    address source,
    address target,
    uint index
  ) public constant returns () {}
  
  /********************************************************//**
   * @struct User
   * @notice A Whuffie-holding account
   ***********************************************************/
  struct User {
    bool exists;          /**< whether or not the User exists */
    address sourceAddr;   /**< the User's address */
    bytes metadata;       /**< metadata regarding the User's last transaction */
    LedgerMap ledgers;    /**< a collection of the User's open ledgers */
  }
  
  // internal helpers
  function _getLedgerMap(
    address source
  ) internal constant returns (LedgerMap) {}
  
  // public User getters and setters
  function getMetadata(
    address addr
  ) public constant returns (bytes metadata) {}
  function setMetadata(
    address addr,
    bytes metadata
  ) public returns (bool success) {}
  
  /********************************************************//**
   * @struct UserMap
   * @notice A doubly-linked list containing all Whuffie Users and Ledgers
   ***********************************************************/
  struct UserMap {
    uint size;            /**< length of the linked-list */
    address head;         /**< pointer to the first User of linked-list */
    address tail;         /**< pointer to the last User of linked-list */
    mapping (
      address => User     /**< hashmap of Users by their address */
    ) users;
  }
  
  // internal helpers
  function _getUser(
    UserMap storage self,
    address addr
  ) internal constant returns (User) {}
  
  // public UserMap getters and setters
  function getUser(
    address addr
  ) public constant returns () {}
  function userExists(
    address addr
  ) public constant returns (bool exists) {}
  function createUser(
    address addr,
  ) public returns () {}
  
  // public iterators
    // TODO: add remaining linked list iterators
  function iter_getUserMapLength() public constant returns () {}
  function iter_getUserByIndex(uint index) public constant returns () {}
  
  ////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
  UserMap public Graph;
  
  // everytime a new API contract is deployed, it should be added to this list
  mapping (address => bool) APIAccess;
  
  // get a user
    // var user = Users.get(addr)
  // get an edge
    // var edge = Users.get(sourceAddr).edges.get(targetAddr)

  function WhuffieStorage () {
    // set the initial API address for use in modifier
  }
  
  modifier isAPI() {}
}
