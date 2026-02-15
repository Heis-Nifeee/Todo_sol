// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

contract Todo{

    address owner;

    struct Task {
        string description;
        bool completed;
    }

    Task[] public tasks;

    constructor() {
        owner = msg.sender;
    }


    modifier validityCheck(uint256 _index) {
        _validityCheck(_index);
        _;
    }

    function _validityCheck(uint256 _index) internal view {
        require(_index < tasks.length, "Invalid task index");
    }



    function addTask(string memory _description) public {
        tasks.push(Task(_description, false));
    }

    function completeTask(uint256 _index) public validityCheck(_index) {
        tasks[_index].completed = true;
    }

    function getTask(uint256 _index) public view validityCheck(_index)  returns (string memory, bool) {
        Task memory task = tasks[_index];
        return (task.description, task.completed);
    }

}