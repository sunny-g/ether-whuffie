/* Whuffie Graph libraries
 */
library Edge {
  struct Edge {
    address targetAddr;
    uint balance;
    uint maxBalance;
    uint limit;
    uint exchangeRate;
    uint lockedBalance;
    uint fee;
  }
  
  // TODO: can these all return instances of Edge? would that take too much memory?
  function increaseBalance(Edge storage self, uint amount) returns (uint newBalance) {}
  function decreaseBalance(Edge storage self, uint amount) returns (uint newBalance) {}
  
  function increaseMaxBalance(Edge storage self, uint amount) returns (uint newMaxBalance) {}
  function decreaseMaxBalance(Edge storage self, uint amount) returns (uint newMaxBalance) {}
  
  function increaseLimit(Edge storage self, uint amount) returns (uint newLimit) {}
  function decreaseLimit(Edge storage self, uint amount) returns (uint newLimit) {}
  
  function increaseLimit(Edge storage self, uint rate) returns (uint newRate) {}
  function decreaseLimit(Edge storage self, uint rate) returns (uint newRate) {}
  
  function increaseLockedBalance(Edge storage self, uint amount) returns (uint newLockedBalance) {}
  function decreaseLockedBalance(Edge storage self, uint amount) returns (uint newLockedBalance) {}
  
  function setFee(Edge storage self, uint fee) returns (bool success) {}
  function increaseFee(Edge storage self, uint fee) returns (bool success) {}
  function decreaseFee(Edge storage self, uint fee) returns (bool success) {}
}

// iterable mapping of Edges
library EdgeMap {
  using Edge for Edge.Edge;
  struct EdgeMap {
    mapping (address => uint) indices;
    Edge.Edge[] edges;
  }

  /**
   * @param address
   * @return Edge.Edge
   */
  function get(EdgeMap storage self, address addr) returns (Edge.Edge) {}
  function getOrCreate(EdgeMap storage self, address addr) returns (Edge.Edge) {}
  function exists(EdgeMap storage self, address addr) returns (bool success) {
    if (self.edges[self.indices[addr]] == 0x0) {
      return false;
    }
    return true;
  }
}

library User {
  using EdgeMap for EdgeMap.EdgeMap;
  struct User {
    address sourceAddr;
    uint balance;
    uint lockedBalance
    EdgeMap.EdgeMap edges;
  }

  function increaseBalance(User storage self, uint amount) returns (uint newBalance) {}
  function decreaseBalance(User storage self, uint amount) returns (uint newBalance) {}
  
  function increaseLockedBalance(User storage self, uint amount) returns (uint newLockedBalance) {}
  function decreaseLockedBalance(User storage self, uint amount) returns (uint newLockedBalance) {}
}

// iterable mapping of Users, aka a Graph
library UserMap {
  using User for User.User;
  struct UserMap {
    mapping (address => uint) indices;
    User.User[] Users;
  }

  /**
   * @param address
   * @return User.User
   */
  function get(UserMap storage self, address addr) returns (User.User) {}
  function getOrCreate(UserMap storage self, address addr) returns (User.User) {}
  function exists(UserMap storage self, address addr) returns (bool success) {
    if (self.Users[self.indices[addr]] == 0x0) {
      return false;
    }
    return true;
  }
}

