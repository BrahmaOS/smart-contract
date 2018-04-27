pragma solidity ^0.4.20;


// Reliable tokens maintained by BrahmaOS for wallet, etc.
// Token can only be added, removed by contract owner.
contract ReliableTokens {

    struct Token {
        // Token address
        address addr;

        // Token code, eg: BRM
        string  code;

        // Token name, eg: BrahmaOS
        string  name;
    }
    
    // Some methods can only call by contract owner.
    address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // Token information with token code or address.
    mapping(string => Token) private codeTokens;
    mapping(address => Token) private addrTokens;

    // Initialize some high quality tokens.
    function ReliableTokens() public {
        owner = msg.sender;
        Token memory brmToken = Token(0xD7732e3783b0047aa251928960063f863AD022D8, "BRM", "BrahmaOS");
        codeTokens[brmToken.code] = brmToken;
        addrTokens[brmToken.addr] = brmToken;

        Token memory eosToken = Token(0x86Fa049857E0209aa7D9e616F7eb3b3B78ECfdb0, "EOS", "EOS");
        codeTokens[eosToken.code] = eosToken;
        addrTokens[eosToken.addr] = eosToken;
    }

    // Add reliable token information only by contract owner,
    // update token information if exists.
    // 
    // Return: true if add success, else false.
    function addToken(address addr, string code, string name) public onlyOwner {
        Token memory t = Token(addr, code, name);
        codeTokens[t.code] = t;
        addrTokens[t.addr] = t;
    }

    // Remove token only by token address, and only by contract owner.
    // 
    // Return: true if message.sender is owner, else false.
    function removeToken(address addr) public onlyOwner {
        delete codeTokens[addrTokens[addr].code];
        delete addrTokens[addr];
    }

    // Get token information by code, eg: BRM
    // 
    // Return: (address, name)
    function getTokenByCode(string code) public view returns(address, string) {
        if (codeTokens[code].addr == 0) {
            return (0, "");
        }
        return (codeTokens[code].addr, codeTokens[code].name);
    }

    // Get token information by token address.
    // 
    // Return: (code, name)
    function getTokenByAddr(address addr) public view returns(string, string) {
        if (addrTokens[addr].addr == 0) {
            return ("", "");
        }
        return (addrTokens[addr].code, addrTokens[addr].name);
    }
}
