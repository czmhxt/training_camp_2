// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IScore {
    function setScore(address _student, uint _score) external returns(bool);
}


contract Teacher{
    function setStudentScore(address score_address, address _student, uint _score) external returns(bool){
        bool result=IScore(score_address).setScore(_student,_score);
        return result;
    }

}