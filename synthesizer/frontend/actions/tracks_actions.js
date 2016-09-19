const TracksConstants = {
  START_RECORDING: "START_RECORDING",
  STOP_RECORDING: "STOP_RECORDING",
  ADD_NOTES: "ADD_NOTES"
};


const startRecording = () => ({
  type: TracksConstants.START_RECORDING,
  timeNow: Date.now()
});

const stopRecording = () => ({
  type: TracksConstants.STOP_RECORDING,
  timeNow: Date.now()
});

const addNotes = (notes) => ({
  type: TracksConstants.AddNotes,
  timeNow: Date.now(),
  notes
});

export { TracksConstants, startRecording, stopRecording, addNotes };
