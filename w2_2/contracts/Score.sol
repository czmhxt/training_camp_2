// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Score{
    mapping(address => uint) public student_score;
    address  public owner;
    address  public teacher;
    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Not Teacher");
        _;
    }

    function  setTeacher(address _teacher) public onlyOwner {
        teacher=_teacher;
    }


    function setScore(address _student, uint _score) public onlyTeacher returns(bool){
        require(_score<=100,"Score cannot be greater than 100");
        require(_student!= address(0),"student address cannot null");
        student_score[_student]=_score;
        return true;
    }



}

