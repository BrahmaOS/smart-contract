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
            gas: 4612388
        },
    }
};
