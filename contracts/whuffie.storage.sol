import "graph.sol"

/* TODO:
 *    should only be called by WhuffieAPI
 *    should allow for updating WhuffieAPI address
 *    should be mortal
 *    should be stored in some kind of NameReg
 * 
 */
contract WhuffieStorage is named("WhuffieStorage") {
  
}

/**
 */
contract Whuffie {
  /**
   */
  using UserMap for UserMap.UserMap;
  UserMap.UserMap public Users;
  
  // get a user
    // var user = Users.findOrCreate(addr)
  // get an edge
    // var edge = user.findOrCreate(addr)

  /*************************************************/
  /**************** WHUFFIE METHODS ****************/
  /*************************************************/
  /**
   */
  // function changeLimit(address sourceAddr, address targetAddr, int delta) returns (bool success) {}
    // if edge doesnt exist
      // create a new one with intial values
      // also create the opposite one
      // return true
    // else
      // increase sender's limit
      // increase recipient's balance

  /**
   */
  // function getBalance(address sourceAddr, address targetAddr) constant returns (int balance) {}
}