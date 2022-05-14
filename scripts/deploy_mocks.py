from brownie import (
    MockV3Aggregator,
    network,
    config
)
from scripts.helpful_script import (
    getAccount,
)

DECIMALS = 8
# This is 2,000
INITIAL_VALUE = 200000000000


def deploy_mocks():
    if len(MockV3Aggregator) <= 0:
        """
        Use this script if you want to deploy mocks to a testnet
        """
        print(f"The active network is {network.show_active()}")
        print("Deploying Mocks...")
        account = getAccount()
        MockV3Aggregator.deploy(DECIMALS, INITIAL_VALUE, {"from": account}, publish_source=config["networks"][network.show_active()].get("verify", False))
        print("Mocks Deployed!")


def main():
    deploy_mocks()