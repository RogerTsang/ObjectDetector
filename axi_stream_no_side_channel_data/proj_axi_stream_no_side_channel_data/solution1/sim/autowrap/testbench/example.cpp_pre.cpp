# 1 "C:/Users/zengh/Documents/xup/axi_stream_no_side_channel_data/example.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/zengh/Documents/xup/axi_stream_no_side_channel_data/example.cpp"
# 92 "C:/Users/zengh/Documents/xup/axi_stream_no_side_channel_data/example.cpp"
void example(int A[50], int B[50]) {
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B

  int i;

  for(i = 0; i < 50; i++){
    B[i] = A[i] + 5;
  }
}
