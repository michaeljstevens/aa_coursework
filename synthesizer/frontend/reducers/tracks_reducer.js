import {TracksConstants} from '../actions/tracks_actions.js';
import merge from 'lodash/merge';


let currTrackID = 0;

const tracksReducer = (state = {}, action) => {
  let strTrackID = currTrackID.toString();
  let newState = merge({}, state);
  switch (action.type) {
    case TracksConstants.START_RECORDING:
      currTrackID++;
      let newTrack = {
        id: currTrackID,
        name: `Track ${currTrackID}`,
        roll: [],
        timeStart: action.timeNow };
      newState[strTrackID] = newTrack;
      return newState;
    case TracksConstants.STOP_RECORDING:
      newState[strTrackID].roll = [{notes: [], timeSlice: action.timeNow - state[strTrackID].timeStart }];
      return newState;
    case TracksConstants.ADD_NOTES:
      let newRoll = {notes: action.notes, timeSlice: action.timeNow - state[strTrackID].timeStart};
      newState.roll.push(newRoll);
      return newState;
    default:
      return state;
  }
};

export default tracksReducer;

//{
// "1": {
//      id: 1,
//      name: 'Track 1',
//      roll:
//      [
//        { notes: [ 'A5' ], timeSlice: 1250191 },
//        { notes: [], timeSlice: 1255000 },
//        { notes: [ 'C5', 'D5' ], timeSlice: 1265180 }
//        { notes: [], timeSlice: 1279511 }
//      ],
//      timeStart: 1470164117527
//    },
//    "2": {
//      id: 2,
//      name: 'Track 2',
//      roll:
//      [
//        { notes: [ 'B5', 'C6', 'C6' ], timeSlice: 253386 },
//        { notes: [], timeSlice: 265216 }
//      ],
//      timeStart: 1470173676236
//    }
//}
