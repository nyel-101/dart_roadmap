import 'dart:io';

void main() {
  List<Map<String, dynamic>> studentList = [];
  String choice = "";

  while (choice != "exit") {
    print("Input your name and grades");
    String Student = stdin.readLineSync() ?? "";

    print("Input your Grade of Math");
    double gradeMath = double.parse(stdin.readLineSync() ?? "0");

    print("Input your Grade on Science: ");
    double gradeScience = double.parse(stdin.readLineSync() ?? "0");

    List<double> mgaGrade = [gradeMath, gradeScience];

    print("student: $Student");
    print("Grades: $mgaGrade");

    double calculateAverage(List<double> grade) {
      double sum = 0;

      int numberOfSubjects = grade.length;

      for (double g in grade) {
        sum += g;
      }

      double average = sum / numberOfSubjects;

      return average;
    }

    double averageGrade = calculateAverage(mgaGrade);
    print("Average Grade: $averageGrade");

    String getLetterGrade(double score) {
      if (score >= 90) return 'A';
      if (score >= 80) return "B";
      if (score >= 70) return 'C';
      if (score >= 60) return 'D';
      return 'F';
    }

    String finalGrade = getLetterGrade(averageGrade);
    print("final Letter Grade: $finalGrade");

    String checkStatus(double score) {
      return score >= 75 ? "Passed" : "Failed";
    }

    print("Status: ${checkStatus(averageGrade)}");

    Map<String, dynamic> student = {
      'name': Student,
      'average': averageGrade,
      'grade': finalGrade,
    };
    studentList.add(student);

    print("Do you want to input another set of grades? (yes/no)");
    choice = stdin.readLineSync()?.toLowerCase() ?? "";

    while (choice != "exit") {
      print("[1] Magdagdag at I-compute ang grado ng Estudyante");
      print("[2] Lupaas sa Programa");
      print("[3] Ipakita ang Lahat ng Estudyante");
      String? choice = stdin.readLineSync();
      if (choice != null) {
        choice = choice.toLowerCase();
      } else {
        choice = "";
      }
      switch (choice) {
        case "1":
          break;

        case "3":
          for (var student in studentList) {
            print(
              "Student: ${student['name']}, Average Grade: ${student['average']}, Letter Grade: ${student['grade']}",
            );
          }
          break;
      }
    }
  }
}
