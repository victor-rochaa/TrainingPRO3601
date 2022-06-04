IMPORT $;

Crimes:= $.Tarefas.Formatted_File;

Layout_Desc := RECORD
crimes.row_id;
crimes.case_number;
crimes.day;
crimes.time;
crimes.primary_type;
crimes.description;
crimes.arrest;
END;

Crimes_Desc := TABLE(Crimes, Layout_Desc);
OUTPUT(Crimes, Layout_Desc, NAMED('Crimes_Desc'));

Layout_Adress := RECORD
crimes.row_id;
crimes.block;
crimes.community_area;
crimes.district;

END;

Crimes_Adress := TABLE(Crimes, Layout_Adress);
OUTPUT(Crimes, Layout_Adress, NAMED('Crimes_Adress'));

JOIN(Crimes_Desc, Crimes_Adress, LEFT.row_id=RIGHT.row_id);
