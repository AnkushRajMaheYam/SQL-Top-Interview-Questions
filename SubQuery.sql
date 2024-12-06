--1-- 
/*
DISPLAY ALL THE EMPLOYEES WHOSE DEPARTMENT NAMES ENDING 'S'.
*/


SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE DNAME LIKE '%S');



--2--
/*
QUERY TO DISPLAY THE EMPLOYEE NAMES WHO IS HAVING MAXIMUM SALARY IN DEPT NAME "ACCOUNTING".
*/
SELECT ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
                FROM EMP) AND DEPTNO  (SELECT DEPTNO
                                            FROM DEPT 
                                                WHERE DNAME = 'ACCOUNTING');


/*

SELECT ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL)
                FROM EMP
                   WHERE DEPTNO IN (SELECT DEPTNO
                                        FROM DEPT
                                            WHERE DNAME = 'ACCOUNTING'));
*/

--3--
/*
QUERY TO DISPLAY THE DEPT NAME WHO IS HAVING HIGHEST COMMISSION.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                          WHERE COMM = (SELECT MAX(COMM)
                                                FROM EMP));
--4--
/*
QUERY TO DISPLAY THE EMPLOYEE NAMES WHOSE DEPARTEMENT NAME HAS 2ND CHARACTER AS 'O'
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                           WHERE DNAME LIKE '_O');

--5--
/*
QUERY TO DISPLAY ALL THE EMPLOYEES WHO'S DEPT NUMBER IS SAME AS SCOTT.
*/
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                            WHERE ENAME = 'SCOTT');

--6--
/*
QUERY TO DISPLAY ALL THE EMPLOYEES IN 'OPERATION' AND 'ACCOUNTING' DEPT.
*/
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                            WHERE DNAME IN ('OPERATION', 'ACCOUNTING'));

--7--
/*
LIST THE EMPLOYEES WHO HAS SALARY GREATER THAN MILLER.
*/
SELECT *
FROM EMP
WHERE SAL>(SELECT SAL
                FROM EMP
                    WHERE ENAME = 'MILLER');

--8-- 
/*
LIST DEPARTMENT NAME HAVING ATLEAST 3 SALESMAN.
*/
SELECT DNAME
FROM DEPT
WHERE DNAME = 'SALESMAN'
GROUP BY DNAME
HAVING COUNT(*) >= 3;

--OR
SELECT DNAME FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'SALESMAN' GROUP BY DEPTNO HAVING COUNT(*)>=3); 👍👍👍

--9--
/*
DISPLAY THE DNAME OF AN EMPLOYEES WHO HAS NO REPORTING MANAGER.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE MGR IS NULL );

--10--
/*
LIST ALL THE EMPLOYEES WHO ARE REPORTING TO JONES MANAGER.
*/
SELECT *
FROM EMP
WHERE MGR = (SELECT MGR
                 FROM EMP
                    WHERE ENAME = 'JONES');


--11-- ***
/*
LIST EMPLOYEES FROM RESEARCH & ACCOUNTING HAVING ATLEAST 2 REPORTING.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                            WHERE DNAME IN ('ACCOUNTING', 'RESEARCH') AND EMPNO IN (SELECT MGR
                                                                                            FROM EMP
                                                                                                    GROUP BY MGR
                                                                                                        HAVING COUNT(*)>=2));


--12--
/*
DISPLAY THE DEPARTMENT OF THE EMPLOYEE WHOSE NAME DOES NOT STARTS WITH 'S' AND SALARY BETWEEN 1500 TO 3000.
*/
SELECT DEPTNO
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                          WHERE ENAME NOT LIKE 'S%' AND SAL BETWEEN 1501 AND 2900);


--13--
/*
DISPLAY LOCATION OF EMPLOYEE WHOSE SALARY IS MINIMUM SALARY BUT SALARY IS GREATER THAN 2000.
*/
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE SAL = (SELECT MIN(SAL)
                                            FROM EMP
                                                WHERE SAL > 2000 ));


--14--
/*
DISPLAY THE LOCATION OF AN EMPLOYEE IN ACOOUNTING DEPARTMENT.
*/
SELECT LOC
FROM DEPT
WHERE DNAME = 'ACCOUNTING';


--15--
/*
DISPLAY THE DEPARTMENT'S LOCATION THAT IS HAVING GREATER THAN FOUR EMPLOYEES IN IT.
*/
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        GROUP BY DEPTNO
                          HAVING COUNT(ENAME)>4);

--16--
/*
WRITE A QUERY TO DISPLAY ALL THE EMPLOYEE WHOSE JOB NOT SAME AS ALLEN AND SALARY IS GREATER THAN MARTIN.
*/
SELECT ENAME
FROM EMP
WHERE JOB NOT IN (SELECT JOB
                      FROM EMP
                          WHERE ENAME = 'ALLEN') AND SAL > (SELECT SAL
                                                              FROM EMP
                                                                  WHERE ENAME = 'MARTIN');


--17--
/*
DISPLAY ALL THE EMPLOYEES WHO IS HAVING LOCATION IS SAME AS ADAM'S MANAGER.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                  FROM DEPT
                      WHERE LOC IN (SELECT LOC
                                      FROM DEPT
                                          WHERE DEPTNO IN (SELECT DEPTNO
                                                              FROM EMP
                                                                 WHERE EMPNO IN (SELECT MGR
                                                                                        FROM EMP
                                                                                           WHERE ENAME = 'ADAMS'))));




--18-- ***
/*
DISPLAY THE JOB, MANAGER NUMBER OF EMPLOYEES WHO IS WORKING FOR JONES.
*/
SELECT JOB, MGR
FROM EMP
WHERE MGR = (SELECT EMPNO
                FROM EMP
                  WHERE ENAME = 'JONES');

--19--
/*
DISPLAY THE EMPLOYEE NAMES, HIGHER DATE, COMMISSION OF FORD'S MANAGER.
*/
SELECT ENAME, HIREDATE, COMM
FROM EMP
WHERE EMPNO = (SELECT MGR
                FROM EMP
                    WHERE ENAME = 'FORD');


--20--
/*
DISPLAY THE NUMBER OF EMPLOYEES WHO ARE GETTING SALARY LESS THEN THE BLAKE'S MANAGER.
*/
SELECT COUNT(*)
FROM EMP
WHERE SAL < (SELECT SAL
                  FROM EMP
                      WHERE EMPNO IN (SELECT MGR
                                        FROM EMP
                                            WHERE ENAME IN 'BLAKE'));



--21--
/*
LIST EMPLOYEES WHO LOCATED IN CHIAGO AND THEIR COMMISSION IS ZERO.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                      FROM DEPT
                          WHERE LOC = 'CHICAGO' ) AND COMM IS NULL;


--22--
/*
LIST EMPLOYEES WHO WORK FOR SALES DEPARTMENT AND THEIR SALARY GREATER THAN AVERAGE SALARY OF THEIR DEPRATMENT.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE DNAME='SALES') AND SAL > (SELECT AVG(SAL)
                                                            FROM EMP
                                                                WHERE DEPTNO IN (SELECT DEPTNO
                                                                                        FROM DEPT
                                                                                           WHERE DNAME = 'SALES'));

--23--
/*
LIST EMPLOYEES WHO ARE WORKING IN RESEARCH DEPARTMENT AND THEY ARE MANAGER.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE DNAME='RESEARCH') AND JOB ='MANAGER';
--24--
/*
DISPLAY DEPARTMENT NAME OF THE EMPLOYEES WHO EARN COMMISSION.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE COMM IS NOT NULL);


--25--
/*
DISPLAY DEPARTMENT NAME OF THE EMPLOYEE WHO EARN MAXIMUM SALARY AND HAVE NO REPORTING MANAGER.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE SAL = (SELECT MAX(SAL)
                                            FROM EMP) AND MGR IS NULL);

--26-- ***
/*
DISPLAY EMPLOYEE DETAILS WHO ARE REPORTING TO BLAKE AND HAVE COMMISSION WITHOUT USING NULL OR NOT NULL.
*/
SELECT *
FROM EMP
WHERE MGR = (SELECT EMPNO
                  FROM EMP
                      WHERE ENAME = 'BLAKE') AND COMM >0;

--27-- *** use only in operetor
/*
LIST ALL THE DEPTNAME AND LOC OF ALL THE SALESMAN MANAGER - MANAGERS.
*/
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                      FROM EMP
                        WHERE EMPNO IN (SELECT MGR
                                          FROM EMP
                                             WHERE EMPNO IN (SELECT MGR
                                                                  FROM EMP
                                                                     WHERE JOB='SALESMAN')));


--28-- ***
/*
LIST THE EMPLOYEE DEPTNAME AND LOC OF ALL THE EMPLOYEES WHO ARE CLERK REPORTING TO BLAKE AND SALARY IS LESSER THAN MARTIN SALARY.
*/
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                      WHERE JOB = 'CLERK' AND MGR IN (SELECT EMPNO
                                                            FROM EMP
                                                                WHERE ENAME = 'BLAKE') AND SAL < (SELECT SAL
                                                                                                      FROM EMP
                                                                                                          WHERE ENAME='MARTIN'));

--29--???
/*
LIST THE EMPLOYEES WHO DOES NOT DIRECTLY REPORT TO PRESIDENT HAVE COMMISSION AND SALARY MORE THAN MAX SALARY OF ALL THE CLERK WITHOUT USING NULL OR NOT NULL.
*/

SELECT ENAME
FROM Emp
WHERE MGR != (
    SELECT EMPNO
        FROM Emp
            WHERE JOB = 'PRESIDENT') AND COMM > 0 AND SAL > (SELECT MAX(SAL)
                                                                FROM Emp
                                                                    WHERE JOB = 'CLERK');

--30--??
/*
LIST THE EMPLOYEES WHO JOINED AFTER 2 YEARS OF FIRST EMPLOYEE OF THE COMPANY AND MORE THAN BLAKE SALARY.
*/
SELECT ENAME
WHERE HIREDATE > (SELECT ADD_MONTHS(MIN(HIREDATE), 24)
                        FROM Emp) AND SAL > (SELECT SAL
                                                FROM Emp
                                                    WHERE ENAME = 'BLAKE');

--31--
/*
DISPLAY LOCATION OF ALL THE EMPLOYEES WHO REPORTING TO BLAKE.
*/
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                            WHERE MGR IN (SELECT EMPNO
                                                FROM EMP
                                                        WHERE ENAME = 'BLAKE'));

--32--
/*
LIST ALL THE EMPLOYEES WHOSE JOB IS SAME AS JONES AND THEIR SALARY LESSER THAN SCOTT.
*/
SELECT ENAME
FROM EMP
WHERE JOB = (SELECT JOB
                    FROM EMP
                        WHERE ENAME = 'JONES') AND SAL< (SELECT SAL
                                                                FROM EMP
                                                                    WHERE ENAME = 'SCOTT');

--33-- **
/*
DISPLAY ALL THE EMPLOYEES OF DEPARTMENT 30, 20 WITH THERE ANUAL SALARY AND HAVING ATLEAST 3 EMPLOYEES.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                            WHERE DEPTNO IN (20,30) AND SAL*12 IS NOT NULL
                              GROUP BY DEPTNO
                                HAVING COUNT(*)>=3);


--34--
/*
DISPLAY ALL THE EMPLOYEES WHO ARE EARN LESS THAN ANY OF THE SALESMAN.
*/
SELECT ENAME
FROM EMP
WHERE SAL<ANY(SELECT SAL
                FROM EMP
                    WHERE JOB='SALESMAN');

--35--**
/*
FIND 3RD MINIMUM SALARY IN THE EMPLOYEE TABLE.
*/
SELECT ENAME
FROM EMP
WHERE HIREDATE < (SELECT MAX(HIREDATE)
                    FROM EMP);

--36--
/*
DISPLAY ALL THE EMPLOYUEES WHO ARE EARNING MORE THAN ANY OF THE MANAGER.
*/

SELECT ENAME
FROM EMP
WHERE SAL> ANY(SELECT SAL
                    FROM EMP
                       WHERE JOB='MANAGER');

--37--???
/*
LIST EMPLOYEES WHO JOINED AFTER 4 YEARS OF 1ST EMPLOYEE OF THE COMPANY AND LESS THAN BLAKE SALARY.
*/

--38--*
/*
DISPLAY THE DEPARTMENT INFORMATION OF EMPLOYEE WHO IS WORKING FOR NEW YORK LOCATION.
*/
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE LOC='NEW YORK');


--39--
/*
DISPLAY LOCATION OF EMPLOYEES, WHOSE NAME DOESN'T START WITH A AND SALARY BETWEEN 1000 AND 3000.
*/
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE ENAME NOT LIKE 'A%' AND (SAL BETWEEN 1001 AND 3001));

---40--
/*
DISPLAY DEPARTEMENT NAME OF ALL THE EMPLOYEES WHO ARE REPORTING TO BLAKE.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE MGR = (SELECT EMPNO
                                        FROM EMP
                                            WHERE ENAME = 'BLAKE'));


--41--***
/*
DISPLAY MARTIN'S MANAGER'S MANAGER'S DEPARTMENT NAME AND LOCATION.
*/
SELECT DNAME, LOC
FROM DEPT  
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                            WHERE MGR = (SELECT EMPNO
                                            FROM EMP
                                                WHERE MGR = (SELECT EMPNO
                                                                    FROM EMP
                                                                        WHERE ENAME = 'MARTIN')));

--42--
/*
DISPLAY THE MANAGER NUMBER, JOB AND DEPARTMENT NUMBER FOR THOSE WHO DON'T HAVE COMMISSION IN THE LOCATION DHICAGO OR DALLAS.
*/

SELECT MGR, JOB, DEPTNO
FROM EMP
WHERE COMM IS NULL AND DEPTNO IN (SELECT DEPTNO
                                    FROM DEPT
                                        WHERE LOC IN ('CHICAGO', 'DALLAS'));


--43--
/*
DISPLAY THE EMPLOYEE DETAILS WITH THEIR ANNUAL SALARY WHO EARN MAXIMUM COMMISSION.
*/

SELECT EMP.*, SAL*12 AS ANNUAL_SAL
FROM EMP
WHERE COMM = (SELECT MAX(COMM)
                    FROM EMP);


--44-- **
/*
DISPLAY ALL THE EMPLOYEE WHOSE DEPARTMENT IS SALES AND WHO IS EARNING SOME COMMISSION (I.E. COMMISSION IS NOT NULL OR ZERO) AND WHO IS HIRED BEFORE THE LAST PERSON HIRED.
*/

SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE DNAME='SALES') AND COMM IS NOT NULL AND HIREDATE < (SELECT MAX(HIREDATE)
                                                                                            FROM EMP);


--45--?**? // NOTE :- IF YOU FIND MANAGER THEN MGR INSIDE THE BLOCK(EMPNO=(MGR)) AND WHEN FIND EMPLOYEE THEN EMPNO INSIDE THE BLOCK(MGR=(EMPNO))
/*
DISPLAY ALL THE DEPARTMENT NAMES FOR WARD'S MANAGER'S MANAGER.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                    FROM EMP
                        WHERE EMPNO=(SELECT MGR
                                        FROM EMP
                                            WHERE EMPNO =(SELECT MGR
                                                             FROM EMP
                                                                WHERE ENAME='WARD')));


--46--?**?
/*
DISPLAY DEPARTEMENT NAMES OF EMPLOYEES WHOSE SALARY IS GRATER THAN AVERAGE SALARY OF ALL THE CLERK'S.
*/

SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE SAL > (SELECT AVG(SAL)
                                            FROM EMP
                                                WHERE JOB = ALL 'CLERK'));


--47-- **??**
/*
DISPLAY THE LAST EMPLOYEE RECORD WITH 25% HIKE IN SALARY.
*/
SELECT ENAME
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE)
                        FROM EMP) AND SAL = SAL+(SAL*25/100);

--48--
/*
DISPLAY THE DEPARTEMENT NUMBER WHO WORKING IN SALES DEPARTMENT AND THEY ARE MANAGER.
*/
SELECT DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE DNAME = 'SALES') AND JOB = 'MANAGER';


--49--
/*
DISPLAY DEPARTMENT NAME OF THE EMPLOYEE WHO EARN MINIMUM SALARY AND HAVE REPORTING MANAGER.
*/

SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE SAL = (SELECT MIN(SAL)
                                        FROM EMP) AND MGR IS NOT NULL);

--50--
/*
DISPLAY HIREDATE AND JOB OF ALL THE EMPLOYEES WORKING FOR SALES
*/

SELECT HIREDATE, JOB
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE DNAME = 'SALES');


--51--
/*
DISPLAY LOCATION AND DNAME OF EMPLOYEE WHO WORKING AS PRESIDENT.
*/

SELECT LOC, DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE JOB = 'PRESIDENT');

--52-- **??**
/*
DISPLAY THE DNAME OF EMPLOYEES WHOES SALARY IS MAXIMUM SALARY BUT LESSER THAN 3000.
*/

SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                       WHERE SAL = (SELECT MAX(SAL)
                                            FROM EMP) AND SAL < 3000);

--53-- //REPORTING THEN INSER EMPNO IN SUB QUERY
/* ?***
DISPLAY THE DEPARTMENT NAME WHO ARE REPORTING TO ADAMS. 
*/

SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                       WHERE MGR = (SELECT EMPNO
                                        FROM EMP
                                          WHERE ENAME = 'ADAMS'));


--54--??
/*
DISPLAY LAST EMPLOYEE RECORD ACCORDING TO EMPNO.
*/

SELECT *
FROM Emp
WHERE EMPNO = (SELECT MAX(EMPNO)
                    FROM Emp);



--55--
/*
DISPLAY ALL THE EMPLOYEE WHOSE SALARY IS GREATER THAN AVERAGE SALARY OF DEPARTEMENT 30.
*/
SELECT ENAME
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
                    FROM EMP
                       WHERE DEPTNO = 30);

--56--
/*
DISPLAY THE NUMBER OF EMPLOYEES WHO WORK FOR RESEARCH DEPT AND THEIR SALARY IS LESSER THAN ONE OF THE SALARY IN DEPARTEMENT IN 10.
*/
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                            WHERE DNAME='RESEARCH') AND SAL < ANY (SELECT SAL
                                                                    FROM EMP
                                                                        WHERE DEPTNO = 10);


--57--
/*
DISPLAY THE DNAME THAT ARE HAVING CLEARK IN IT.
*/

SELECT DNAME
FROM Dept
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM Emp
                        WHERE JOB = 'CLERK');

--58--???
/*
DISPLAY THE DEPARTEMENT NAMES THAT ARE HAVING ATLEAST ONE L IN IT.
*/
SELECT DNAME
FROM DEPT
WHERE DNAME LIKE '%L%'
GROUP BY DNAME
HAVING COUNT(DNAME) > = 1;

--59--
/*
DISPLAY ALL THE EMPLOYEES WHO ARE JOINED AFTER BLAKE.
*/
SELECT ENAME
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE
                    FROM EMP
                        WHERE ENAME = 'BLAKE');

--60--???
/*
LIST THE DEPT NAME THAT ARE HAVING AT LEAST 3 EMPLOYEES BUT NOT MORE THAN 5 EMPLOYEES IN IT.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                            GROUP BY DEPTNO
                                HAVING COUNT(*)>=3 AND COUNT(*)<=5 );

  --OR--
SELECT D.DNAME
FROM Dept D
WHERE D.DEPTNO IN ( SELECT E.DEPTNO
                        FROM Emp E
                            GROUP BY E.DEPTNO
                                HAVING COUNT(*) BETWEEN 3 AND 5);

--61--??
/*
DISPLAY THE LOCATION OF ALL EMPLOYEE WHOSE REPORTING MANAGER SALARY IS GREATER THAN 2000.
*/
SELECT LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE MGR IN (SELECT EMPNO
                                            FROM EMP
                                                WHERE SAL >2000));

--62--??
/*
SELECT THE EMPLOYEES WHOSE DNAME IS HAVING AT LEAST TWO E IN IT.
*/
SELECT DNAME
FROM DEPT
WHERE DNAME LIKE '%E%E%'; --NOT USE '%EE%



--63--
/*
DISPLAY ENAME, SAL OF EMPLOYEES WHO ARE EARNIG MORE THAN ANY OF THE ANALYST.
*/
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL
                    FROM EMP
                        WHERE JOB = 'ANALYST');




--64--
/*
SELECT ALL THE EMPLOYEES WHO ARE WORKING FOR CHICAGO.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                            WHERE LOC = 'CHICAGO');



--65--
/*
QUERY TO DISPLAY EMPLOYEE NAMES WHO IS HAVING MINIMUM SALARY IN DEPARTEMENT RESEARCH.
*/
SELECT ENAME
FROM EMP
WHERE SAL = (SELECT MIN(SAL)
                FROM EMP
                    WHERE DEPTNO IN (SELECT DEPTNO
                                        FROM DEPT
                                            WHERE DNAME='RESEARCH'));

--66--
/*
LIST THE DEPARTEMENT NAMES THAT ARE HAVING SALESMAN.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                        WHERE JOB = 'SALESMAN');

--67--
/*
LIST THE DEPENDENT NAMES THAT ARE HAVING AT LEAST 3 EMPLOYEE IN IT.
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                          GROUP BY DEPTNO
                            HAVING COUNT(*)>=3);

--68-- ??
/*
LIST EMPLOYEE FORM RESEARCH AND ACCOUNTING DEPARTEMENT HAVING ATLEAST TWO REPORTING.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE DNAME IN ('RESEARCH','ACCOUNTING')) AND EMPNO IN (SELECT MGR
                                                                                        FROM EMP
                                                                                                GROUP BY MGR
                                                                                                    HAVING COUNT(*)>=2);





--69--
/*
WRITE A QUERY TO DISPLAY EMPLOYEE NAME, JOB, LOCATION OF ALL EMPLOYEES WHO ARE WORKING AS MANAGER AND WORKS AT CHICAGO.
*/

SELECT E.ENAME, E.JOB, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.JOB = 'MANAGER' AND D.LOC = 'CHIAGO';


--70--
/*
SELECT ENAME OF EMPLOYEE WHO EARNS 2ND MAX SALARY AND WORKS FOR LOCATION DALLAS.
*/
SELECT ENAME
FROM EMP
WHERE SAL < (SELECT MAX(SAL)
                    FROM EMP
                        ) AND DEPTNO IN (SELECT DEPTNO 
                                                FROM DEPT
                                                    WHERE LOC='DALLAS');
SELECT ENAME FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP) AND DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
--71--
/*
WRITE A QUERY TO DISPLAY THE EMPLOYEE INFORMATION WHO IS NOT TAKING COMMISSION AND JOINED COMPANY AFTER JULY 83
*/
SELECT *
FROM EMP
WHERE COMM IS NULL AND HIREDATE > '31-JULY-83';

-- OR
SELECT *
FROM Emp
WHERE (COMM IS NULL OR COMM = 0)
AND HIREDATE > TO_DATE('31-JUL-1983', 'DD-MON-YYYY');



--72-- **
/*
LIST EMPLOYEES FROM SALES AND RESEARCH DEPARTEMENT HAVING ATLEAT 2 REPORTING EMPLOYEES.
*/
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM DEPT
                        WHERE DNAME IN ('SALES', 'RESEARCH')) AND EMPNO IN (SELECT MGR
                                                                                FROM EMP
                                                                                    GROUP BY MGR
                                                                                        HAVING COUNT(*) > =2);

--73-- **
/*
LIST EMPLOYEES WHO HAVE COMMISSION GREATER THAN MAXIMUM SALARY OF ALL THE SALESMAN AND WHO DO NOT REPORT TO KING DIRECTLY.
*/
SELECT ENAME
FROM EMP
WHERE COMM > ALL (SELECT MAX(SAL)
                FROM EMP
                    WHERE JOB='SALESMAN') AND MGR != (SELECT EMPNO
                                                            FROM EMP
                                                                WHERE ENAME='KING');


--74-- ***
/*
DISPLAY THE LOCATION OF ALL THE DEPARTMENTS WHICH HAVE EMPLOYEES JOINED IN THE YEAR 81.
*/
SELECT LOC 
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO 
                    FROM EMP 
                        WHERE HIREDATE BETWEEN '01-JAN-81' AND '31-DEC-81');

--OR

SELECT LOC FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE HIREDATE LIKE '__-___-81');

--75--
/*
DISPLAY DEPARTEMENT WISE MINIMUM SALARY WHICH IS LESS THAN AVERAGE SALARY OF EMPLOYEES.
*/

--76--
/*
DISPLAY ALL THE EMPLOYEES WHO ARE REPORTING TO 'JONES'.
*/