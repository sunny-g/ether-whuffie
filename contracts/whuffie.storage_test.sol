import "dapple/test.sol";
import "whuffie.storage.sol";

contract WhuffieStorageTest is Test {
  WhuffieStorage Graph;
  Tester proxy_tester;
  
  function setUp() {
    Graph = new WhuffieStorage();
    proxy_tester = new Tester();
    proxy_tester.target(Graph);
  }
}
