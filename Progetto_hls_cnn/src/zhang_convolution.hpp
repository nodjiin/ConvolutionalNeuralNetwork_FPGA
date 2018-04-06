#ifdef __cplusplus
extern "C" {
#endif
void zhang_cnn(
		volatile tensor_data_t *image,         // Read-Only Image
		volatile tensor_data_t *weights,       // Read-Only Weight Matrix
		volatile tensor_data_t *out,           // Output Filters/Images
		volatile tensor_data_t *bias,
		layer_config curr_layer		);
#ifdef __cplusplus
}
#endif

