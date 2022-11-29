INSERT INTO dbo.queryOut (summary_nr, event_date, event_type, evTitle, part_of_body, partTitle, nature_of_inj, natTitle, src_of_injury, srcTitle, degree_of_inj, degTitle)
  SELECT
    accident_injury.summary_nr
   ,accident.event_date
   ,accident_injury.event_type
   ,evCodes.evTitle
   ,accident_injury.part_of_body
   ,partCodes.partTitle
   ,accident_injury.nature_of_inj
   ,natCodes.natTitle
   ,accident_injury.src_of_injury
   ,srcCodes.srcTitle
   ,accident_injury.degree_of_inj
   ,degCodes.degTitle
  FROM dbo.accident_injury
       INNER JOIN dbo.accident_injury
         ON accident_injury.summary_nr = accident.summary_nr
       LEFT OUTER JOIN dbo.evCodes
         ON accident_injury.event_type = evCodes.code
       LEFT OUTER JOIN dbo.natCodes
         ON accident_injury.nature_of_inj = natCodes.code
       LEFT OUTER JOIN dbo.partCodes
         ON accident_injury.part_of_body = partCodes.code
       LEFT OUTER JOIN dbo.srcCodes
         ON accident_injury.src_of_injury = srcCodes.code
       LEFT OUTER JOIN dbo.degCodes
         ON accident_injury.degree_of_inj = degCodes.code
  ORDER BY accident.event_date
