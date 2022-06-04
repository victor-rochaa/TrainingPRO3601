IMPORT $;

Crimes:= $.Tarefas.File_crime_optimized.File;

Layout_Desc := RECORD
crimes.id;
crimes.case_number;
crimes.date;
crimes.primary_type;
crimes.description;
crimes.arrest;
END;

Crimes_Desc := TABLE(Crimes, Layout_Desc);
OUTPUT(Crimes, Layout_Desc, NAMED('Crimes_Desc'));

Layout_Adress := RECORD
crimes.id;
crimes.block;
crimes.community_area;
crimes.district;

END;

Crimes_Adress := TABLE(Crimes, Layout_Adress);
OUTPUT(Crimes, Layout_Adress, NAMED('Crimes_Adress'));

JOIN(Crimes_Desc, Crimes_Adress, LEFT.id=RIGHT.id);