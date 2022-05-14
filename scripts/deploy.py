from brownie import ProofOfExistence, MockV3Aggregator, network, config
from scripts.helpful_script import getAccount, LOCAL_BLOCKCHAIN_ENVIRONMENT
# from scripts.deploy_mocks import deploy_mocks


def deploy_proof_of_existence():
    account = getAccount()
    # if network.show_active() not in LOCAL_BLOCKCHAIN_ENVIRONMENT:
    #     price_feed_address = config["networks"][network.show_active()]["eth_usd_price_feed"]
    # else:
        # deploy_mocks()
        # price_feed_address = MockV3Aggregator[-1].address
    ProofOfExistence.deploy({"from" : account}, publish_source=config["networks"][network.show_active()].get("verify", False))


def main():
    deploy_proof_of_existence()