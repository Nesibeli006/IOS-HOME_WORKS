// void main() {
//   String name = "Bekzat";
//   int age = 25;
//   double gpa = 3.4;
//   bool isStudent = false;

//   print("name : $name\nage: $age y.o.\ngpa: $gpa\nis Teacher: ${!isStudent}");

//   String text1 = "Hello";
//   // String nullText = null; not works
//   String? text2 = null;
//   print('text1: $text1');
//   print('text2: $text2');

//   int length1 = text1.length;
//   int length2 = text2?.length ?? 0;
//   print(length1);
//   print(length2);

//   String confirmedText = text2 ?? "default";
//   print("confirmed $confirmedText length: ${confirmedText.length}");

//   int digit = 3;
//   print("MULTIPLICATION TABLE for digit $digit");
//   for (int i = 1; i <= 10; i++) {
//     print("$digit * $i = ${i * digit}");
//   }

//   for (int i = 10; i > 0; i--) {
//     if (i % 2 == 0) {
//       print("$i");
//     } else {
//       print("${i * 2}");
//     }
//   }
// }

// TASK 1
// OUTPUT MULTIPLICATION TABLE  1-10

// void main() {
//   List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
//   for (int i = 1; i <= 10; i++) {
//     for (int g = 0; g < 10; g++) {
//       print("$i * ${numbers[g]} = ${i * numbers[g]}");
//     }
//     print("---");
//   }
// }


// TASK 2
// next day : examples:
// 05.09.2026 -> 06.09.2026
// 28.02.2024 -> 29.02.2024
// 28.02.2026 -> 01.03.2026
// 29.02.2026 -> invalid date
// 28.02.2100 -> 01.03.2100
// 28.02.2100 -> 29.02.2000
// 31.12.2025 -> 01.01.2026
// 2000,2400 leap year
// 2100,2200,2300 isn`t leap year
// void main () {
//   int day = 28;
//   int month = 3;
//   int year = 2100;
  
//   bool isLeapYear = false;

//   if (year % 400 == 0) {
//     isLeapYear = true;
//   } else if (year % 100 == 0) {
//     isLeapYear = false; 
//   } else if (year % 4 == 0) {
//     isLeapYear = true;
//   }
  
//   int maxDays = 0;
//   if(month == 2){
//     if(isLeapYear == true) {
//       maxDays = 29;
//     } else {
//       maxDays = 28;
//     }
//   } else if (month == 4 || month == 6 || month == 9 || month == 11){
//     maxDays = 30;
//   } else {
//     maxDays = 31;
//   }

//   bool isValidDate = false;
  
//   if(month < 1 || month > 12 || day < 1 || day > maxDays){
//     isValidDate = false;
//     print("Invalid date");
//   } else{
//     isValidDate = true;
//   }
//   if(isValidDate == true){
  
//   int nextDay = day;
//   int nextMonth = month;
//   int nextYear = year;
  
//   if(day == 31 && month == 12){
//     nextDay = 1;
//     nextMonth = 1;
//     nextYear = year + 1;
//   }else if(day == maxDays){
//     nextDay = 1;
//     nextMonth = month + 1;
//   }else{
//     nextDay = day + 1;
//   }

//   String formattedDay = nextDay.toString().padLeft(2, '0');
//   String formattedMonth = nextMonth.toString().padLeft(2, '0');

//   print("Next day: $formattedDay.$formattedMonth.$nextYear");
// }
// }

// TASK3
// Vowel Counter in a String -> "flutter mobile development" -> 8
// void main () {
//   String text = "me";
//   int count = 0;
//   String vowels = "aeiouAEIOU";
  
//   for(int i = 0; i < text.length; i++){
//     if(vowels.contains(text[i])){
//       count++;
//     }
//   }
//   print("$count");
// }

List<int> numbers = [14, 88, 3, 42, 99, 12, 67]; //-> max: 99, min: 3
List<int> numbers1 = [234, 34, 123, 44, 949, 112, 67]; //-> max: 949, min: 34
int first = numbers[0];
int last = numbers[numbers.length - 1];
// TASK4
// Manual min & max finder
// void main () {
//   int min = numbers[0];
//   int max = numbers[0];
  
//   for(int i = 0; i < numbers.length; i++){
//     if(numbers[i] > max) {
//       max = numbers[i];
//     } if(numbers[i] < min){
//       min = numbers[i];
//     }
//   }
//   print("max: $max\nmin: $min");
// }

// TASK 5
// Prime Number Checker
// 3 -> prime number
// 6 -> not prime number
// void main () {
//   int n = 3;
//   bool isPrime = true;
  
//   if(n <= 1){
//     isPrime = false;
//   } else {
//     for(int i = 2; i < n; i++){
//       if(n % i == 0){
//         isPrime = false;
//         break;
//       }
//     }
//   }
  
//   if(isPrime){
//     print("$n is prime");
//   } else{
//     print("$n is not prime");
//   }
// }
