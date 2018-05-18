pragma solidity ^0.4.20;


// Reliable tokens file hash maintained by BrahmaOS for wallet, etc.
// Tokens file hash can only be set by contract owner.
// Every token file hash has version.
contract ReliableTokens {

    // Tokens file hash with version.
    // (version, hash)
    mapping(uint => string) private fileHash;
    
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
    function setFileHash(uint v, string h) public onlyOwner {
        fileHash[v] = h;
    }

    // Return tokens file hash.
    function getFileHash(uint v) public view returns(string) {
        return fileHash[v];
    }
}
