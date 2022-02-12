create database MovieDetails
use MovieDetails


create table Username
(
    UserName     varchar(50) not null,
    UserPassword varchar(50) not null,
	isAdmin bit
)


CREATE PROCEDURE createUser
	@Username NVARCHAR(50),
	@UserPassword NVARCHAR(50),
	@isadmin bit
AS 
BEGIN 
	INSERT INTO Username VALUES(@Username, @UserPassword, @isadmin)
END
GO

CREATE PROCEDURE selectUsername
	@username nvarchar(50)
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Username
	WHERE 
		Username.UserName = @username
END
GO

CREATE PROCEDURE selectUser
	@Username NVARCHAR(50),
	@UserPassword NVARCHAR(50)
AS 
BEGIN 
	SELECT * FROM Username where Username.UserName = @Username and Username.UserPassword = @UserPassword
END
GO



CREATE TABLE Movei
(
	IDMovie INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(300),
	Description NVARCHAR(300),
	OriginNaziv NVARCHAR(900),
	pubDate NVARCHAR(90),
	Trajanje NVARCHAR(90),
	Plakat nvarchar(90)
)
GO


CREATE TABLE Zanr
(
	IDZanr INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(300),
)
GO


CREATE TABLE Person
(
	IDPerson INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(300),
	LastName NVARCHAR(300),
)
GO

drop table Person


CREATE PROCEDURE createMovie
	@Title NVARCHAR(300),
	@Description NVARCHAR(900),
	@Orginnaziv NVARCHAR(90),
	@PublishedDate NVARCHAR(90),
	@trajanje NVARCHAR(90),
	@plakat NVARCHAR(90),
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO Movei VALUES(@Title, @Description, @Orginnaziv, @PublishedDate, @trajanje, @plakat)
	SET @Id = SCOPE_IDENTITY()
END
GO

CREATE PROCEDURE selectMovie
	@Idmovie INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Movei
	WHERE 
		IDMovie = @Idmovie
END
GO

CREATE PROCEDURE selectMovies
AS 
BEGIN 
	SELECT * FROM Movei
END
GO

CREATE PROCEDURE updateMovie
	@Title NVARCHAR(300),
	@Description NVARCHAR(900),
	@Orginnaziv NVARCHAR(90),
	@PublishedDate NVARCHAR(90),
	@trajanje NVARCHAR(90),
	@plakat NVARCHAR(90),
	@Id INT OUTPUT
AS 
BEGIN 
	UPDATE Movei SET 
		Title = @Title,
		Description = @Description,
		OriginNaziv = @Orginnaziv,
		pubDate = @PublishedDate,
		Trajanje = @trajanje,
		Plakat = @plakat
	WHERE 
		IDMovie = @Id
END
GO


CREATE PROCEDURE deleteMovie
	@Idmovie INT	 
AS 
BEGIN 
	DELETE  
	FROM 
	Movei
	WHERE 
		IDMovie = @Idmovie
END


CREATE PROCEDURE createPersonIfNotExists
	@FName NVARCHAR(300),
	@LName NVARCHAR(300),
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO Person VALUES(@FName, @LName)
	SET @Id = SCOPE_IDENTITY()
END
GO


CREATE PROCEDURE selectPerson
	@Idperson INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Person
	WHERE 
		IDPerson = @Idperson
END
GO


CREATE PROCEDURE selectPeople
AS 
BEGIN 
	SELECT * FROM Person
END
GO

CREATE PROCEDURE updatePerson
	@Fname NVARCHAR(300),
	@Lname NVARCHAR(900),
	@Id INT OUTPUT
AS 
BEGIN 
	UPDATE Person SET 
		FirstName = @Fname,
		LastName = @Lname
	WHERE 
		IDPerson = @Id
END
GO

CREATE PROCEDURE deletePerson
	@Idperson INT	 
AS 
BEGIN 
	DELETE  
	FROM 
	Person
	WHERE 
		IDPerson = @Idperson
END

CREATE PROCEDURE deleteAllPersons 
AS 
BEGIN 
	Delete from Person
END




CREATE PROCEDURE createZanrIfNotExists
	@name NVARCHAR(300),
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO Zanr VALUES(@name)
	SET @Id = SCOPE_IDENTITY()
END
GO

CREATE PROCEDURE selectZanrs
AS 
BEGIN 
	SELECT * FROM Zanr
END
GO


CREATE PROCEDURE selectGenre
	@Idzanr INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Zanr
	WHERE 
		IDZanr = @Idzanr
END
GO

CREATE PROCEDURE updateGenre
	@name NVARCHAR(300),
	@Id INT OUTPUT
AS 
BEGIN 
	UPDATE Zanr SET 
		Name = @name
	WHERE 
		IDZanr = @Id
END
GO

CREATE PROCEDURE deleteGenre
	@Idgenre INT	 
AS 
BEGIN 
	DELETE  
	FROM 
	Zanr
	WHERE 
		IDZanr = @Idgenre
END

CREATE PROCEDURE deleteAllGenres 
AS 
BEGIN 
	Delete from Zanr
END

CREATE PROCEDURE deleteAllMovies
AS 
BEGIN 
	Delete from Movei
END

drop procedure createMovieZanr

CREATE PROCEDURE createMovieZanr
	@IDmoive INT OUTPUT,
	@IDZanr INT OUTPUT
AS 
BEGIN 
	INSERT INTO Movei (IDMovie) VALUES (@IDmoive)
	INSERT INTO Zanr (IDZanr) VALUES (@IDZanr)
END
GO

drop procedure createMovieActor

CREATE PROCEDURE createMovieActor	
	@IDmoive int output,
	@IDpeople INT output
AS 
BEGIN 
	INSERT INTO Movei (IDMovie) VALUES (@IDmoive)
	INSERT INTO Person (IDPerson) VALUES (@IDpeople)
END
GO

drop procedure createMovieRedatelj

CREATE PROCEDURE createMovieRedatelj	
	@IDmoive int output,
	@IDpeople int output
AS 
BEGIN 
	INSERT INTO Movei (IDMovie) VALUES (@IDmoive)
	INSERT INTO Person (IDPerson) VALUES (@IDpeople)
END
GO


drop procedure selectActorsFromMovie

CREATE PROCEDURE selectActorsFromMovie
	@ID INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Person
	WHERE 
		IDPerson = @ID
END
GO

select * from Person

drop procedure selectRedateljsFromMovie

CREATE PROCEDURE selectRedateljsFromMovie
	@Id INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Person
	WHERE 
		IDPerson = @Id
END
GO

drop procedure selectZanrsFromMovie

CREATE PROCEDURE selectZanrsFromMovie
	@Id INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Zanr
	WHERE 
		IDZanr = @Id
END
GO


