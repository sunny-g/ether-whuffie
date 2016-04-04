/**
 */
contract Whuffie {
  /**
   */
  struct Edge {
    bool exists;
    address sourceAddr;
    address targetAddr;
    int balance;
    uint limit;
  }

  /**
   */
  struct Node {
    bool exists;
    Edge[] edges;
    mapping (address => uint) edgeIndices;
  }

  /**
   */
  mapping (address => Node) private graph;

  /***********************************************/
  /**************** GRAPH METHODS ****************/
  /***********************************************/
  /**
   * @param New user's address
   * @return Whether user was added or not
   */
  function addUser(address userAddr) returns (bool) {
    if (containsUser(userAddr)) {
      return false;
    }
    Edge[] storage edges;
    graph[userAddr] = Node(false, edges);
    return true;
  }

  /**
   * @param Desired address
   * @return Whether user exists or not
   */
  function containsUser(address userAddr) constant returns (bool) {
    if (graph[userAddr].exists) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * @param Address of the first user
   * @param Address of the second user
   * @return Whether edge was created or not
   */
  function addEdge(address sourceAddr, address targetAddr) returns (bool) {
    if (containsEdge(sourceAddr, targetAddr)) {
      return false;
    }
    var source = graph[sourceAddr];
    source.edges[source.edgeIndices[targetAddr]] = Edge(true, sourceAddr, targetAddr, 0, 0);
    return true;
  }

  /**
   * @param Address of the first user
   * @param Address of the second user
   * @return Whether edge between two given users exists or not
   */
  function containsEdge(address sourceAddr, address targetAddr) constant returns (bool) {
    if (!(containsUser(sourceAddr) && containsUser(targetAddr))) {
      return false;
    }

    var source = graph[sourceAddr];
    // TODO: does this throw if the lookup fails?
    var edge = source.edges[source.edgeIndices[targetAddr]];

    if (edge.exists) {
      return false;
    } else {
      return true;
    }
  }

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