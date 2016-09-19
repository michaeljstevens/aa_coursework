import React from 'react';
import Note from '../../util/note';
import { NOTE_NAMES, TONES } from '../../util/tones';
import $ from 'jquery';
import { keyMap } from '../../reducers/notes_reducer';
import NoteKey from './note_key';

class Synth extends React.Component {
  constructor () {
    super();
    this.notes = [];
    NOTE_NAMES.forEach( (name) => {
      this.notes.push([name, new Note(TONES[name])]);
    });
  }

  playNotes() {
    this.notes.forEach((note) => {
      note[1].stop();
      this.props.notes.forEach((keyCode) => {
        if (note[0] === keyMap[keyCode]) {
          note[1].start();
        }
        else {
          note[1].stop();
        }
      });
    });
  }

  componentDidMount() {
    $(document).on('keydown', e => this.onKeyDown(e));
    $(document).on('keyup', e => this.onKeyUp(e));
  }

  onKeyDown(e) {
    this.props.keyPressed(e.keyCode);
  }

  onKeyUp(e) {
    this.props.keyReleased(e.keyCode);
  }

  render () {
    this.playNotes.bind(this)();
    let li = this.notes.map( (note) => (<NoteKey note={note} /> ));
    return (<ul>
      {li}
    </ul>);
  }
}

export default Synth;
