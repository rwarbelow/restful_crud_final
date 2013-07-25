get '/' do
  @notes = Note.all
  erb :index
end

get '/new_note' do
  erb :create_note
end

post '/new_note' do
  @note = Note.new(params[:note])
  if @note.save
    @notes = Note.all
    erb :index
  else
    @errors = @note.errors.full_messages
    erb :create_note
  end
end

post '/update_note' do
  @note = Note.find_by_title(params[:name])
  erb :show_note
  # show a specific note
end

get '/update/:note_id' do
  @note = Note.find(params[:note_id])
  erb :update_note
end

post '/update/:note_id' do
  @note = Note.find(params[:note_id])
  @note.title = params[:title]
  @note.content = params[:content]
  @note.save
  redirect '/'
end

get '/delete/:note_id' do
  # delete a note object from the database
  @note = Note.find(params[:note_id])
  @note.destroy

  redirect '/'
end






# A user Create a new note.
# A user can Update a note.
# A user can Delete an existing note.
# Use a helper method to verify that a user really wants to delete a particular note.
