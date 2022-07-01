﻿// *****
// Elementos constituintes basicos da ECL
// Uma definicao
Mydef := 'Olá mundo';  // definicao do tipo "value"

// Uma acao
OUTPUT('Olá mundo');
OUTPUT(mydef);

// *****
// Estruturas de dados basicas em ECL
// Estrutura RECORD
rec := RECORD
  STRING10  Firstname;
	STRING    Lastname;
	STRING1   Gender;
	UNSIGNED1 Age;
	INTEGER   Balance;
	DECIMAL7_2 Income;
END;

// Declaracao DATASET
ds := DATASET([{'Alysson','Oliveira','M',26,100,1000.50},
               {'Bruno','Camargo','',22,-100,500.00},
							 {'Elaine','Silva','F',19,-50,750.60},
							 {'Julia','Caetano','F',45,500,5000},
							 {'Odair','Ferreira','M',66,350,6000},
							 {'Orlando','Silva','U',67,300,4000}],rec);
// OUTPUT(ds);

// myfilterdata := ds(gender<>'');
// myfilterdata;

// *****
// Filtragem e tabulaçao de datasets
// recset := ds(Age<65);
// recset; //Equivale a: OUTPUT(recset);

// recset := ds(Age<65,Gender='M');
// recset;

// IsSeniorMale := ds.Age<65 AND ds.Gender='M'; //definição do tipo "boolean"
// recset := ds(IsSeniorMale);
// recset;

// SetGender := ['M','F'];  //definicao do tipo "set"
// recset := ds(Gender IN SetGender);
// recset;						// definição do tipo "recordset"
// COUNT(recset);    //Equivale a: OUTPUT(COUNT(recset));

// rec2 := RECORD
  // ds.Gender;
	// cnt := COUNT(GROUP);
// END;

// crosstab := TABLE(ds,rec2,Gender);
// crosstab;

// avg := AVE(crosstab,cnt);
// avg;

// *****
// Transformacoes basicas em ECL
// Eliminacao de campos desnecessarios
// tbl := TABLE(ds,{Firstname,LastName,Income});
// tbl;

// Ordenacao de valores
// sortbl := SORT(tbl,LastName);
// sortbl;

// Remocao de duplicidades
// dedptbl := DEDUP(sortbl,LastName);
// dedptbl;

// Adicao de campo no dataset
// rec2 := RECORD
  // UNSIGNED   recid;  
	// STRING10   Firstname;
	// STRING     Lastname;
	// STRING1    Gender;
	// UNSIGNED1  Age;
	// INTEGER    Balance;
	// DECIMAL7_2 Income;
// END;

// rec2 MyTransf(rec Le, UNSIGNED cnt) := TRANSFORM
  // SELF.recid:=cnt;
  // SELF := Le;
// END;

// newds := PROJECT(ds,MyTransf(LEFT,COUNTER));

// newds;


// Conversão de campo no dataset
// IMPORT STD;

// rec3 := RECORD
  // UNSIGNED   recid;  
	// STRING10   Firstname;
	// STRING     Lastname;
	// STRING1    Gender;
	// UNSIGNED1  Age;
	// INTEGER    Balance;
	// DECIMAL7_2 Income;
// END;

// rec3 MyTransf2(rec2 Le) := TRANSFORM
  // SELF.FirstName := STD.Str.ToUpperCase(Le.Firstname);
  // SELF.LastName := STD.Str.ToUpperCase(Le.Lastname);
  // SELF := Le;
// END;

// newds2 := PROJECT(newds,MyTransf2(LEFT));

// newds2;












