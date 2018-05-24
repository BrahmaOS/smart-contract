pragma solidity ^0.4.20;


// Manage latest version information file hash of all applications in BrahmaOS, including:
//
// - Get latest application version information file hash.
// - Set application version information file hash, only by owner.
//
contract VersionManager {
    
    // Application version file hash.
    // app => (version, hash)
    mapping(uint => string) private appVerFileHash;

    // Some methods can only call by contract owner.
    address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function VersionManager() public {
        owner = msg.sender;
    }

    // Set application version file hash only by owner.
    function setAppVerFileHash(uint app, string h) public onlyOwner {
        appVerFileHash[app] = h;
    }

    // Get latest application version file hash.
    function getAppVerFileHash(uint app) public view returns(string) {
        return appVerFileHash[app];
    }
}
