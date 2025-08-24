function huffman_image()
    %  Step 1: Read image 
    img = imread('lena.png');       
    img_gray = rgb2gray(img);
    figure, imshow(img_gray), title('Original Image');

    pixels = img_gray(:);

    %  Frequency table 
    symbols = unique(pixels);
    freq = histc(pixels, symbols);
    prob = freq / sum(freq);

    % Huffman dictionary 
    dict = huffmandict(num2cell(symbols), prob);

    % Encode the image 
    huff_encoded = huffmanenco(num2cell(pixels), dict);

    % Sizes 
    orig_size = numel(pixels) * 8;
    huff_size = length(huff_encoded);

    fprintf('\n--- Huffman Encoding ---\n');
    fprintf('Original Size : %d bits (%.2f KB)\n', orig_size, orig_size/8/1024);
    fprintf('Huffman Encoded Size : %d bits (%.2f KB)\n', huff_size, huff_size/8/1024);
end
