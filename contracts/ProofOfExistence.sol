// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.10.0;

contract ProofOfExistence {

    mapping(bytes32 => bool) private isNotarized;
    mapping(bytes32 => address) private documentToOwner;
    mapping(bytes32 => DocumentDetails) private hashToDetails;

    struct DocumentDetails {
        string organisation;
        string yearIssued;
        string expiryDate;
        uint64 ownershipStake;
    }

    // store a proof of existence in the contract state
    function storeDocument(bytes32 _hashProof, address _sender) private {
        isNotarized[_hashProof] = true;
        documentToOwner[_hashProof] = _sender;
    }

    // calculate and store the proof for a document
    function notarize(string memory _document, string memory _organisation, string memory _yearIssued, string memory _expiryDate, uint64 _ownershipStake) public payable{
        require(msg.value == 0.5 ether, "0.5 ether is required for this service");
        bytes32 docHash = hashProof(_document);
        storeDocument( docHash, msg.sender);
        hashToDetails[docHash] = DocumentDetails(_organisation, _yearIssued, _expiryDate, _ownershipStake);
    }

    // helper function to get a document's sha256
    function hashProof(string memory _document) private pure returns (bytes32) {
        return sha256(bytes(_document));
    }

    // check if a document has been notarized
    function checkDocumentExistence(bytes32 _documentHash) public payable returns (bool) {
        require(msg.value == 0.05 ether, "0.05 ether is required for this service");
        require(msg.sender == documentToOwner[_documentHash]);
        return isNotarized[_documentHash];
    }

    // give more details about the document
    function documentDetails(bytes32 _doc) public payable returns (string memory, string memory, string memory, uint64) {
        require(msg.sender == documentToOwner[_doc]);
        require(msg.value == 0.1 ether, "0.1 ether is required for this transaction");
        DocumentDetails memory _d = hashToDetails[_doc];
        return (_d.organisation, _d.yearIssued, _d.expiryDate, _d.ownershipStake);
    }

}
