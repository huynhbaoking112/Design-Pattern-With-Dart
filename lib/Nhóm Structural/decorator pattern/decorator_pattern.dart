abstract class EmployeeComponent{

  void doTask();

  String getName();

}

class EmployeeConcreteComponent implements EmployeeComponent{
  
  String names;
  EmployeeConcreteComponent(this.names);
  
  @override
  void doTask() {
    print("Quet san");
  }

  @override
  String getName() {
    return names;
  }

}


class EmployeeDecorator implements EmployeeComponent{

  
 EmployeeComponent employee;
  EmployeeDecorator(this.employee); 

  String getName(){
    return employee.getName();
  }

   @override
  void doTask(){
    employee.doTask();
  }

}


class TeamMember extends EmployeeDecorator{
  TeamMember(EmployeeComponent employee):super(employee);

  void baocao(){
    print("bao cao tu teammember");
  }

  void doTask(){
    employee.doTask();
    baocao(); 
  }


}


class TeamLeader extends EmployeeDecorator{
  TeamLeader(EmployeeComponent employee):super(employee);

  void baocaolead(){
    print("bao cao tu team leader");
  }

  
  void doTask(){
    employee.doTask();
    baocaolead(); 
  }
}


main(){
  EmployeeConcreteComponent king = EmployeeConcreteComponent("king");
  TeamLeader lead = TeamLeader(king);
  lead.doTask();
  TeamMember member = TeamMember(lead);
  member.doTask();
}