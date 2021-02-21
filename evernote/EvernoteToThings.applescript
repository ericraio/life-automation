-- -----------------------------------------------------------------------------------------------------------------
-- WHAT IT DOES
-- There are only 2 things I really need for an effective mobile GTD solution
-- (1) An ability to very quickly add a task or idea using my Android phone
-- (2) A way to review my "Next" items using my Android
-- Additionally (of course) it all needs to sync up with my Mac, via the cloud.
-- The script uses Evernote to achieve a 2 way "sync":
-- Firstly, it establishes an Evernote "Inbox"
-- and creates a Things to do for any note in there that was created using an Android device
-- Secondly, it reads the "Next" list from Things and maintains an Evernote note that matches that list

-- -----------------------------------------------------------------------------------------------------------------
-- NOTES
-- * The script is saves as an application. It keeps running all the time once you launch it. 
--    It's totally open, so you can open it with an applescript editor and make any changes you like (see licence below).
-- * I find it best to make the "Inbox" notebook the default notebook for Evernote.
-- * On first launch, 2 notebooks will be ceated in Evernote. 
--    ".Inbox" (for collected tasks and ideas) and 
--    ".Next" (where the review list will be maintained)
--    This can't be done with Applescript, so just right click the notebook and choose "Notebook settings"
--    This will be the default insertion point for all your notes, even those made on the Mac
--    but only those that originally came from the Android phone will be made into Things To Dos

syncToDos()

on syncToDos()
	--========================================================--
	-- EVERNOTE TO THINGS
	-- First, get all the evernote items earmarked for Things.
	-- Make a Things ToDo for each, then delete the the Evernote version
	--========================================================--

	-- check if Evernote is running
	set itsAlive to true
	if application "Evernote Legacy" is not running then
		set itsAlive to false
		tell application "Evernote Legacy" to activate
	end if

	-- check if Things is running
	if application "Things3" is not running then
		set itsAlive to false
		tell application "Things3" to activate
	end if

	-- if we start before EN or Things is ready, we'll get an error. So give them a chance!
	-- Wait a cycle. If they're still not right, we'll see the error then
	if not itsAlive then
		delay 60
	end if

	-- Make a line feed
	set crlf to (ASCII character 13) & (ASCII character 10)

	-- OK, begin
	tell application "Evernote Legacy"

		-- create inbox if required
		if (not («class EVnb» named ".Inbox" exists)) then
			activate
			delay 60
			try
				make «class EVnb» with properties {name:".Inbox"}
			end try
		end if

		-- create reference notebook if required
		if (not («class EVnb» named ".Reference" exists)) then
			activate
			delay 60
			try
				make «class EVnb» with properties {name:".Reference"}
			end try
		end if

		-- create to do ref tag if required
		if (not («class EVtg» named "ToDoRef" exists)) then
			make «class EVtg» with properties {name:"ToDoRef"}
		end if

		-- loop all notes in the "INBOX" that were created on an ios device
		repeat with evInboxNote in «event EVRNfind» "notebook:.Inbox source:mobile.ios"

			-- get the title and html content of each note
			set evNoteTitle to the «class EVet» of evInboxNote
			set evNoteContent to the «class EVhl» of evInboxNote

			-- strip out the HTML stuff, leaving just the text content
			set i to 0
			set evNoteText to ""
			set evNoteChars to ""
			repeat while i < (count characters in evNoteContent)
				set i to i + 1
				set evNoteChars to character i of evNoteContent
				if evNoteChars = "<" then
					repeat until evNoteChars = ">"
						set i to i + 1
						set evNoteChars to character i of evNoteContent
					end repeat
				else
					try
						set evNoteText to evNoteText & evNoteChars
					end try
				end if
			end repeat

			-- try and make a new Things todo, and delete the Evernote version
			try

				-- tag and keep notes with attachments. Delete those without
				set attachmentList to every «class EVnr» of evInboxNote
				if (length of attachmentList) > 0 then
					set evNoteText to "[url=" & «class EV24» of evInboxNote & "]" & «class EV24» of evInboxNote & "[/url]" & crlf & crlf & evNoteText
					tell application "Things3" to make new to do with properties {name:evNoteTitle, notes:evNoteText} at beginning of list "Inbox"
					move evInboxNote to «class EVnb» ".Reference"
					«event EVRNassn» «class EVtg» "ToDoRef" given «class EV13»:evInboxNote
				else
					tell application "Things3" to make new to do with properties {name:evNoteTitle, notes:evNoteText} at beginning of list "Inbox"
					delete evInboxNote
				end if

			on error
				-- just let us know if it didn't work, otherwise carry on
				tell me to activate
				display alert ("Evernote/Things Sync Failed")
			end try
		end repeat

	end tell

	--========================================================--
	-- THINGS TO EVERNOTE
	-- Now take all the "Next" items in Things
	-- and turn them into a nicely formatted note for Evernote, that can be viewed on Android 
	--========================================================--

	tell application "Things3"

		-- loop all the notes in the "Next" list of Things
		set theArea to "anUnlikelyString"
		set theNextText to ""

		-- first, sync back any unmanaged "Inbox" items
		set theNextText to theNextText & "<div><br /></div><div><b>INBOX</b></div>"
		repeat with theTodo in (to dos in the list "Inbox")
			if the status of theTodo is open then
				set theNextText to theNextText & "<div><font class='Apple-style-span' color='#D90408'>" & the name of theTodo & "</font></div>"
			end if
		end repeat

		-- put in a horizontal line
		set theNextText to theNextText & "</br></br><hr>"

		-- now, grab all the "today" stuff
		set theNextText to theNextText & "<div><br /></div><div><b>TODAY</b></div>"
		repeat with theTodo in (to dos in the list "Today")
			if the status of theTodo is open then
				-- get the name of the area or project this to do belongs to
				set theToDoArea to "General"
				try
					set theToDoArea to the name of the area of theTodo
				on error
					try
						set theToDoArea to the name of the project of theTodo
					end try
				end try
				set theNextText to theNextText & "<div><font class='Apple-style-span' color='#008f29'>" & "<strong>" & theToDoArea & " - </strong>" & the name of theTodo & "</font></div>"
			end if
		end repeat

		-- put in a horizontal line
		set theNextText to theNextText & "</br></br><hr>"

		-- now do the "next" list
		repeat with theTodo in (to dos in the list "Next")

			-- get the name of the area or project this to do belongs to
			set theToDoArea to "General"
			try
				set theToDoArea to the name of the area of theTodo
			on error
				try
					set theToDoArea to the name of the project of theTodo
				end try
			end try

			-- if the to do is not closed, add it to the list text (make it green if it's due today)
			if the status of theTodo is open then

				-- find unique areas and projects, and make bold headings
				if theToDoArea is not equal to theArea then
					set theArea to theToDoArea
					set theNextText to theNextText & "<div><br /></div><div><b>" & theToDoArea & "</b></div>"
				end if

				set theDate to the activation date of theTodo as string
				if theDate is not equal to "missing value" then
					set theNow to (current date) as string
					set theNow to word 2 of theNow & word 3 of theNow & word 4 of theNow
					set theDate to word 2 of theDate & word 3 of theDate & word 4 of theDate
					if theNow is equal to theDate then
						set theNextText to theNextText & "<div><font class='Apple-style-span' color='#008f29'>" & the name of theTodo & "</font></div>"
					else
						set theNextText to theNextText & "<div>" & the name of theTodo & "</div>"
					end if
				else
					-- break this out into a "people list" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					set theContact to the contact of theTodo
					try
						set theNextText to theNextText & "<div><strong>" & the name of theContact & "</strong> - " & the name of theTodo & "</div>"
					on error
						set theNextText to theNextText & "<div>" & the name of theTodo & "</div>"

					end try
				end if
			end if
		end repeat
	end tell

	tell application "Evernote"

		-- look for the "Next Notebook. Make it if it's not found
		set noteFound to 0
		if (not («class EVnb» named ".Next" exists)) then
			activate
			make «class EVnb» with properties {name:".Next"}
		else
			-- look for the "Next Note"
			repeat with evInboxNote in «event EVRNfind» "notebook:.Next"
				if the «class EVet» of evInboxNote is "GTD Next" then
					set noteFound to 1
					set theGTDNextNote to evInboxNote
				end if
			end repeat
		end if

		-- if we don't find the "Next Note", then make it from scratch. Otherwise, update the one we have with the Things list text
		if noteFound = 0 then
			set theGTDNextNote to «event EVRNcrnt» given «class Entt»:"GTD Next", «class Enhl»:theNextText, «class Ennb»:".Next"
		else
			--set theTXT to the HTML content of theGTDNextNote
			--set the clipboard to theTXT
			set «class EVhl» of item 1 of theGTDNextNote to theNextText
    end if
	end tell

end syncToDos

--========================================================--
-- Run the sync every 60 seconds
--========================================================--

on idle
	syncToDos()
	return 60
end idle






