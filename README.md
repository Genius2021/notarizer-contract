The Smart Contract does the following:
    • It allows users to pass in a string through the notarize() function
    so that the hash of the string can be stored on the blockchain using
    the proofs state variable (which is of type mapping, which is like as
    associative array).
    • It allows users to verify if a string was previously recorded in the
    blockchain by calling the checkDocument() function and checking if
    the hash of the string exists in the proofs state variable.
This Smart Contract acts as a simple notarizer in which a user can store a string
(e.g., containing an idea) on the blockchain and proving it later on that this idea was already invented earlier.