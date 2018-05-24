pragma solidity ^0.4.20;


// Reliable tokens file hash maintained by BrahmaOS for wallet, etc.
// Tokens file hash can only be set by contract owner.
// Every token file hash has version.
contract ReliableTokens {

    // Tokens file hash with version.
    // (version, hash)
    mapping(uint32 => string) private fileHash;

    // Save latest version number.
    uint32 private latestVersion;
    
    // Some methods can only call by contract owner.
    address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // Initialize some high quality tokens.
    function ReliableTokens() public {
        owner = msg.sender;
    }

    // Set tokens file hash only by owner.
    function setFileHash(uint32 v, string h) public onlyOwner {
        fileHash[v] = h;
        if (v > latestVersion) {
            latestVersion = v;
        }
    }

    // Return tokens file hash.
    function getFileHash(uint32 v) public view returns(string) {
        return fileHash[v];
    }

    // Return latest version number.
    function getLatestVersion() public view returns(uint32) {
        return latestVersion;
    }

    // Return latest tokens file hash.
    function getLatestFileHash() public view returns(string) {
        return fileHash[latestVersion];
    }
}
