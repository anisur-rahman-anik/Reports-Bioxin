SELECT DISTINCT E."U_DESC" AS Task,
                I."PrcName" AS "Branch Name",
                TO_CHAR(A."CntctDate", 'DD Mon YYYY') AS "Activity Date",
                D."Name",
                COALESCE(H."Descr", '') AS Status,
                (C."firstName" || ' ' || C."lastName") AS "Checked By"
FROM "OCLG" A
JOIN "OCLT" D ON D."Code" = A."CntctType"
JOIN "OCLS" E ON E."Type" = D."Code" AND E."Code" = A."CntctSbjct"
JOIN "CUFD" G ON G."TableID" = 'OCLG' AND G."AliasID" = 'DOSTATUS'
JOIN "UFD1" H ON H."TableID" = G."TableID" AND G."FieldID" = H."FieldID" AND H."FldValue" = A."U_DOSTATUS"
JOIN "OHEM" C ON C."empID" = A."AttendEmpl"
JOIN "OPRC" I ON I."PrcCode" = A."U_BUNIT"
WHERE A."U_BUNIT" = 1008
  AND TO_CHAR(A."CntctDate", 'YYYYMMDD') BETWEEN '20240301' AND '20240304'
  AND A."CntctType" IN (1, 2, 3, 4, 5)
  AND (C."firstName" || ' ' || C."lastName") = 'Nasrin Islam Bristi'
ORDER BY D."Name", TO_CHAR(A."CntctDate", 'DD Mon YYYY'); 