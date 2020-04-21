<<<<<<< HEAD


class MusicLibraryController
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
     input = gets.strip
     if input != exit.downcase
     puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?"

     case input
         when "list songs"
           list_songs
         when "list artists"
           list_artists
         when "list genres"
           list_genres
         when "list artist"
           list_songs_by_artist
         when "list genre"
           list_songs_by_genre
         when "play song"
           play_song
         end
     end
   end

  def list_songs #this one was a pain in the butt for some reason. That +1 index would change the song too for some reason...
    Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(0) do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
=======
require "pry"
class MusicLibraryController

  extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
  end

  def call
    input = ""
    while input != "exit".downcase
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip.downcase

      case input
      when "list songs".downcase
        list_songs
      when "list artists".downcase
        list_artists
      when "list genres".downcase
        list_genres
      when "list artist".downcase
        list_songs_by_artist
      when "list genre".downcase
        list_songs_by_genre
      when "play song".downcase
        play_song
      end

    end
  end

  def list_songs

    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
 
    songs_sorted_by_name = Song.all.sort_by do |song|
      song.name
    end
    songs_sorted_by_name.each.with_index(1) do |song,index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
>>>>>>> 7abb55ea571f20aa674e65897aef0ab99b5763ce
    end
  end

  def list_artists
<<<<<<< HEAD
    Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(0) do |a, i|
      puts "#{i+1}. #{a.name}"
=======
    songs_sorted_by_artist = Artist.all.sort_by do |artist| #returns an array of artists sorted by artist name
      artist.name
    end
    songs_sorted_by_artist.each.with_index(1) do |artist,index|
      puts "#{index}. #{artist.name}"
>>>>>>> 7abb55ea571f20aa674e65897aef0ab99b5763ce
    end
  end

  def list_genres
<<<<<<< HEAD
    Genre.all.sort{|a, b| a.name <=> b.name}.each.with_index(0) do |g, i|
      puts "#{i+1}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
        puts "#{i+1}. #{s.name} - #{s.genre.name}"
=======
    songs_sorted_by_genre = Genre.all.sort_by do |genre|
      genre.name
    end
    songs_sorted_by_genre.each.with_index(1) do |genre,index|
      puts "#{index}. #{genre.name}"
    end
  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input) #find artist that matches input
      songs_sorted_by_name = artist.songs.sort_by do |song|
        song.name
      end
      songs_sorted_by_name.each.with_index(1) do |song,index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
>>>>>>> 7abb55ea571f20aa674e65897aef0ab99b5763ce
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
<<<<<<< HEAD
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
        puts "#{i+1}. #{s.artist.name} - #{s.name}"
=======
    input = gets.chomp
    if genre = Genre.find_by_name(input) #find genre that matches input
      songs_sorted_by_name = genre.songs.sort_by do |song|
        song.name
      end
      songs_sorted_by_name.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
>>>>>>> 7abb55ea571f20aa674e65897aef0ab99b5763ce
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
<<<<<<< HEAD
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input) #fancy!
      array = Song.all.sort{|a, b| a.name <=> b.name}
      song = array[input-1]
=======
    list_of_songs =  Song.all.sort{ |a, b| a.name <=> b.name }

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = list_of_songs[input+2]
>>>>>>> 7abb55ea571f20aa674e65897aef0ab99b5763ce
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

<<<<<<< HEAD
end
=======
end
>>>>>>> 7abb55ea571f20aa674e65897aef0ab99b5763ce
