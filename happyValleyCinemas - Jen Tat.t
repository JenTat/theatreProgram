%***********************************************************************%
%                                                                       %
%                          PROGRAM HEADER                               %
%***********************************************************************%
%***********************************************************************%
%                                                                       %
% PROGRAMMER'S NAME:    Jen Tat                                         %
%                                                                       %
% DATE REVISED:         Friday, December 7, 2018                        %
%                                                                       %
% PROGRAM NAME:         Theatre Times Program                           %
%                                                                       %
% CLASS:                TEJ201-02                                       %
%                                                                       %
% ASSIGNMENT:           Major Programming Assignment                    %
%                                                                       %
% TEACHER:              Mr. Henrich                                     %
%                                                                       %
% DUE DATE:             Wednesday, December 19, 2018                    %
%                                                                       %
%***********************************************************************%
%                                                                       %
% WHAT THE PROGRAM DOES                                                 %
%                                                                       %
% This program includes the number of seats for the different times in  %
% Theatre 1. The different show times are 3:00 PM, 7:00 PM, and 9:00 PM %
% This program accepts a variable indicating the maximum seating        %
% capacity for Theatre 1, as an input from the user. It then generates  %
% random values for the tickets sold for all three show times. When/if  %
% the user makes a specific request, this program will calculate and    %
% display the number of seats remaining for the show time chosen by the %
% user. This program is cleared each time the user makes another request%
% and will only continue until the user wishes to stop and exit.        %
%                                                                       %
%***********************************************************************%
%                                                                       %
% PROCEDURES                                                            %
%                                                                       %
% One procedure is used within this program:                            %
% N/A:                                                                  % 
%                                                                       %
%                                                                       %
%***********************************************************************%
%                                                                       %
% ERROR HANDLING                                                        %
%                                                                       %
% This program has error handling routines that includes if the user    %
% were to input a string that cannot be changed to an integer for the   %
% maximum seating capacity of Theatre 1, the output will be written as  %
% "*user input* is not an integer" and will be unacceptable and if the  %
% user input is a negative integer or 0 the output displayed is "*user  %
% input* is not a positive integer". This program will accept the       %
% pre-established Theatre Times, their respective military/24-Hour Clock%
% times, and user input is not case/space sensitive. All other times are%
% unacceptable inputs and the output will read as "You have entered an  %
% invalid time."                                                        %
%                                                                       %
%***********************************************************************%
%                                                                       %
% PROGRAM LIMITATIONS                                                   %
%                                                                       %
% This program will only accept the pre-established theatre times of    %
% 3:00 PM, 7:00 PM, or 9:00 PM as eligible inputs from the user, and it %
% will not accept these times without "PM", " PM", "pm", or " pm"       %
% written after it and military times must include "hrs" written after  %
% it.                                                                   %
%***********************************************************************%
%                                                                       %
% EXTENSIONS AND IMPROVEMENTS                                           %
% This program could be improved in a variety of ways:                  %
% 1. Adding colour to the text such as red for invalid inputs from the  %
%    user to have a greater visual impact on the user.                  %
% 2. Using more personal or friendly vocabulary with the user for a more%
%    human-like interaction.                                            %
% 3. Phrasing output statements in a more concise, clearer, manner that %
%    is more appealing and pleasant to read.                            %
%                                                                       %
%***********************************************************************%
var num_seats, num_seats_left, num_seats_used : int
var TIME : string
var response : string
var num_seats_text : string %User input for seating capacity and error checks
procedure clearScreen
    var ch : string (1)
    put "Press ENTER to clear screen."
    getch (ch)
    cls
end clearScreen

loop
    loop %Error check to ensure it is either a YES or No input
	put "Do you wish to continue? Please enter Yes or No"
	get response
	if response = "NO" or response = "No" or response = "no" then
	return
	end if
	exit when response = "YES" or response = "Yes" or response = "yes" 
	put "You have entered an invalid response."
	put "Please enter YES to continue or NO to exit."
	clearScreen
    end loop
    clearScreen
    %Error checks for seating capacity: must be a positive integer
    loop
	put "Please enter the maximum seating capacity for Theatre 1"
	get num_seats_text
	exit when strintok (num_seats_text) = true and strint (num_seats_text) > 0
	%If the string cannot be change to an integer:
	if not strintok (num_seats_text) = true then
	    put num_seats_text, " is not an integer"
	    put "Please enter a positive integer representing Theatre 1 Seating Capacity."
	    clearScreen
	elsif strint(num_seats_text) = 0 then
	    put num_seats_text, " is neither a positive nor negative integer"
	    put "Please enter a positive integer representing Theatre 1 Seating Capacity."
	    clearScreen
	    %If the string is not a positive number:
	elsif not strint (num_seats_text) > 0 = true then
	    put num_seats_text, " is not a positive integer"
	    put "Please enter a positive integer representing Theatre 1 Seating Capacity."
	    clearScreen
	end if
    end loop
    
    loop %Error check to ensure it is either a YES or No input
	put "Do you wish to continue? Please enter Yes or No"
	get response
	if response = "NO" or response = "No" or response = "no" then
	return
	end if
	exit when response = "YES" or response = "Yes" or response = "yes" 
	put "You have entered an invalid response."
	put "Please enter YES to continue or NO to exit."
	clearScreen 
    end loop
    clearScreen

    num_seats := strint (num_seats_text)
    num_seats_used := Rand.Int (1, num_seats)
    num_seats_left := num_seats - num_seats_used
    
    %Error Check for Theatre Time, must be one of the pre-established times
    loop
	put "Please enter your choice of theatre times: 3:00 PM, 7:00 PM, 9:00 PM"
	get TIME : *
	exit when TIME = "3:00PM" or TIME = "3:00 PM" or TIME = "3:00pm" or TIME = "3:00 pm" or TIME = "15:00hrs" or TIME = "15:00 hrs" or TIME = "7:00PM" or TIME = "7:00 PM" or TIME = "7:00pm" or TIME = "7:00 pm" or TIME = "19:00hrs" or TIME = "19:00 hrs" or TIME = "9:00PM" or TIME = "9:00 PM" or TIME = "9:00pm" or TIME = "9:00 pm" or TIME = "21:00hrs" or TIME = "21:00 hrs"
	put "You have entered an invalid time."
	clearScreen
    end loop
    
    if TIME = "3:00PM" or TIME = "3:00 PM" or TIME = "3:00pm" or TIME = "3:00 pm" or TIME = "15:00hrs" or TIME = "15:00 hrs" then
	put "Cinema 1 has a maximum capacity of ", num_seats, " seats."
	put num_seats_used, " seats have been sold for the 3:00 PM showing."
	put "There are ", num_seats_left, " seats left for the 3:00 PM showing in Cinema 1."
    elsif TIME = "7:00PM" or TIME = "7:00 PM" or TIME = "7:00pm" or TIME = "7:00 pm" or TIME = "19:00hrs" or TIME = "19:00 hrs" then
	put "Cinema 1 has a maximum capacity of ", num_seats, " seats."
	put num_seats_used, " seats have been sold for the 7:00 PM showing."
	put "There are ", num_seats_left, " seats left for the 7:00 PM showing in Cinema 1."
    elsif TIME = "9:00PM" or TIME = "9:00 PM" or TIME = "9:00pm" or TIME = "9:00 pm" or TIME = "21:00hrs" or TIME = "21:00 hrs" then
	put "Cinema 1 has a maximum capacity of ", num_seats, " seats."
	put num_seats_used, " seats have been sold for the 9:00 PM showing."
	put "There are ", num_seats_left, " seats left for the 9:00 PM showing in Cinema 1."
    else
	put "You have entered an invalid time."
    end if
    put " "
    put " "
end loop

