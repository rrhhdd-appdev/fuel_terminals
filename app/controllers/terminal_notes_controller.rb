class TerminalNotesController < ApplicationController
  def index
    user_id = session.fetch(:user_id)
    matching_terminal_notes = TerminalNote.all.where(:user => user_id)

    @list_of_terminal_notes = matching_terminal_notes.order({ :created_at => :desc })

    render({ :template => "terminal_notes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_terminal_notes = TerminalNote.where({ :id => the_id })

    @the_terminal_note = matching_terminal_notes.at(0)

    render({ :template => "terminal_notes/show.html.erb" })
  end

  def create
    the_terminal_note = TerminalNote.new
    the_terminal_note.note = params.fetch("query_note")
    the_terminal_note.user_id = session.fetch(:user_id)
    the_terminal_note.term_id = params.fetch("query_terminal_id").to_i

    if the_terminal_note.valid?
      the_terminal_note.save
      redirect_to("/facilities/#{the_terminal_note.term_id}", { :notice => "Terminal note was added." })
    else
      redirect_to("/facilities/#{the_terminal_note.term_id}", { :alert => the_terminal_note.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_terminal_note = TerminalNote.where({ :id => the_id }).at(0)

    the_terminal_note.note = params.fetch("query_note")
    the_terminal_note.user_id = params.fetch("query_user_id")
    the_terminal_note.term_id = params.fetch("query_terminal_id")

    if the_terminal_note.valid?
      the_terminal_note.save
      redirect_to("/terminal_notes/#{the_terminal_note.term_id}", { :notice => "Terminal note updated successfully." })
    else
      redirect_to("/terminal_notes/#{the_terminal_note.term_id}", { :alert => the_terminal_note.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_terminal_note = TerminalNote.where({ :id => the_id }).at(0)

    the_terminal_note.destroy

    redirect_to("/facilities/#{the_terminal_note.term_id}", { :notice => "Note deleted." })
  end
end
