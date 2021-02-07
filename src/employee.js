const Person = require('./person')

class Employee extends Person {
    constructor(id, name='noname', age=20) {
        super(name, age)
        this.employee_id = id;
    }
    toString() {
        return JSON.stringify(this.toJSON())
    }

    toJSON(){
        const obj = super.toJSON();
        obj.employee_id = this.employee_id
        return obj
    }
}

module.exports = Employee;