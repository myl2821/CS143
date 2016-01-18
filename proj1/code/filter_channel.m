function output = filter_channel(channel, filter, padding_method)
	% apply fiter on single channel

	if nargin < 3
		padding_method = 0;
	end

	filter_size = size(filter);
	pad = floor(filter_size / 2);
	% just pad 0
	padded_channel = padarray(channel, pad, padding_method);
	channel_block_vec = im2col(padded_channel, filter_size, 'sliding');
	filter_vec = reshape(filter, 1, numel(filter));
	output_vec = filter_vec * channel_block_vec;

	output = reshape(output_vec, size(channel));
end

