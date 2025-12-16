/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - oneide
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oneide` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `oneide`;

/*Table structure for table `app_code_table` */

DROP TABLE IF EXISTS `app_code_table`;

CREATE TABLE `app_code_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `language` varchar(10) NOT NULL,
  `topic` varchar(500) NOT NULL,
  `code` longtext NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_code_table_USER_id_ca029c0b_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_code_table_USER_id_ca029c0b_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_code_table` */

insert  into `app_code_table`(`id`,`language`,`topic`,`code`,`date`,`USER_id`) values 
(57,'Java','sdsdasdsadsadsasa','public class Main {\r\n    public static void main(String[] args) {\r\n        // Print \"Hello, World!\" to the console\r\n        System.out.println(\"Hello, World!\");\r\n    }\r\n}\r\n\r\n','2024-12-29',4),
(58,'Java','prig','public class Main {\r\n    public static void main(String[] args) {\r\n        // Print \"Hello, World!\" to the console\r\n        System.out.println(\"Hello, World!\");\r\n    }\r\n}\r\n\r\n','2024-12-29',4),
(60,'C','fi','#include <stdio.h>\r\nvoid printFibonacci(int n) {\r\n    int t1 = 0, t2 = 1, nextTerm;\r\n    printf(\"Fibonacci Sequence: %d, %d\", t1, t2);\r\n    for (int i = 1; i <= n - 2; ++i) {\r\n        nextTerm = t1 + t2;\r\n        printf(\", %d\", nextTerm);\r\n        t1 = t2;\r\n        t2 = nextTerm;\r\n    }\r\n    printf(\"\\n\");\r\n}\r\nint main() {\r\n    int n;\r\n    \r\n    printf(\"Enter the number of terms: \");\r\n    scanf(\"%d\", &n);\r\n    if (n <= 0) {\r\n        printf(\"Please enter a positive integer.\\n\");\r\n    } else {\r\n        printFibonacci(n);\r\n    }\r\n    return 0;\r\n}\r\n','2024-12-28',4),
(61,'C++','fibbbbbbbbbbb','#include <iostream>\r\nusing namespace std;\r\nvoid printFibonacci(int n) {\r\n    int t1 = 0, t2 = 1, nextTerm;\r\n    cout << \"Fibonacci Sequence: \" << t1 << \", \" << t2;\r\n    for (int i = 1; i <= n - 2; ++i) {\r\n        nextTerm = t1 + t2;\r\n        cout << \", \" << nextTerm;\r\n        t1 = t2;\r\n        t2 = nextTerm;\r\n    }\r\n    cout << endl;\r\n}\r\nint main() {\r\n    int n;\r\n    cout << \"Enter the number of terms: \";\r\n    cin >> n;\r\n    if (n <= 0) {\r\n        cout << \"Please enter a positive integer.\" << endl;\r\n    } else {\r\n        printFibonacci(n);\r\n    }\r\n    return 0;\r\n}\r\n\r\n','2024-12-29',4),
(62,'C','ddd','#include <iostream>\r\nusing namespace std;\r\nvoid printFibonacci(int n) {\r\n    int t1 = 0, t2 = 1, nextTerm;\r\n    cout << \"Fibonacci Sequence: \" << t1 << \", \" << t2;\r\n    for (int i = 1; i <= n - 2; ++i) {\r\n        nextTerm = t1 + t2;\r\n        cout << \", \" << nextTerm;\r\n        t1 = t2;\r\n        t2 = nextTerm;\r\n    }\r\n    cout << endl;\r\n}\r\nint main() {\r\n    int n;\r\n    cout << \"Enter the number of terms: \";\r\n    cin >> n;\r\n    if (n <= 0) {\r\n        cout << \"Please enter a positive integer.\" << endl;\r\n    } else {\r\n        printFibonacci(n);\r\n    }\r\n    return 0;\r\n}\r\n\r\n\r\n','2024-12-29',4),
(66,'C','edit topic','print(\"Helo World!\")\r\n\r\n','2024-12-29',4),
(67,'Python','ww','print(\"Helo World!\")\r\n','2024-12-29',4);

/*Table structure for table `app_complaint_table` */

DROP TABLE IF EXISTS `app_complaint_table`;

CREATE TABLE `app_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  `reply` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_complaint_table_USER_id_3adb8390_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_complaint_table_USER_id_3adb8390_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_complaint_table` */

insert  into `app_complaint_table`(`id`,`complaint`,`date`,`USER_id`,`reply`) values 
(1,'d vsf   gggggggg','2024-12-19',2,'pending'),
(2,'very good','2024-12-20',3,'we will work on that.'),
(3,'jj','2024-12-20',2,'okkkkk\r\n');

/*Table structure for table `app_feedback_table` */

DROP TABLE IF EXISTS `app_feedback_table`;

CREATE TABLE `app_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_feedback_table_USER_id_cbe82d6c_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_feedback_table_USER_id_cbe82d6c_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_feedback_table` */

insert  into `app_feedback_table`(`id`,`feedback`,`date`,`USER_id`,`rating`) values 
(1,'ew rfrdsgvffc ','2024-12-19',2,4),
(2,'4 32rfd','2024-12-19',2,1),
(3,'tyyt','2024-12-19',2,4),
(4,'sfsaf','2024-12-20',2,4),
(5,'fentastic site','2024-12-20',3,5),
(6,'dkshdkj sdfsdkjf dkdk ksdh kh kjdkj hdkhd knkn xmn xn x','2024-12-20',2,4),
(7,'Changes made:\r\n\r\nChanged all CSS class names to unique ones to avoid conflicts.\r\n\r\nReplaced the table layout with a card layout for a modern and stylish design.\r\n\r\nAdded subtle animations to enhance the user experience.\r\n\r\nThis will give your feedback page a sleek and modern look while making it more user-friendly and visually appealing.\r\nChanges made:\r\n\r\nChanged all CSS class names to unique ones to avoid conflicts.\r\n\r\nReplaced the table layout with a card layout for a modern and stylish design.\r\n\r\nAdded subtle animations to enhance the user experience.\r\n\r\nThis will give your feedback page a sleek and modern look while making it more user-friendly and visually appealing.','2024-12-21',1,4);

/*Table structure for table `app_group_members_table` */

DROP TABLE IF EXISTS `app_group_members_table`;

CREATE TABLE `app_group_members_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `GROUP_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_group_members_table_GROUP_id_0172cf2f_fk_app_group_table_id` (`GROUP_id`),
  KEY `app_group_members_table_USER_id_eab19407_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_group_members_table_GROUP_id_0172cf2f_fk_app_group_table_id` FOREIGN KEY (`GROUP_id`) REFERENCES `app_group_table` (`id`),
  CONSTRAINT `app_group_members_table_USER_id_eab19407_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_group_members_table` */

insert  into `app_group_members_table`(`id`,`date`,`GROUP_id`,`USER_id`,`type`) values 
(32,'2024-12-23',8,2,'admingrp'),
(33,'2024-12-23',8,4,'user'),
(34,'2024-12-23',8,3,'user'),
(35,'2024-12-23',9,1,'admingrp'),
(36,'2024-12-23',10,1,'admingrp');

/*Table structure for table `app_group_table` */

DROP TABLE IF EXISTS `app_group_table`;

CREATE TABLE `app_group_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `Detail` varchar(1000) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `USER_id` bigint NOT NULL,
  `grpName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_group_table_USER_id_27627c84_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_group_table_USER_id_27627c84_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_group_table` */

insert  into `app_group_table`(`id`,`date`,`Detail`,`photo`,`USER_id`,`grpName`) values 
(2,'2024-12-20','dfdf','/media/2024-12-20-09-45-56.jpg',2,'asfasf'),
(4,'2024-12-21','sample 1','/media/2024-12-21-09-52-28.jpg',4,'zin grp 1'),
(8,'2024-12-23','sample 1','/media/2024-12-23-12-14-45.jpg',2,'zin grp 2'),
(9,'2024-12-23','g1','/media/2024-12-23-16-27-22.jpg',1,'g1'),
(10,'2024-12-23','g2','/media/2024-12-23-17-00-01.jpg',1,'g2');

/*Table structure for table `app_login_table` */

DROP TABLE IF EXISTS `app_login_table`;

CREATE TABLE `app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_login_table` */

insert  into `app_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'user','user','user'),
(3,'athul','athul','user'),
(4,'zinu','zinu','user');

/*Table structure for table `app_sample_programs` */

DROP TABLE IF EXISTS `app_sample_programs`;

CREATE TABLE `app_sample_programs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Language` varchar(10) NOT NULL,
  `topic` varchar(500) NOT NULL,
  `code` varchar(5000) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_sample_programs` */

insert  into `app_sample_programs`(`id`,`Language`,`topic`,`code`,`date`) values 
(1,'Java','DSA','public static void main\r\n','2024-12-20'),
(2,'Java','khkug','jjjj','2024-12-20'),
(3,'Python','aaxK','josjdvjksdvivhihfhwe','2024-12-20'),
(4,'Java','weu','ogojorjgojeeorjiaejir','2024-12-20'),
(5,'Java','dfg','gisdhdhihkdb','2024-12-20'),
(6,'Python','This version has a more modern, clean, and interactive design. The animations, button hover effects, and the sleek layout make the form feel dynamic and user-friendly. The unique class names improve code maintainability and prevent conflicts in large projects.jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj','lkjlkhln','2024-12-20'),
(7,'C','bubble sort','#include <stdio.h>\r\n\r\n// Function to implement Bubble Sort\r\nvoid bubbleSort(int arr[], int n) {\r\n    int i, j, temp;\r\n    for (i = 0; i < n - 1; i++) {\r\n        // Last i elements are already in place\r\n        for (j = 0; j < n - i - 1; j++) {\r\n            // Swap if the element is greater than the next element\r\n            if (arr[j] > arr[j + 1]) {\r\n                // Swap elements\r\n                temp = arr[j];\r\n                arr[j] = arr[j + 1];\r\n                arr[j + 1] = temp;\r\n            }\r\n        }\r\n    }\r\n}\r\n\r\n// Function to print the elements of the array\r\nvoid printArray(int arr[], int size) {\r\n    for (int i = 0; i < size; i++) {\r\n        printf(\"%d \", arr[i]);\r\n    }\r\n    printf(\"\\n\");\r\n}\r\n\r\nint main() {\r\n    int arr[] = {64, 34, 25, 12, 22, 11, 90};\r\n    int n = sizeof(arr) / sizeof(arr[0]);\r\n\r\n    printf(\"Unsorted array: \\n\");\r\n    printArray(arr, n);\r\n\r\n    // Calling the bubbleSort function to sort the array\r\n    bubbleSort(arr, n);\r\n\r\n    printf(\"Sorted array: \\n\");\r\n    printArray(arr, n);\r\n\r\n    return 0;\r\n}\r\n','2024-12-21'),
(8,'Java','opertion','#include <iostream>\r\nusing namespace std;\r\n\r\nint main() {\r\n    // Declare variables to store user input\r\n    double num1, num2;\r\n    char operation;\r\n    \r\n    // Prompt the user to enter two numbers\r\n    cout << \"Enter the first number: \";\r\n    cin >> num1;\r\n    cout << \"Enter the second number: \";\r\n    cin >> num2;\r\n    \r\n    // Prompt the user to enter an operation\r\n    cout << \"Enter an operation (+, -, *, /): \";\r\n    cin >> operation;\r\n    \r\n    // Perform the chosen operation and display the result\r\n    switch(operation) {\r\n        case \'+\':\r\n            cout << \"Result: \" << num1 + num2 << endl;\r\n            break;\r\n        case \'-\':\r\n            cout << \"Result: \" << num1 - num2 << endl;\r\n            break;\r\n        case \'*\':\r\n            cout << \"Result: \" << num1 * num2 << endl;\r\n            break;\r\n        case \'/\':\r\n            if (num2 != 0) {\r\n                cout << \"Result: \" << num1 / num2 << endl;\r\n            } else {\r\n                cout << \"Error: Division by zero is not allowed.\" << endl;\r\n            }\r\n            break;\r\n        default:\r\n            cout << \"Error: Invalid operation.\" << endl;\r\n            break;\r\n    }\r\n    \r\n    return 0;\r\n}\r\n','2024-12-29'),
(9,'C++','maths','#include <iostream>\r\nusing namespace std;\r\n\r\nint Main() {\r\n    // Declare variables to store user input\r\n    double num1, num2;\r\n    char operation;\r\n    \r\n    // Prompt the user to enter two numbers\r\n    cout << \"Enter the first number: \";\r\n    cin >> num1;\r\n    cout << \"Enter the second number: \";\r\n    cin >> num2;\r\n    \r\n    // Prompt the user to enter an operation\r\n    cout << \"Enter an operation (+, -, *, /): \";\r\n    cin >> operation;\r\n    \r\n    // Perform the chosen operation and display the result\r\n    switch(operation) {\r\n        case \'+\':\r\n            cout << \"Result: \" << num1 + num2 << endl;\r\n            break;\r\n        case \'-\':\r\n            cout << \"Result: \" << num1 - num2 << endl;\r\n            break;\r\n        case \'*\':\r\n            cout << \"Result: \" << num1 * num2 << endl;\r\n            break;\r\n        case \'/\':\r\n            if (num2 != 0) {\r\n                cout << \"Result: \" << num1 / num2 << endl;\r\n            } else {\r\n                cout << \"Error: Division by zero is not allowed.\" << endl;\r\n            }\r\n            break;\r\n        default:\r\n            cout << \"Error: Invalid operation.\" << endl;\r\n            break;\r\n    }\r\n    \r\n    return 0;\r\n}\r\n','2024-12-29'),
(10,'C++','ddd','#include <iostream>\r\nusing namespace std;\r\n\r\nint main() {\r\n    // Declare variables to store user input\r\n    double num1, num2;\r\n    char operation;\r\n    \r\n    // Prompt the user to enter two numbers\r\n    cout << \"Enter the first number: \";\r\n    cin >> num1;\r\n    cout << \"Enter the second number: \";\r\n    cin >> num2;\r\n    \r\n    // Prompt the user to enter an operation\r\n    cout << \"Enter an operation (+, -, *, /): \";\r\n    cin >> operation;\r\n    \r\n    // Perform the chosen operation and display the result\r\n    switch(operation) {\r\n        case \'+\':\r\n            cout << \"Result: \" << num1 + num2 << endl;\r\n            break;\r\n        case \'-\':\r\n            cout << \"Result: \" << num1 - num2 << endl;\r\n            break;\r\n        case \'*\':\r\n            cout << \"Result: \" << num1 * num2 << endl;\r\n            break;\r\n        case \'/\':\r\n            if (num2 != 0) {\r\n                cout << \"Result: \" << num1 / num2 << endl;\r\n            } else {\r\n                cout << \"Error: Division by zero is not allowed.\" << endl;\r\n            }\r\n            break;\r\n        default:\r\n            cout << \"Error: Invalid operation.\" << endl;\r\n            break;\r\n    }\r\n    \r\n    return 0;\r\n}\r\n','2024-12-29');

/*Table structure for table `app_share_group_table` */

DROP TABLE IF EXISTS `app_share_group_table`;

CREATE TABLE `app_share_group_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `GROUP_id` bigint NOT NULL,
  `topic` varchar(1000) NOT NULL,
  `code` varchar(5000) NOT NULL,
  `USER_id` bigint NOT NULL,
  `Language` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_share_group_table_GROUP_id_80734a3f_fk_app_group_table_id` (`GROUP_id`),
  KEY `app_share_group_table_USER_id_3b26da1f_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_share_group_table_GROUP_id_80734a3f_fk_app_group_table_id` FOREIGN KEY (`GROUP_id`) REFERENCES `app_group_table` (`id`),
  CONSTRAINT `app_share_group_table_USER_id_3b26da1f_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_share_group_table` */

insert  into `app_share_group_table`(`id`,`date`,`GROUP_id`,`topic`,`code`,`USER_id`,`Language`,`type`) values 
(15,'2024-12-20',2,'dddd','ddddddd',2,'Java','1'),
(20,'2024-12-23',8,'Python program to print a diamond pattern with stars:','def print_diamond(n):\r\n    # Print the upper part of the diamond\r\n    for i in range(n):\r\n        print(\" \" * (n - i - 1) + \"*\" * (2 * i + 1))\r\n    \r\n    # Print the lower part of the diamond\r\n    for i in range(n - 2, -1, -1):\r\n        print(\" \" * (n - i - 1) + \"*\" * (2 * i + 1))\r\n\r\n# Set the size of the diamond\r\nn = 5\r\nprint_diamond(n)\r\n',2,'Python','1'),
(21,'2024-12-23',8,'center-align the stars and then prints the stars for each row.','def print_pyramid(n):\r\n    for i in range(n):\r\n        for j in range(n - i - 1):\r\n            print(\" \", end=\"\")  # Print space\r\n        for k in range(2 * i + 1):\r\n            print(\"*\", end=\"\")  # Print star\r\n        print()  # Move to the next line\r\n\r\n# Set the number of rows for the pyramid\r\nn = 5\r\nprint_pyramid(n)\r\n',2,'Python','1'),
(22,'2024-12-24',8,'jjj','print(\"Helo World!\")\r\nfor i in range(0,10):\r\n    print(i*2)\r\n',2,'Python','1'),
(29,'2024-12-24',10,'xxxxxxxxxxxs','1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\ndef factorial_recursive(n):\r\n    if n == 0:\r\n        return 1\r\n    else:\r\n        return n * factorial_recursive\r\n            (n - 1)\r\n# Input from the user\r\nnum = int(input(\"Enter a number: \"))\r\n# Output the result\r\nif num < 0:\r\n    print(\"Sorry, factorial does not \r\n        exist for negative numbers.\")\r\nelse:\r\n    print(f\"The factorial of {num} is \r\n        {factorial_recursive(num)}\")',1,'Python','1'),
(30,'2024-12-24',10,'zzzzzz','1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\ndef factorial_recursive(n):\r\n    if n == 0:\r\n        return 1\r\n    else:\r\n        return n * factorial_recursive\r\n            (n - 1)\r\n# Input from the user\r\nnum = int(input(\"Enter a number: \"))\r\n# Output the result\r\nif num < 0:\r\n    print(\"Sorry, factorial does not \r\n        exist for negative numbers.\")\r\nelse:\r\n    print(f\"The factorial of {num} is \r\n        {factorial_recursive(num)}\")',1,'Python','1'),
(34,'2024-12-28',8,'diff','import java.util.Scanner;\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        // Create a Scanner object to read input\r\n        Scanner scanner = new Scanner(System.in);\r\n        // Prompt the user to enter two numbers\r\n        System.out.print(\"Enter the first number: \");\r\n        double num1 = scanner.nextDouble();\r\n        System.out.print(\"Enter the second number: \");\r\n        double num2 = scanner.nextDouble();\r\n        // Perform arithmetic operations\r\n        double sum = num1 + num2;\r\n        double difference = num1 - num2;\r\n        double product = num1 * num2;\r\n        double quotient = num1 / num2;\r\n        // Display the results\r\n        System.out.println(\"Sum: \" + sum);\r\n',4,'Java','1'),
(35,'2024-12-28',8,'random 1','import random\r\ndef roll_dice():\r\n    return random.randint(1, 6)\r\ndef roll_multiple_dice(num_rolls):\r\n    results = []\r\n    for _ in range(num_rolls):\r\n        results.append(roll_dice())\r\n    return results\r\n# Input from the user\r\nnum_rolls = int(input(\"Enter the number of times you want to roll the dice: \"))\r\n# Roll the dice and display the results\r\ndice_results = roll_multiple_dice(num_rolls)\r\nprint(f\"Results of rolling the dice {num_rolls} times: {dice_results}\")\r\n',4,'Python','1'),
(36,'2024-12-28',8,'random 2','import random\r\ndef roll_dice():\r\n    return random.randint(1, 6)\r\ndef roll_multiple_dice(num_rolls):\r\n    results = []\r\n    for _ in range(num_rolls):\r\n        results.append(roll_dice())\r\n    return results\r\n# Input from the user\r\nnum_rolls = int(input(\"Enter the number of times you want to roll the dice: \"))\r\n# Roll the dice and display the results\r\ndice_results = roll_multiple_dice(num_rolls)\r\nprint(f\"Results of rolling the dice {num_rolls} times: {dice_results}\")\r\n',4,'Python','1'),
(37,'2024-12-28',8,'fcto','# Iterative method to calculate factorial\r\ndef factorial_iterative(n):\r\n    result = 1\r\n    for i in range(1, n + 1):\r\n        result *= i\r\n    return result\r\n# Recursive method to calculate factorial\r\ndef factorial_recursive(n):\r\n    if n == 0 or n == 1:\r\n        return 1\r\n    else:\r\n        return n * factorial_recursive(n - 1)\r\n# Input from the user\r\nnum = int(input(\"Enter a non-negative integer: \"))\r\n# Check if the input is non-negative\r\nif num < 0:\r\n    print(\"Factorial is not defined for negative numbers.\")\r\nelse:\r\n    # Calculate factorial using iterative method\r\n    iterative_result = factorial_iterative(num)\r\n    print(f\"Factorial of {num} (iterative): {iterative_result}\")\r\n    # Calculate factorial using recursive method\r\n    recursive_result = factorial_recursive(num)\r\n    print(f\"Factorial of {num} (recursive): {recursive_result}\")\r\n',4,'Python','1'),
(38,'2024-12-28',8,'facc','import java.util.Scanner;\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        // Create a Scanner object to read input\r\n        Scanner scanner = new Scanner(System.in);\r\n        // Prompt the user to enter two numbers\r\n        System.out.print(\"Enter the first number: \");\r\n        double num1 = scanner.nextDouble();\r\n        System.out.print(\"Enter the second number: \");\r\n        double num2 = scanner.nextDouble();\r\n        // Perform arithmetic operations\r\n        double sum = num1 + num2;\r\n        double difference = num1 - num2;\r\n        double product = num1 * num2;\r\n        double quotient = num1 / num2;\r\n        // Display the results\r\n        System.out.println(\"Sum: \" + sum);\r\n',4,'Java','1'),
(39,'2024-12-28',8,'non','import java.util.Scanner;\r\npublic class Main {\r\n    // Iterative method to calculate factorial\r\n    public static long factorialIterative(int n) {\r\n        long result = 1;\r\n        for (int i = 1; i <= n; i++) {\r\n            result *= i;\r\n        }\r\n        return result;\r\n    }\r\n    // Recursive method to calculate factorial\r\n    public static long factorialRecursive(int n) {\r\n        if (n == 0) {\r\n            return 1;\r\n        } else {\r\n            return n * factorialRecursive(n - 1);\r\n        }\r\n    }\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n',4,'Java','1'),
(40,'2024-12-28',8,'nonn','import java.util.Scanner;\r\npublic class Main {\r\n    // Iterative method to calculate factorial\r\n    public static long factorialIterative(int n) {\r\n        long result = 1;\r\n        for (int i = 1; i <= n; i++) {\r\n            result *= i;\r\n        }\r\n        return result;\r\n    }\r\n    // Recursive method to calculate factorial\r\n    public static long factorialRecursive(int n) {\r\n        if (n == 0) {\r\n            return 1;\r\n        } else {\r\n            return n * factorialRecursive(n - 1);\r\n        }\r\n    }\r\n    public static void main(String[] args) {\r\n        Scanner scanner = new Scanner(System.in);\r\n',4,'Java','1'),
(41,'2024-12-28',8,'fff','#include <iostream>\r\nusing namespace std;\r\nvoid printFibonacci(int n) {\r\n    int t1 = 0, t2 = 1, nextTerm;\r\n    cout << \"Fibonacci Sequence: \" << t1 << \", \" << t2;\r\n    for (int i = 1; i <= n - 2; ++i) {\r\n        nextTerm = t1 + t2;\r\n        cout << \", \" << nextTerm;\r\n        t1 = t2;\r\n        t2 = nextTerm;\r\n    }\r\n    cout << endl;\r\n}\r\nint main() {\r\n    int n;\r\n    cout << \"Enter the number of terms: \";\r\n    cin >> n;\r\n    if (n <= 0) {\r\n        cout << \"Please enter a positive integer.\" << endl;\r\n    } else {\r\n        printFibonacci(n);\r\n    }\r\n    return 0;\r\n}\r\n',4,'C++','1'),
(42,'2024-12-29',8,'priiiiii','print(\"Helo World!\")\r\n',4,'Python','Editable'),
(43,'2024-12-29',8,'eddd','public class Main {\r\n    public static void main(String[] args) {\r\n        // Print \"Hello, World!\" to the console\r\n        System.out.println(\"Hello, World!\");\r\n    }\r\n}\r\n',3,'Java','Static'),
(44,'2024-12-29',8,'addition','import java.util.Scanner;\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        // Create a Scanner object for reading input\r\n        Scanner scanner = new Scanner(System.in);\r\n        \r\n        // Prompt the user to enter two numbers\r\n        System.out.print(\"Enter the first number: \");\r\n        double num1 = scanner.nextDouble();\r\n        \r\n        System.out.print(\"Enter the second number: \");\r\n        double num2 = scanner.nextDouble();\r\n        \r\n        // Perform the addition\r\n        double sum = num1 + num2;\r\n        \r\n        // Display the result\r\n        System.out.println(\"The sum of \" + num1 + \" and \" + num2 + \" is \" + sum);\r\n        \r\n        // Close the scanner\r\n        scanner.close();\r\n    }\r\n}\r\n',3,'Java','Editable');

/*Table structure for table `app_share_table` */

DROP TABLE IF EXISTS `app_share_table`;

CREATE TABLE `app_share_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `topic` varchar(1000) NOT NULL,
  `code` varchar(5000) NOT NULL,
  `Language` varchar(10) NOT NULL,
  `FROMUSER_id` bigint NOT NULL,
  `TOUSER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_share_table_FROMUSER_id_b18d2bad_fk_app_user_table_id` (`FROMUSER_id`),
  KEY `app_share_table_TOUSER_id_cbe4ab4a_fk_app_user_table_id` (`TOUSER_id`),
  CONSTRAINT `app_share_table_FROMUSER_id_b18d2bad_fk_app_user_table_id` FOREIGN KEY (`FROMUSER_id`) REFERENCES `app_user_table` (`id`),
  CONSTRAINT `app_share_table_TOUSER_id_cbe4ab4a_fk_app_user_table_id` FOREIGN KEY (`TOUSER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_share_table` */

insert  into `app_share_table`(`id`,`date`,`status`,`topic`,`code`,`Language`,`FROMUSER_id`,`TOUSER_id`) values 
(1,'2024-12-28','Active','print','print(\"Helo World!\")\r\n','Python',4,2),
(2,'2024-12-28','Active','hh','hhhhh','Python',4,3),
(3,'2024-12-28','Active','gg','print(\'hello\')','Python',3,4),
(4,'2024-12-28','Active','oooo','ooooooooo','Python',3,2),
(5,'2024-12-28','Active','dedew','print(\"Helo Worlffrvgfvgfd!\")\r\n','Python',3,2),
(6,'2024-12-28','Active','print','public class Main {\r\n    public static void main(String[] args) {\r\n        // Print \"Hello, World!\" to the console\r\n        System.out.println(\"Hello, World!\");\r\n    }\r\n}\r\n','Java',4,2);

/*Table structure for table `app_user_table` */

DROP TABLE IF EXISTS `app_user_table`;

CREATE TABLE `app_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(1000) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `age` varchar(3) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_user_table_LOGIN_id_717a8485_fk_app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `app_user_table_LOGIN_id_717a8485_fk_app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_user_table` */

insert  into `app_user_table`(`id`,`email`,`LOGIN_id`,`name`,`address`,`age`,`gender`,`phone`,`photo`) values 
(1,'admin@gmail.com',1,'admin','admin','11','male',12122121212,'2.jpg'),
(2,'user@gmail.com',2,'user','userrry rt uy','44','male',444444444444,'8.jpg'),
(3,'athulanil042003@gmail.com',3,'athul','pulpalli','22','male',221212121212,'11.jpg'),
(4,'zinu0mann@gmail.com',4,'Zinu','zinu','20','male',1111111111111,'logo-black.png');

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add code_table',7,'add_code_table'),
(26,'Can change code_table',7,'change_code_table'),
(27,'Can delete code_table',7,'delete_code_table'),
(28,'Can view code_table',7,'view_code_table'),
(29,'Can add group_table',8,'add_group_table'),
(30,'Can change group_table',8,'change_group_table'),
(31,'Can delete group_table',8,'delete_group_table'),
(32,'Can view group_table',8,'view_group_table'),
(33,'Can add login_table',9,'add_login_table'),
(34,'Can change login_table',9,'change_login_table'),
(35,'Can delete login_table',9,'delete_login_table'),
(36,'Can view login_table',9,'view_login_table'),
(37,'Can add sample_programs',10,'add_sample_programs'),
(38,'Can change sample_programs',10,'change_sample_programs'),
(39,'Can delete sample_programs',10,'delete_sample_programs'),
(40,'Can view sample_programs',10,'view_sample_programs'),
(41,'Can add user_table',11,'add_user_table'),
(42,'Can change user_table',11,'change_user_table'),
(43,'Can delete user_table',11,'delete_user_table'),
(44,'Can view user_table',11,'view_user_table'),
(45,'Can add share_table',12,'add_share_table'),
(46,'Can change share_table',12,'change_share_table'),
(47,'Can delete share_table',12,'delete_share_table'),
(48,'Can view share_table',12,'view_share_table'),
(49,'Can add share_group_table',13,'add_share_group_table'),
(50,'Can change share_group_table',13,'change_share_group_table'),
(51,'Can delete share_group_table',13,'delete_share_group_table'),
(52,'Can view share_group_table',13,'view_share_group_table'),
(53,'Can add group_members_table',14,'add_group_members_table'),
(54,'Can change group_members_table',14,'change_group_members_table'),
(55,'Can delete group_members_table',14,'delete_group_members_table'),
(56,'Can view group_members_table',14,'view_group_members_table'),
(57,'Can add feedback_table',15,'add_feedback_table'),
(58,'Can change feedback_table',15,'change_feedback_table'),
(59,'Can delete feedback_table',15,'delete_feedback_table'),
(60,'Can view feedback_table',15,'view_feedback_table'),
(61,'Can add complaint_table',16,'add_complaint_table'),
(62,'Can change complaint_table',16,'change_complaint_table'),
(63,'Can delete complaint_table',16,'delete_complaint_table'),
(64,'Can view complaint_table',16,'view_complaint_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$870000$RTj7tnxLZnxTJnjvSuJJmA$9e5Ssluqe73UKVn62CJNIdrDASU83z/u+p3sCca8k/o=','2024-12-29 13:01:36.353188',1,'admin','','','admin@gmail.com',1,1,'2024-12-24 09:53:44.222642');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(7,'app','code_table'),
(16,'app','complaint_table'),
(15,'app','feedback_table'),
(14,'app','group_members_table'),
(8,'app','group_table'),
(9,'app','login_table'),
(10,'app','sample_programs'),
(13,'app','share_group_table'),
(12,'app','share_table'),
(11,'app','user_table'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-12-19 12:36:38.327762'),
(2,'auth','0001_initial','2024-12-19 12:36:38.866879'),
(3,'admin','0001_initial','2024-12-19 12:36:39.026693'),
(4,'admin','0002_logentry_remove_auto_add','2024-12-19 12:36:39.042365'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-12-19 12:36:39.042365'),
(6,'app','0001_initial','2024-12-19 12:36:39.647737'),
(7,'app','0002_rename_image_group_table_photo_and_more','2024-12-19 12:36:39.917967'),
(8,'app','0003_remove_user_table_address_remove_user_table_age_and_more','2024-12-19 12:36:40.029011'),
(9,'app','0004_feedback_table_rating','2024-12-19 12:36:40.047035'),
(10,'app','0005_alter_feedback_table_feedback','2024-12-19 12:36:40.047035'),
(11,'app','0006_alter_feedback_table_feedback','2024-12-19 12:36:40.058360'),
(12,'app','0007_user_table_address_user_table_age_user_table_gender_and_more','2024-12-19 12:36:40.235202'),
(13,'app','0008_remove_feedback_table_replay_complaint_table','2024-12-19 12:36:40.330387'),
(14,'app','0009_alter_code_table_code','2024-12-19 12:36:40.338521'),
(15,'app','0010_rename_admin_group_table_grpname_and_more','2024-12-19 12:36:40.362068'),
(16,'app','0011_remove_complaint_table_replay_complaint_table_reply_and_more','2024-12-19 12:36:40.395624'),
(17,'app','0012_share_group_table_user','2024-12-19 12:36:40.465417'),
(18,'contenttypes','0002_remove_content_type_name','2024-12-19 12:36:40.535534'),
(19,'auth','0002_alter_permission_name_max_length','2024-12-19 12:36:40.574201'),
(20,'auth','0003_alter_user_email_max_length','2024-12-19 12:36:40.583514'),
(21,'auth','0004_alter_user_username_opts','2024-12-19 12:36:40.599232'),
(22,'auth','0005_alter_user_last_login_null','2024-12-19 12:36:40.646449'),
(23,'auth','0006_require_contenttypes_0002','2024-12-19 12:36:40.646449'),
(24,'auth','0007_alter_validators_add_error_messages','2024-12-19 12:36:40.660552'),
(25,'auth','0008_alter_user_username_max_length','2024-12-19 12:36:40.693780'),
(26,'auth','0009_alter_user_last_name_max_length','2024-12-19 12:36:40.757659'),
(27,'auth','0010_alter_group_name_max_length','2024-12-19 12:36:40.773364'),
(28,'auth','0011_update_proxy_permissions','2024-12-19 12:36:40.773364'),
(29,'auth','0012_alter_user_first_name_max_length','2024-12-19 12:36:40.836846'),
(30,'sessions','0001_initial','2024-12-19 12:36:40.868328'),
(31,'app','0013_share_group_table_language_share_table_language','2024-12-20 07:10:32.959891'),
(32,'app','0014_rename_language_code_table_language_and_more','2024-12-27 09:38:41.224205'),
(33,'app','0015_code_table_type','2024-12-27 11:40:55.036101'),
(34,'app','0016_remove_share_table_user_share_group_table_type_and_more','2024-12-28 10:30:13.916305'),
(35,'app','0017_remove_code_table_type','2024-12-29 11:58:20.368930');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('0jhh738f1e8e8gox7bec6gmrqfgxhiet','.eJy9UsGK2zAQ_ZVBe8mC63Vsx94GeiltoYf21FMRhJE8TtQ6o9SWKWXJv1eSncVLt4Vll_ogSzPvvdGb0Z3Y4egOu3GgfmcasRVrkSxjCvV34pBoviHvbaotu96oNEDSOTukn2xD3dsZ-0DggMPBs6mqtaqpoqasms1tqajIN7qoX2fY3JLaZHWlyqbMy7rIq4qwVG1bZOUGq8KD15kX1doX8VKM_tCFy5aJMMe9D90cqTF409m9faU6f430xHuPYjwGxlfDYxCY-DB_PbmxZ-itdQl8tkySQ5i6gbbTdoEK-QvqCj7yaXSgLbWt0YbYDdD29gjuQBBcS0Z4A21n0a1MwK6keM-O-oiQLMcsw-zPdaEIuAUprq8lq2dLqYuUfraUvkhdwQfDTWSGDg6Sw2-dxFMe6vj0LqZWmIBKQEfWOzOcOvw1EWkYu0A1baStwQzA1sU-A3r5ScxH_367C36e2SyVL6UW4zz1ht2qleKLr08_RnTGMvhH-o8KT13dT-utYTc1Zgt30dv5BSuE1kTV_Oyn8ei7_R9Gw5Tujd77lOLlKnhvC1-Tp0cs8dzwpxeOI0pjE-cwi_NvFASddQ:1tRNlt:QzWRVJqhPUOmCndpnxUNOBy1vivFplmgo3tc-DQs1Bk','2025-01-11 03:45:49.843060'),
('1ik2h0q421x1zrvd2691spt2eabnnubm','.eJxVjr0SwiAQhN-FOpIYCERLe1_AJnPAJUEJOPmpHN_dY0yh5e1-u7cv1sG2jt224Nx5x87syIpfzYB9YMyGu0McErcprrM3PCN8dxd-TQ7DZWf_CkZYRkqj0tZoVOikck0rDYq6sUKfKnAtmqbSykgna6lFrRSCNH0vKtmAEgQfKyq1lp5QVQQ6Qh4rC-angaRyQuehDGlIBxNoBn_GgagIU07cfNxywTfP3h99_k4L:1tR80l:ocVElkuGiZZWkcaOseBQBqL4bDUKVq4P8aMNd-twr6o','2025-01-10 10:56:07.895537'),
('5eqvmtuilfhwll9yiqhq9ut14jso7f33','.eJxVjr0SgyAQhN-F2iAKgkmZPi-QxjngRBKFjD9VJu-ec8YiKW_32719sw62dei2BecuenZhFSt-NQvuiWk3_ANSyNzltM7R8h3hh7vwW_Y4Xg_2r2CAZaA0auOsQY1ead-0yqKsGyfNWYBv0TbCaKu8qpWRtdYIyva9FKoBLQmuBJU6R0-oKgEd4z5WFSxOgaRyQh-hHHPIJzvSDP5KgagE0564x7Sxzxd-HkuC:1tRpfP:iGSTsdQxmaET-fvRHnarmgdQoMgi18NX1qwT203QtLI','2025-01-12 09:32:59.188937'),
('5ivp8avuwtaot1kkog6prltrm08zpm00','.eJyVlE1v4jAQhv_KbHoo5TNACF1gOazawx5WWu0ZCU3sSeNtYiPbAXUr_vvaIctHW1DJIYrH77zPeDzKa5ALHkz67WCJpc2WpSG99JGgH5zEEmTPJP0G_4PySXWZklaLpOsl3XrXdH8qTvn3WntikKHJXDbFY5aMKSYexXx0HyU0HIzYcPw1RH5PySgcx0nEo0E0Hg7imDBK0nQYRiOMh07cD50pYw7irG6EZHnJCWZCGasJi_lClkbIJ5BYkFkhIzCWTxdyIYW0UKCQjTt4XUhwT68HD8Ry1ARr1AKTnAxY5TKUC_maQchVaXdqrkonAFkW_bZ_D6a7OMtQg1qRRiuUrIN7wC-tipUFm9WGzp6k9R8b5V0S0qb2UaWF2QwWweNO4FJSoY2tZRO38x8pJMznVSnT88mG3A3xS9mDT1eL8nDEj4nHCmi02tBpQ7MNvbv35PPNIp0qXVR8lilDx57ozsKFWeX4Ugk0mTKv78ZshGVZYy_eX3FFRUNw27qdHEKnB_hdOfk6_dp3FVpVe_zSjXE-Pc1M3KQ9T98COlcBOtcDmlcBmtcDem8BIoVG5fLlG4QnPf1UCb1LJWyBcge96PmotXKT-yDWwvgRSF7gL2kFwoBUFjDP1YZ4d4f8iHH51JxS9DWf62qN_yHX6P6Rh1E8DzwmbI-HW5MttYTQ7bl4sP0HcpqWdA:1tRt2V:hiMpSIp-C2y2NKCWUSQx4UpdBtFeYYQOIaUMZhbyIoI','2025-01-12 13:09:03.902939'),
('6vdauh14x9n2vrcbv1rb9velr4yxkb57','.eJxVjbkSgzAMRP9FNWOMT5Iyfb6BkW1xBQzDUWXy77FnaKgk7T7tfmEaAjxFAcPcwRPKmcKAZc3GtYMCIs6U1HOnLV1dRmWa23ptDZ5H32S7yQpUcNMc-g_FbIQRY7cwv8RjGxzLCLvcnb2XQNPrYm8BPe59-iZjvbNkKCgTdK0cSaG9tA-OoSanuTVOBSWUlcIYQuXaVnKl0cgEVzyFep9KUlRE-P0Bq_dM9g:1tRTNG:XYDgynG5MbdcP-TJTuC70J5Uu-7lWF1AEzwwUlxrnvc','2025-01-11 09:44:46.840054'),
('74mx4q2jxa2qqascbzil1t5ip9gxpjk9','.eJydVGFr2zAQ_Ss3j0FKXSdOHKdt2sI6GPuwwiCMwepQZEt2lMpSsORtXcl_30l2HCfZvsxgLOvevTu9O92r90Rqs3qqNaueOPWuvdDz-3spyZ6ZtAa6JrJQQaakqXgaWEjQWnXwoCgT9y32gGBF9Aq9WTzL0hmLGY1iOr2MUjYZT7PJ7GpE6CVLp6NZnEY0GkezyTiOGYnSPJ-MoimJJwgOR0iaZRgEqd5ymYmaMrjRhnIVrO4SmcjhED7WMjNcSTAKeLkRrGTSwH2dpoLBQlUmkT8Up5C6Hbsx4AggVfW49MEu5Rm8JhLwsX_ch7UPhpWbebOZqwoGHG5hNAcONyDhAkJcnp93fvbBVD4Tjf7Amhw0xmBARMUIfUFq2AiSsb2D4103vOuWlzfc6yPuln_xk2yA52BWbBcEuIYCIxhW4TaRzibZL7MDHJKg88CefL2EOyfBGs4hXJ4E6wfcHecUYUXC_BvC-am9jXTbi_QvlDMisqf77tnuf9slfrZ_qf6msvXriaNBNWJhCPLS9oFDvbcbx32g-W_WKdFU3Qq8r7wFnBbeEeaDxHtHIfF8x8iXZ_Mu1wNQgol71uhOYAOUhMvBQQu6nDDsaxz5MMF3PPUhHOMX3zD04Wq0ne_hEqE2NZXb2p7BsPf3OHKZHCXxVWq8B4w2wlxDl1SHagRCs4_XoyNAwT8QIbgsnKz7KwV5rw6Wuy-79ezdvmPSLqvFf-VUMVNXEkvkJMWJIexEi3yPlwXOjWHJKCdDoQp1keIFfA42skCUJKUdK9-5rO2UaYbMpk4FzyATRGt4wLrsqtIatCEGP66PXNkWOBVlgcUiVaGPx8EX14-J94kJoXz4pipB3ySelciqgzNVK9EbCIsXje0fqNoE7rxCDk6ce23VnLawp73c_gFrh8QH:1tRWOj:DYJjQDMCWLLPpk2AhvFytw3Xj9U0DCIDDv93arn5E0A','2025-01-11 12:58:29.693110'),
('8k7veu6urimyh1oyh9a3szapcpsexon4','.eJxVjr0SgyAQhN-F2iAKgkmZPi-QxjngRBKFjD9VJu-ec8YiKW_32719sw62dei2BecuenZhFSt-NQvuiWk3_ANSyNzltM7R8h3hh7vwW_Y4Xg_2r2CAZaA0auOsQY1ead-0yqKsGyfNWYBv0TbCaKu8qpWRtdYIyva9FKoBLQmuBJU6R0-oKgEd4z5WFSxOgaRyQh-hHHPIJzvSDP5KgagE0564x7Sxzxd-HkuC:1tRpwB:I1iJgrtwQUeDLVbL-2KOsudAWeSoJ5_2rWm1W0q5zbE','2025-01-12 09:50:19.663863'),
('9egtyqlsrz516e5anzosl0c37l71vpz2','.eJxVjrsOgzAMRf8lMwqBvGjH7v0G5MSGpIVQ8Ziq_nsTiaEdfe_xsd-sh2MP_bHR2kdkV9aw6jdz4J-USoEPSOPC_ZL2NTpeEH62G78vSNPtZP8EAbaQt8lY7ywZQmVQd8qRbLWX9iIAO3JaWOMUqlZZ2RpDoNwwSKE0GJnhRmSp9_lIViXIw1SelRWL85ijeiaMUDcNf7zG3CaYCwl7OCb2-QJhTUh8:1tQ1wy:VgY4rsouyF-LjBVD6JYFsSGtFIt5PaZmkkmW3qWXJlE','2025-01-07 10:15:40.163676'),
('9lsfg34l933gzgzv4gh4s2upgez3zoc4','.eJxtUl1vnDAQ_CsrqlRcQjnu4CBN7vpQqZHy0Ke-VUgnYy_gFNaRP6pW0f332gclOSl-wPLO7Kw9zEt0ZM72R2dQH6WI7qJNlLytNYz_QgqAeGLUqZQrslo2aaCkM2rS70rg8HXmXgj0zPS-G8uKNxWWKIpS7G6LBvPtjufV54yJW2x2WVU2hSi2RZVvyxJZ0bRtnhU7VuaevMm8KOd-iJf6IIkPTiDsjRVSpf2Xmmpar-HBEbdSEVgFnA3cDcwitIxbpSUbwBlJHUiLmln5G2FE2ytRkyT7ynr8D8ehTCt4qQn8CieNxg0WDrC5n4qt0nDmyXPRb_sD0D3c3MilMay58foAcu48TZtG6zTNuIdO4SlBcGSS4ovh5Ma591n7cxvX0TfylwUWoAb1HdTRaqYYzigwrkQdJfDREwIyi7UQ-wLsIbu45CL7Q2n9N3ljnFBogJQF_CONPb-asJtMnGabtPbyy_gT4GDwXfGHRTVerF6BauFKgDT-exZKgm7y3l8JT1m9mnhhYzY56LMyhCwXSSTHzidmPaKQbD2oTn1qBp_S9Jk6zyI2hkD9lORCvqZ4Rad_Vkf8mw:1tR44h:1ega_U1NKVXt5azbf4qGaAzLYVB871SOKHrq1gn55-8','2025-01-10 06:43:55.732045'),
('a2gt7drsp0p8gpiz15aobe2wbekj54wc','.eJztG11v2zbwrxAeNiRb5Ei2LNlOlod9PPRhwLD2YRgCBLRE2WwkUqCopFnR_74jKclyLH8koZ0OTQqoIkXeF--Odzz6c-8Gl3JxUxZE3NC4N-15vbN23wxHt4SpD_FHzOa8H3EmBZ311ZB-9bXo_8Fjkv5SjV0BsMDFAmaTIIxmIQlI7AfxaOzPyHAwiobhxMXxmMxGbhjM_Ngf-OFwEAQE-7MkGbr-CAdDGOy5ADSKAAmAYhgaqSLWP-vRbA5d5xmJKT5P-Zw7sxTI6OdsDqMYztSMfygrFQAz_1KSTxILglGU4qL4-bqHI3KjOh3K8lJe99C9wDn08ySBBvDCIy4EieRqH86pxCn9lzTdRU7SNFqQ6Ba6EpwWRHXKh1QPyXFE5cMUuRcoASk6BUydIi__dIEWhM4Xsmrc01guqncpMCsSLrKpeU2xJCdu_ukMweP04rp3dXle83N1GdO7FabmpZREKHoFxc6CxjFh8EmKsk1YShJA7bZQj3xoKNiPAab4gQi0BO0sOxKexpTNHcLwLCVxC37DHPnJDbYz5fgjxdZOOirsEYgbdWDyfY2G59UrgBhcFjlmzciYFjnQPkWUpZQR0Boe3S7XYTDQs1ZwKgYdIGxOpGa4AKGbN54TpldCoYD_gNonk6wxGpLHY0PycAPJjDNyYRGf57kGoX8shEMj3qvRIRG2lMCrFSk4FsJJtYbhkRAO_Eqk4yOt4WAcGISTIyEcupVIPfdIMh0OK7vwvGPxGFZ66m1yV9YxTqpl9A7qbdoO2avX8aDupo0xqGzDO5a_Gbm1VA_qcFrrOBrVunpQj9PGGNZSPajLCYIlxkltHcfyOUFQSXVwUJ_TxjiupDo4qM9p6Wro1hGSPZ_TauNI0jviqCBrB-uhXzmGwdNcUfv5mKgiEjxNdQjcRLsq3FtFbwLg0bA_8HTshUQVsIaqMeNS8swEyF2xqMqICJMtFFviW68d3g7HXj8cryQAYTDZGXrngkL2kGExp8wE4F3j26PWgv2xN1RY72hBZzTVWYnJDox4t0h0SQaAvq0zgC4CWiu_Y-G1BqJWGlLJv5b4fvToDK6iZnPuYQSiYSN_VzLi1znWGlZg6mYueJnvl310AtgkFTVeG0B7wi15uOcC0qqrmCSVAaD1YRTWUNKE6iWJcBqVip-bgmZ5Cl9BUwUp5HZL3kHbD2xW5Bfrz3VicshKmV6bVL_C5JMa9XbKlfJGNMfpxuF5ySJZYkm5Anu2p0QECMMySEmzLSAbCYhaAqd74p92ebkn6WFHSvnUtUbwt05oIWF55vD5uqf-2SS0yUVfbjENlYqJX2tTQHJBkDEHVJtD3yoHdXJrmYMX09iVD1umcQpKjjPUWO8UfQBpN010EL-zvz9qaMUZL5lEJ3-eWpXq5JlWtp9Ule8yAsWMlSDNWn2_GrEqCtEJZSgnIgIXiefkDP1lVcbNOcdhZKycuZGxelN8UB5rlr4WGT8QLIoz9OHlUu06zLEtVUFkKSDaem8c7rtaY0_ev7PKQHM4ZJkBSxtc16GSna14GRYaUW8OWuwFY5vJqE_DwRFwNfPHp4dl9oE_N0BDr2XrG_g938wvpKCFxMxUI1iZgduK9Empa9XIwudGDVawT6z5qIhnmc7Yr74Dl5SXEiWCZzoyVDVLm-benHa-nGpLNvnz5hlFmee8qmklKhkxmUiSciz3sKA9_MoGDLruagnDMjf5Xe02elWPlO82uJcRr4k0p2i5iezlgqzGTM35t2UdfJbX_hbVr4rXj62FTX7QxOXfn76uJjZ1Ecua2Nri3zRxmybqrObo3nCZRens5TWUsKtU9iphTFM2sxvGLM-3Hp1tvVhyXQU4y-bbfTr9HEs-sEq_na7_b07XbdhqU_59FU_RlILteorfTDVVbwegrWX6chfRVU22WfHSpUzLu2Jy3fuwXglAtJgea3_soPvzfva7wd_sYx9f9okXXs3gmisALzK4pxaud42PSlHw9lVXUyp3TH_RRa751CK4ucNQXTTtrDr7quqsLWh5R0DXw1bvpUI-QTPtSJ24FPpFjXPdrNggi22XI2bYMNW0nLsW3RUVBu-umxBLEJSxlTL8CpjmrkPotm3mWbQuumSs74k8ktnWOx5PY2YVcMWaX59Ab2Dm8WR1g7yZbBraBNxHVyE6rmignBfUrDqeFTwtJXB7v6CSOGCKEZmiXBBzx1zdb15A-C0vEL8jAhKY-5WbHl8ZZRpkqu_4XJfuKPbfnm_Pt-fb8-35rT1ffet0NNrWNqU779QvqVZ2r2qsIDJarHXrX3g1fStXT1dHJjij6cPjXp5LGuFUwYHYvAu6g-OPZbEGDuJb1jEjIViWAnglUsLnopM7HVh2jOjcpv_-xv_acd4165315uqHiZ735T_LMoXV:1tR9le:QxpXA_F6SxW-cY6-fB3gS_uZb8W5SrMPz7JdMEzGJmY','2025-01-10 12:48:38.424388'),
('acf10o9k7zj90f3mdb0bxkdcouzu2ts9','.eJxVjr0SgyAQhN-F2iAKgkmZPi-QxjngRBKFjD9VJu-ec8YiKW_32719sw62dei2BecuenZhFSt-NQvuiWk3_ANSyNzltM7R8h3hh7vwW_Y4Xg_2r2CAZaA0auOsQY1ead-0yqKsGyfNWYBv0TbCaKu8qpWRtdYIyva9FKoBLQmuBJU6R0-oKgEd4z5WFSxOgaRyQh-hHHPIJzvSDP5KgagE0564x7Sxzxd-HkuC:1tRTNa:oFrPvXC5h-l25x_OuLVjFJMDszI1RMnRfAuNzasOeL4','2025-01-11 09:45:06.893865'),
('au2yoj5p8kniljy05zcjf3ywqn8psrsb','.eJx9VE1vm0AQ_SsjokoQuRjbGKdIvfTjkEOlqvEpQrIGGOxtlwUtyyGK8t87u5gk_iAgrYB5-97MY2afvR325rDrO9I7UXqpt_Bm77_lWPwjZQPlX1T7JiwaZbTIQwsJj9Eu_NWUJL8dsScEB-wOvJuSTZFvKKEyTsr1XZzTarkuVpsvEZZ3lK-jTZLHZbyMN6tlkhDGeVWtoniNyYrBi4hJi4JFbCJUQYGy6CUa2nWibiXthDKkqTN-q4UqRItyBprjMzCipkxlfRRhdLkGaaaAr8xzt3v-PpKDORAMAjAKhEe8W9MWNdbwqpnClne8vgLWTa8M-L-DE7xNbICiUj3jRnIXAV8omM54am1JF6QM7rnmP6d61oJBzz4BI0VTOpknQt3NYDviNZleqxQehqLvx7z8h_vg0qgBDW-ew-1Qwa0TCmAOiyjK1A0Ttb2BSje189R2Rqbetn2FSjZoOCOG-Zn30-o65LmX076knFrASboEpgmvOj7Nak36FIzczr5p7qvuftR7R9qbdy131m6ZOmtwlp9s_g_KuDoWTvqH6FqJT64AJumlGf6M8avM214OAIguhecz5RcuJFM8pNIeIvHME_WeR3VeUylwLpt98zmXfDyErdozSmFtJ_lRqN4O9jDX3st_mMWCdQ:1tRAOO:YYfj84aV_P7xF0A1TiyjpaWpe-K_7L3e9-S3OF-mHgY','2025-01-10 13:28:40.830433'),
('eezaf1xp2gonwxl6em5pcch0hy4cxuj9','.eJxtUk1v2zAM_SuEhw5O6zlO7Nhdm-wwYAV62Gm3wUAgS7StzqYKfQwbivz3SbHnNkB1kCC-x0fxiS_RkTnbH51BfZQiuos2UfI21jD-CykA4olRp1KuyGrZpIGSzqhJvyuBw9eZeyHQM9P7bCwr3lRYoihKsbstGsy3O55XnzMmbrHZZVXZFKLYFlW-LUtkRdO2eVbsWJl78ibzopz7Il7qgyQ-OIGwN1ZIlfZfaqppvYYHR9xKRWAVcDZwNzCL0DJulZZsAGckdSAtamblb4QRba9ETZLsK-vxPxyHMK3gpSbwK9w0GjdYOMDmfgq2SsOZJ89Bf-wPQPdwcyOXxLDmxOsDyDnzNB0ardM04x46hVaC4MgkxRfFyY1z7rP29zauo2_kHwssQA3qO6ij1UwxnFFgXIk6SuCjJwRkFmsh9gHYQ3bxyEX2h9L6b_LGOKHQACkL-Ecae-6asJtMnGqbtPbyS_kT4GDwXfGHRTVerF6BauFKgDR-PwslQTd571dCK6tXEy9szCYH_awMYZaLJJJj5ydmPaKQbD2oTn1qBj-l6TN1nkVsDAP1U5KLTv8AhF76Eg:1tQk8W:jzEJKwHm9UyGAhlzeGy10ha6f1mnaBvrP8awK9DkMWg','2025-01-09 09:26:32.179245'),
('eyx7l6t7y4buurjojb1n8vcyfel5m3k0','.eJytVN1r2zAQ_1cOjw6n9RwncZyuTfYwWGEPe9pbMQRZOtva7FPRx9go-d8nxa7XsDAYRA8Sd7_ffehOp-doz5xt986g3ksR3UWLKHmtqxj_jhQA8Y1Ro1KuyGpZpYGSjqhJvyiB3ceRe-KgZab11lhseLXBAkVeiPVtXuFquearzfuMiVus1tmmqHKRL_PNalkUyPKqrldZvmbFypMXmXfKuQ_iXb2RxDsnELbGCqnS9kNJ8zk8OOJWKgKrgLOOu45ZhJpxq7RkHZRUuixj2d-7M5IakBY1s_IHQo-2VaIkSfaP_ecXOA5qmsFzSeBXkDQa11nYweJ-UNZKw5Enj0p_bHdA93BzIyfDsEbD6x3I0fIwHBqt0zTiHjoM2fRMUnwSmlw_Wj5pL9dxGX0inyqwAFWo76CMZiPFcEaBcSXKKIG3nvCCyBpiL8IWspMEJ6dflda_klflFArNP2r6vzspC_hTGnusHWEztOKCAY7VMGnpXU4FOQB2Bs9e-GG6aTy1fnbBfFQNVwKk8fsxpST0K7lggDMvNzR8dvahZcMb81PWhV8gTyLZN37W5j0KyeadatS7qvPznT5R41nE-jCKj5JcmMxhMKPDb8utWNw:1tR6c1:T97WMfVStma0P_zyOBKgc4pKljoap-fs_oFGDKVribU','2025-01-10 09:26:29.827581'),
('hl21naqen7n3x4rtj341mqsiu3nmccnm','.eJxVjr0SgyAQhN-F2iAKgkmZPi-QxjngRBKFjD9VJu-ec8YiKW_32719sw62dei2BecuenZhFSt-NQvuiWk3_ANSyNzltM7R8h3hh7vwW_Y4Xg_2r2CAZaA0auOsQY1ead-0yqKsGyfNWYBv0TbCaKu8qpWRtdYIyva9FKoBLQmuBJU6R0-oKgEd4z5WFSxOgaRyQh-hHHPIJzvSDP5KgagE0564x7Sxzxd-HkuC:1tRmdp:6Qmx5A9fEoVLuWyUkhpGi_AaTTjSCT-IThx6sSWQwIM','2025-01-12 06:19:09.314684'),
('ibp21rvj63gh8vnkgk02r8v9q47ba5s4','.eJxVjr0SgyAQhN-F2iAKgkmZPi-QxjngRBKFjD9VJu-ec8YiKW_32719sw62dei2BecuenZhFSt-NQvuiWk3_ANSyNzltM7R8h3hh7vwW_Y4Xg_2r2CAZaA0auOsQY1ead-0yqKsGyfNWYBv0TbCaKu8qpWRtdYIyva9FKoBLQmuBJU6R0-oKgEd4z5WFSxOgaRyQh-hHHPIJzvSDP5KgagE0564x7Sxzxd-HkuC:1tRmGg:jcuKlAVZjX2SRjzogbfhCk27m_KDVyVZ1m5BbHHYwv8','2025-01-12 05:55:14.190350'),
('o4l21nkdt1y5g10950nha8cynvechrwc','.eJxVjr0SgyAQhN-F2iAKgkmZPi-QxjngRBKFjD9VJu-ec8YiKW_32719sw62dei2BecuenZhFSt-NQvuiWk3_ANSyNzltM7R8h3hh7vwW_Y4Xg_2r2CAZaA0auOsQY1ead-0yqKsGyfNWYBv0TbCaKu8qpWRtdYIyva9FKoBLQmuBJU6R0-oKgEd4z5WFSxOgaRyQh-hHHPIJzvSDP5KgagE0564x7Sxzxd-HkuC:1tRmu8:-CEOv13MfRCJ-MVh2RM62ZACxj6Cfqlk6XJi15MYKNM','2025-01-12 06:36:00.655604'),
('qzbddgs9y9xzozgtjfeznl3nxfplyofy','.eJxVjr0SwiAQhN-FOpIYCERLe1_AJnPAhaAJOPmpHN_dY0yh3d3t7nf7Yh1s69BtC85dcOzMjqz4vRmwD4xZcHeIPnGb4joHw7OF7-rCr8nheNm9f4ABloHSqLQ1GhU6qVzTSoOibqzQpwpci6aptDLSyVpqUSuFIE3fi0o2oASZjxVBraUnhIpAy5jLyoKFydOpnNAFKMfk08GMVIM_oydXhCknbiFuGfDN0-Rzun1_APYJUCE:1tRTAE:qEX6OI6RXhFWgGiIPUabhR3Hwoxp0-FkG5baE9AuiTk','2025-01-11 09:31:18.168395'),
('sjr1oqi88t25i5yf6bhev64cebrtpi5c','.eJxVj81OwzAQhF_F-NRKxU0Tx2nhxolLT71BULT-aWJw7Ch2QKjKu7NRiwR7We3ON-P1hTYwpa6Zohkbq-kD3dHN350E9WH8Iuh38G1gKvg0WskWhN3UyI5BG_d0Y_8FdBA7dBtRKVkZYTQXutxzaYq8VEV1yEDvjSyzSkiuec6rIhfCAJfnc5HxEkSB8C7DUKXwEYzygINbjuUbavsWV9veaAtbF9pwLx2ewQbfIuWhXxwv1k9LwNWvHMRIjmA9udSeYA2TdFaRmCBh-wxWkx7l1Ql_6tvXNwJjG9e_9FKn75hMz8KU2IBMcn5V02fjXCBfYXT6rqbrxys-z7Wn8w9oA3RO:1tRpuL:tBFpDBnadlXGOy8BySDfjsJad3GbzENrdpHBHCSVYl0','2025-01-12 09:48:25.379669'),
('syvbl19ogvg4fq0w7aqwb2z3lnoagugd','.eJxVjr1uwzAMhF-l1dQCqeJYspRmzJQlc4HCgEGJjK1WlgL_TEHevRSaoR15993xbqKDdRm6daapCygOYic2fzUH_ptSMfALUp-lz2mZgpMFkQ93lueMFI8P9l_BAPPAaTLWO0uGUBts9tqRqhuv7HsFuCfXVNY4jbrWVtXGEGh3uahKN2AUw7uKS73nJ1yVgI9YxuqNCGPP0nYkDLCNuc9vLvIMeU09UwnGkvgMaS0Fv_nrFNLy0ooTxfz0kaeIz614bZO4_wA6rlYg:1tRmSh:r0EzRvy5xt8Rv4L8f-I9z8nkwn7ICmcZ0MgOL5GzeEE','2025-01-12 06:07:39.874781'),
('upu8rwbuw60cjw8s3hz4c3p4spk8dah7','.eJxVjr0SgyAQhN-F2iAKgkmZPi-QxjngRBKFjD9VJu-ec8YiKW_32719sw62dei2BecuenZhFSt-NQvuiWk3_ANSyNzltM7R8h3hh7vwW_Y4Xg_2r2CAZaA0auOsQY1ead-0yqKsGyfNWYBv0TbCaKu8qpWRtdYIyva9FKoBLQmuBJU6R0-oKgEd4z5WFSxOgaRyQh-hHHPIJzvSDP5KgagE0564x7Sxzxd-HkuC:1tRYZt:RX0marF4kH1qAa07CSHd6rh3ghRpVfCjb1xXMmYfJDg','2025-01-11 15:18:09.641296'),
('vmn2042tfgutisgtfg9kzhckdsxwtxlm','.eJzVkN1KAzEQhV8l5qqFmt12s9mqd155UxB6IehKyc90N5pNyiYrSOm7O8GKik_gEAjkfGcyZ450J6fU76YI484aek2XdPHzTUn9Cj4L5kX6LjAdfBqtYhlhZzWyTTDgbs_srwa9jD26QTRaNSDAcGHqNVdQrWpdNVelNGtQddkIxQ1f8aZaCQGSq_2-KnktRYXwssSmWuMn2OowKWc10U7GSDbSenJsPcE6CzHJhNdbsIYMKM-2OLDvnp6JHLs4_6JzFQW5Ry2Rlt6Bc2FBHsLozEVLSQok9UAwbgwOvi3b95hgYGFK7JCtzs_-mOc3n_yp9XhwdJdXyxfUDh0GKAYwVhYudOFSOVwaO_gOKS-HnO_R-inH_Z9pMe_pA-NIwBg:1tRqaM:VvdppxqesNByMSZdDMXg7yx_cjb5C9UwmcNbsQmrzOs','2025-01-12 10:31:50.619375'),
('vo4h72h6jo5iha3d8fu1noyot81mk1aq','.eJxtUk1v2zAM_SuEhw5O6zlO7Nhdm-wwYAV62Gm3wUAgS7StzqYKfQwbivz3SbHnNkB1kCC-x0fxiS_RkTnbH51BfZQiuos2UfI21jD-CykA4olRp1KuyGrZpIGSzqhJvyuBw9eZeyHQM9P7bCwr3lRYoihKsbstGsy3O55XnzMmbrHZZVXZFKLYFlW-LUtkRdO2eVbsWJl78ibzopz7Il7qgyQ-OIGwN1ZIlfZfaqppvYYHR9xKRWAVcDZwNzCL0DJulZZsAGckdSAtamblb4QRba9ETZLsK-vxPxyHMK3gpSbwK9w0GjdYOMDmfgq2SsOZJ89Bf-wPQPdwcyOXxLDmxOsDyDnzNB0ardM04x46hVaC4MgkxRfFyY1z7rP29zauo2_kHwssQA3qO6ij1UwxnFFgXIk6SuCjJwRkFmsh9gHYQ3bxyEX2h9L6b_LGOKHQACkL-Ecae-6asJtMnGqbtPbyS_kT4GDwXfGHRTVerF6BauFKgDR-PwslQTd571dCK6tXEy9szCYH_awMYZaLJJJj5ydmPaKQbD2oTn1qBj-l6TN1nkVsDAP1U5KLTv8AhF76Eg:1tR1ua:TBqkSLYW3a_GrgXt1z2h6B8NCFvfYbuUzSn10Zs4wYA','2025-01-10 04:25:20.844015'),
('xrhg1wyrfqglovsvoc50cf6r1pneimof','.eJxVjr0SgyAQhN-F2iAKgkmZPi-QxjngRBKFjD9VJu-ec8YiKW_32719sw62dei2BecuenZhFSt-NQvuiWk3_ANSyNzltM7R8h3hh7vwW_Y4Xg_2r2CAZaA0auOsQY1ead-0yqKsGyfNWYBv0TbCaKu8qpWRtdYIyva9FKoBLQmuBJU6R0-oKgEd4z5WFSxOgaRyQh-hHHPIJzvSDP5KgagE0564x7Sxzxd-HkuC:1tRTMS:z7M__hHtAokJ_VE6KMS2VXnsLp1Ev_VYyMJEA7KJymM','2025-01-11 09:43:56.364249');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
