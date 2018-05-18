'use strict'
module.exports = {
    networks: {
        development: {
            host: 'localhost',
            port: 8545,
            network_id: '*' // Match any network id
        },
        rinkeby: {
            host: "localhost",
            port: 8545,
            network_id: 4,
            from: "0x99B442C8b06Aa046A38B1b3bCc99B00C654de8A0",
            gas: 4612388
        },
    }
};
