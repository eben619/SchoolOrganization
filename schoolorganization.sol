// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolOrganization {
    address public principal;
    
    struct Student {
        string name;
        uint256 dateOfBirth;
        uint256 height;
        uint256 age;
        mapping(address => uint256) scores;
        mapping(address => bool) attendance;
    }
    
    mapping(address => Student) public students;
    mapping(address => bool) public teachers;
    
    modifier onlyPrincipal() {
        require(msg.sender == principal, "Only the principal can perform this action");
        _;
    }
    
    modifier onlyStudent() {
        require(students[msg.sender].age != 0, "Only students can perform this action");
        _;
    }
    
    modifier onlyTeacher() {
        require(teachers[msg.sender], "Only teachers can perform this action");
        _;
    }
    
    constructor() {
        principal = msg.sender;
    }
    
    function addTeacher(address _teacher) public onlyPrincipal {
        teachers[_teacher] = true;
    }
    
    function removeTeacher(address _teacher) public onlyPrincipal {
        delete teachers[_teacher];
    }
    
    function updateStudentName(address _student, string memory _name) public onlyPrincipal {
        students[_student].name = _name;
    }
    
    function updateStudentDOB(address _student, uint256 _dob) public onlyPrincipal {
        students[_student].dateOfBirth = _dob;
    }
    
    function updateStudentHeight(address _student, uint256 _height) public onlyPrincipal {
        students[_student].height = _height;
    }
    
    function updateStudentAge(address _student, uint256 _age) public onlyPrincipal {
        students[_student].age = _age;
    }
    
    function updateScore(address _student, uint256 _score) public onlyTeacher {
        students[_student].scores[msg.sender] = _score;
    }
    
    function markAttendance(address _student) public onlyTeacher {
        students[_student].attendance[msg.sender] = true;
    }
    
    function getStudentScore(address _student, address _teacher) public view returns (uint256) {
        return students[_student].scores[_teacher];
    }
    
    function getAttendanceStatus(address _student, address _teacher) public view returns (bool) {
        return students[_student].attendance[_teacher];
    }
}
