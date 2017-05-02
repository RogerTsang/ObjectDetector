#pragma line 1 "C:/Users/zengh/Documents/xup/axi_stream_no_side_channel_data/example.cpp"
#pragma line 1 "<built-in>"
#pragma line 1 "<command-line>"
#pragma line 1 "C:/Users/zengh/Documents/xup/axi_stream_no_side_channel_data/example.cpp"
#pragma line 92 "C:/Users/zengh/Documents/xup/axi_stream_no_side_channel_data/example.cpp"
void example(int A[50], int B[50]) {
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B
#pragma empty_line
  int i;
#pragma empty_line
  for(i = 0; i < 50; i++){
    B[i] = A[i] + 5;
  }
}
