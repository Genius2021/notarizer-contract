from brownie import accounts, config, network

LOCAL_BLOCKCHAIN_ENVIRONMENT = ["development", "ganache-local"]

def getAccount():
    if network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENT:
        account = accounts[0]
    else:
        account = accounts.add(config["wallets"]["from_account"])
    return account


def main():
    getAccount()