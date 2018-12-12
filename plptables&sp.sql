create schema PLP_Music_Box
go
drop table PLP_Music_Box.UserTable
create table PLP_Music_Box.UserTable (
UserID int identity(1,1) primary key,
 FirstName varchar(50),
 LastName varchar(50),
 UserName varchar(50) unique,
 Password varchar(50), 
 DOB date,
 Address varchar(250), 
  MobileNo bigint unique,
  [Security Question] varchar(100),
  [Security Answer] varchar(100)

)


create proc PLP_Music_Box.USP_ForgetPassword
(
@Username  varchar(50) ,+
@password varchar(50),
@SecurityQuestion varchar(100),
@SecurityAnswer varchar(100)
)
as
begin
update  PLP_Music_Box.UserTable set Password=@password where UserName=@Username and  [Security Question]=@SecurityQuestion and  [Security Answer]=@SecurityAnswer
end

select * from  PLP_Music_Box.usertable
delete from PLP_Music_Box.UserTable where Address='hgikfhj'
insert into PLP_Music_Box.UserTable values ('Poonam','Satghare', 'poonam','poonam','1996/06/26', 'Pune', 9130260790,'gfhgf','jhyfrhgfh')

create proc PLP_Music_Box.uspRegisterUser
(
@UserId int out,
 @FirstName varchar(50),
 @LastName varchar(50),
 @UserName varchar(50),
 @Password varchar(50), 
 @DOB date,
 @Address varchar(250), 
  @MobileNo bigint,
  @Question varchar(100),
  @Answer varchar(100)
  )
  as
  begin
  insert into PLP_Music_Box.UserTable values( @FirstName, @LastName, @UserName, @Password, @DOB, @Address, @MobileNo, @Question, @Answer)
  set @UserId=SCOPE_IDENTITY()
  end

  create proc PLP_Music_Box.uspDisplayUserToAdmin

  as
  begin
  select UserId, FirstName, LastName, DOB,Address,MobileNo from  PLP_Music_Box.UserTable
  end



  create proc PLP_Music_Box.uspGetQues
(
 @UserName varchar(50),
 @Ques varchar(100) out
  )
  as
  begin
  select [Security Question] from PLP_Music_Box.UserTable where UserName=@UserName
  end

  alter proc PLP_Music_Box.uspForgetPassword
  (
  @Username varchar(50),
  @Pass varchar(50),
  @Question varchar(50),
  @Answer varchar(100)

  )
  as
  begin
   update PLP_Music_Box.UserTable set Password=@Pass Where Username=@Username and [Security Question]=@Question and [Security Answer]=@Answer
   end

 create table PLP_Music_Box.AdminTable (

 UserName varchar(50)primary key,
 Password varchar(50)
)


insert into PLP_Music_Box.AdminTable values('Admin1','Admin1')

create proc PLP_Music_Box.uspAdminLogin1
(
@UserName varchar(50),
@Pasword varchar(50)
)
as
begin 
select * from PLP_Music_Box.AdminTable where UserName=@UserName and Password=@Pasword
end

create proc PLP_Music_Box.uspUserLogin
(
@UserName varchar(50),
@Pasword varchar(50)
)
as
begin 
select count(*) from PLP_Music_Box.UserTable where UserName=@UserName and Password=@Pasword
end

create table PLP_Music_Box.Album
(
AlbumID int identity(1,1) primary key, 
AlbumName varchar(50),
Category varchar(50),
AlbumImage varchar(250)
)

insert into PLP_Music_Box.Album values('Metro','fdgfrh','sdfgf')

select * from  PLP_Music_Box.Songs

create proc PLP_Music_Box.Usp_AdminLogin(
@Username varchar
create table PLP_Music_Box.Songs
(
SongID int identity(1,1) primary key,
SongName varchar(100),
Singer varchar(100),
Movie varchar(200), 
Year int,
AlbumID int references PLP_Music_Box.Album(AlbumID),
Language varchar(50),
link varchar(300),
Picture varchar(300)
)



create proc PLP_Music_Box.uspAddAlbum(
@AlbumID int out, 
@AlbumName varchar(50),
@Category varchar(50),
@AlbumImage varchar(250)
)
 as
begin
insert into PLP_Music_Box.Album values( @AlbumName, @Category, @AlbumImage)
set @AlbumID=SCOPE_IDENTITY()
end

create proc PLP_Music_Box.uspDisplayAlbum

as
begin
select * from PLP_Music_Box.Album
end


create proc PLP_Music_Box.uspDeleteAlbum(
@AlbumName varchar(50)
)
 as
begin
delete from PLP_Music_Box.Album where AlbumName = @AlbumName
end

create proc PLP_Music_Box.uspAddSongs(
@SongID int out,
@SongName varchar(100),
@Singer varchar(100),
@Movie varchar(200), 
@Year int,
@AlbumID int,
@Language varchar(50),
@link varchar(300),
@Picture varchar(300)
)
 as
begin
insert into PLP_Music_Box.Songs values( @SongName, @Singer, @Movie, @Year, @AlbumID, @Language, @link, @Picture)
set @SongID=SCOPE_IDENTITY()
end

create proc PLP_Music_Box.uspDisplaySongs
as
begin
select * from PLP_Music_Box.Songs
end


create proc PLP_Music_Box.uspDeleteSongs(
@SongName varchar(50)
)
 as
begin
delete from PLP_Music_Box.Songs where SongName = @SongName
end