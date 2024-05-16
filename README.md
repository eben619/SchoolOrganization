
# SchoolOrganization
SchoolOrganization

This smart contract implements a basic school organization system on the blockchain. It allows for managing students,

 teachers, and their data in a secure and transparent manner.

Features:

    Student Management:
        Add, update, and remove student information (name, date of birth, height, age)
        Only the principal can modify student information.
    Teacher Management:
        Add and remove teachers by the principal.
    Score Recording:
        Teachers can update scores for their students.
        Scores are stored as a mapping between the teacher's address and the student's score.
    Attendance Tracking:
        Teachers can mark student attendance for their classes.
        Attendance is stored as a mapping between the teacher's address and a boolean value (true for attended).
    Data Access:
        Students can access their own score and attendance data for specific teachers.
        Teachers can access only the scores and attendance they recorded.

Requirements:

    Solidity compiler version ^0.8.0 (https://docs.soliditylang.org/en/v0.8.17/installing-solidity.html)
    A blockchain development environment (e.g., Remix, Truffle, Hardhat)

Deployment:

    Clone or download this repository.
    Connect your development environment to a blockchain network (e.g., local test network or public network like Ethereum).
    Compile and deploy the SchoolOrganization contract.
    Interact with the contract functions using your development environment's tools.

License:

MIT License
