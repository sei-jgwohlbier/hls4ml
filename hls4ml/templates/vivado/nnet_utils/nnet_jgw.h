#ifndef _NNET_JGW_
#define _NNET_JGW_

template <class T>
void print_stream_array(hls::stream<T> & v)
{
    size_t i = 0;
    while (!v.empty()) {
        T val;
        v.read(val);
        std::cerr << "val[" << i << "]";
        for (size_t j=0; j<val.size; j++) {
            std::cerr << "[" << j << "]: " << val[j] << "\t";
        }
        std::cerr << std::endl;
        i++;
    }
}


#endif // _NNET_JGW_
