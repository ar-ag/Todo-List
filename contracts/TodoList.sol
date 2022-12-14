pragma solidity ^0.5.0;

contract TodoList{
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }
    
    // we use mapping to create a hash map of tasks with id as key
    mapping(uint => Task) public tasks; 

    event TaskCreated(
        uint id,
        string content,
        bool completed

    );

     event TaskCompleted(
        uint id,
        bool completed
  );

    // constructor to initialize a initial task
    constructor() public {
        createTask("Default Task");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false); // creating a new task by passing in values for respective fields
        emit TaskCreated(taskCount,_content,false);
    }


    function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }

}