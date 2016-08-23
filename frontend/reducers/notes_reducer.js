import { NotesConstants } from '../actions/note_actions';
import { NOTE_NAMES } from '../util/tones';

const validKeys = [65, 83, 68, 70, 71];
const keyMap = {};

validKeys.forEach((key, idx) => {
  keyMap[key] = NOTE_NAMES[idx];
});

const notesReducer = (state = [], action) => {
  switch (action.type) {
    case NotesConstants.KEY_PRESSED:
      if (!state.includes(action.key) && validKeys.includes(action.key)) {
        return[...state, action.key];
      } else {
        return state;
      }
    case NotesConstants.KEY_RELEASED:
      let idx = state.indexOf(action.key);
      if (idx !== -1 && validKeys.includes(action.key)) {
        return [...state.slice(0, idx), ...state.slice(idx + 1)];
      } else {
        return state;
      }
    default:
      return state;
  }
};


export { notesReducer, keyMap };
