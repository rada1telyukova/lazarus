/************************************************
 * Creates table Respondents                    *
 *                                              *
 *    id          - Primary key                 *
 *    school_id   - Foreign key                 *
 *    sex         - enumerated  {'F' | 'M'}     *
 *    age         - 14 <= age <= 60 (Wasserman) *
 *    form                                      *
         - enumerated  {9 | 11}                 *
 *                                              *
 *  03.12.2023  Rada Telyukova                  *
 * * * * * * * * * * * * * * * * * * * * * * * **/

CREATE TABLE IF NOT EXISTS Respondents (
  id INTEGER PRIMARY KEY,
  school_id INTEGER NOT NULL,
  sex TEXT NOT NULL CHECK(sex IN ('F', 'M')) DEFAULT 'F',
  age INTEGER NOT NULL CHECK (age >= 14 AND age <= 60),
  form INTEGER NOT NULL CHECK(form IN (9, 11)) DEFAULT 9,
  FOREIGN KEY(school_id) REFERENCES Schools(id) ON DELETE CASCADE
);
.print "\nTable 'Respondents' has been created with schema:"
.schema Respondents