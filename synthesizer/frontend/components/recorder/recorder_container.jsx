import {connect} from 'react-redux';
import Recorder from './recorder';
import {startRecording, stopRecording, addNotes} from '../../actions/tracks_actions';


const mapStateToProps = (state) => ({
  tracks: state.tracks,
  isRecording: state.isRecording
});

const mapDispatchToProps = (dispatch) => ({
  startRecording: () => dispatch(startRecording()),
  stopRecording: () => dispatch(stopRecording()),
  addNotes: (notes) => dispatch(addNotes(notes))
});

let RecorderContainer = connect(mapStateToProps, mapDispatchToProps)(Recorder);

export default RecorderContainer;
